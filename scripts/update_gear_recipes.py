#!/usr/bin/env python3
"""Update datapack recipe values from scripts/gear.txt.

The gear file contains the balancing tables for weapon durability, attack speed,
stat splits, status effects, and armor stats. This script applies those values to
matching recipe JSON files listed in gear.txt resource-location folders.

It intentionally leaves combat flavor values that are not defined in gear.txt
alone, such as sweeping ratio and knockback.
"""

from __future__ import annotations

import argparse
import copy
import json
import math
import re
from pathlib import Path
from typing import Any


# ----------------------------------------------------------------------
# Preprocessor for the new gear.txt format
# ----------------------------------------------------------------------

def preprocess_gear_text(text: str) -> str:
    """Convert gear.txt (unquoted keys, comments, trailing commas) to valid JSON."""
    lines = text.splitlines()
    processed_lines = []
    in_resource_section = False
    
    for line in lines:
        stripped = line.strip()
        
        # Check for resource location header (commented or not)
        if "# Resource_locations:" in stripped:
            # Uncomment the header - remove the # and following space
            line = line.replace("# ", "", 1)
            if line.startswith("#"):
                line = line[1:].lstrip()
            in_resource_section = True
            processed_lines.append(line)
            continue
        
        # If we're in a resource section
        if in_resource_section:
            # Uncomment resource entries (lines starting with # and containing :)
            if stripped.startswith("#") and ":" in stripped:
                line = line.lstrip("# ").lstrip()
                if line.startswith("#"):
                    line = line[1:].lstrip()
                processed_lines.append(line)
                continue
            
            # Handle the opening brace if it's on its own line
            if stripped == "{":
                processed_lines.append(line)
                continue
            
            # Check if we're at the closing brace of the resource section
            if stripped == "}" or stripped == "},":
                in_resource_section = False
                if stripped.endswith(","):
                    line = line.rstrip(",")
                processed_lines.append(line)
                continue
        
        # Skip other comments
        if stripped.startswith("#"):
            continue
            
        processed_lines.append(line)
    
    text = "\n".join(processed_lines)
    
    # Remove trailing commas before } or ]
    text = re.sub(r',\s*([}\]])', r'\1', text)
    
    # Protect quoted strings while quoting keys
    strings = []
    def repl_string(m):
        strings.append(m.group(0))
        return f'__STRING_{len(strings)-1}__'
    text = re.sub(r'"[^"\\]*(?:\\.[^"\\]*)*"', repl_string, text)
    
    # Quote unquoted keys (word followed by colon)
    text = re.sub(r'(\b\w+\b)\s*:', r'"\1":', text)
    
    # Restore quoted strings
    for i, s in enumerate(strings):
        text = text.replace(f'__STRING_{i}__', s)
    
    return text


# ----------------------------------------------------------------------
# Parsing
# ----------------------------------------------------------------------

def parse_gear_file(path: Path) -> dict[str, dict[str, dict[str, Any]]]:
    """Parse the new gear.txt format and convert to the old internal structure."""
    raw = path.read_text(encoding="utf-8")
    json_text = preprocess_gear_text(raw)
    
    try:
        new_gear = json.loads(json_text)
    except json.JSONDecodeError as e:
        # Print the problematic section for debugging
        lines = json_text.splitlines()
        error_line = e.lineno - 1
        context_start = max(0, error_line - 3)
        context_end = min(len(lines), error_line + 3)
        print(f"JSON decode error at line {e.lineno}, column {e.colno}: {e.msg}")
        print("Context:")
        for i in range(context_start, context_end):
            marker = ">>> " if i == error_line else "    "
            print(f"{marker}{i+1}: {lines[i]}")
        raise

    # Build old-style gear structure from new data
    old_gear: dict[str, dict[str, dict[str, Any]]] = {
        "Weapons": {
            "Durability Modifiers": {},
            "DPS": {},
            "Attack Speed (Maxes out at 1 every 0.5s)": {},
            "Multipliers for the values higher up": {},
            "Stat Splits": {
                "Damage": {},
                "Status effects": {},
            },
            "Mining efficiency": {},
            "Resource Locations": {},
        },
        "Armor": {
            "Armor points": {},
            "Armor toughness points": {},
            "Movement efficiency": {},
            "Damage resistance": {},
            "Status resistance": {},
            "Armor Piece split (rougly adds up to 1)": {},
            "Resource Locations": {},
        },
    }

    weapons = new_gear.get("Weapons", {})
    armor = new_gear.get("Armor", {})

    # ---- Weapons ----
    old_gear["Weapons"]["Durability Modifiers"] = weapons.get("Durability", {})
    old_gear["Weapons"]["DPS"] = weapons.get("DPS", {})

    # Attack_speed: split into speed table and multiplier table
    speed_table = {}
    multiplier_table = {}
    attack_speed = weapons.get("Attack_speed", {})
    # Determine weapon types from DPS (exclude "Base")
    weapon_types = set(old_gear["Weapons"]["DPS"].keys()) - {"Base"}
    for key, val in attack_speed.items():
        if key == "Base" or key in weapon_types:
            speed_table[key] = val
        else:
            multiplier_table[key] = val
    old_gear["Weapons"]["Attack Speed (Maxes out at 1 every 0.5s)"] = speed_table
    old_gear["Weapons"]["Multipliers for the values higher up"] = multiplier_table

    old_gear["Weapons"]["Stat Splits"]["Damage"] = weapons.get("Split_Damage", {})

    # Status_effects: split into weapon table (with Default) and material table
    status_effects = weapons.get("Status_effects", {})
    weapon_status = {}
    material_status = {}
    for key, val in status_effects.items():
        if key == "Default" or key in weapon_types:
            weapon_status[key] = val
        else:
            material_status[key] = val
    old_gear["Weapons"]["Stat Splits"]["Status effects"] = {**weapon_status, **material_status}

    old_gear["Weapons"]["Mining efficiency"] = weapons.get("Mining_efficiency", {})
    old_gear["Weapons"]["Resource Locations"] = weapons.get("Resource_locations", {})

    # ---- Armor ----
    old_gear["Armor"]["Armor points"] = armor.get("Armor_points", {})
    old_gear["Armor"]["Armor toughness points"] = armor.get("Armor_toughness", {})
    old_gear["Armor"]["Movement efficiency"] = armor.get("Movement_efficiency", {})
    old_gear["Armor"]["Damage resistance"] = armor.get("Damage_resistance", {})
    old_gear["Armor"]["Status resistance"] = armor.get("Status_resistance", {})
    old_gear["Armor"]["Armor Piece split (rougly adds up to 1)"] = armor.get("Split", {})
    old_gear["Armor"]["Resource Locations"] = armor.get("Resource_locations", {})

    return old_gear


# ----------------------------------------------------------------------
# Utilities
# ----------------------------------------------------------------------

def canonical_number(value: float | int) -> float | int:
    number = float(value)
    rounded = round(number, 2)
    if abs(rounded - round(rounded)) < 1e-9:
        return int(round(rounded))
    return rounded


def set_attribute_amount(components: dict[str, Any], attribute_type: str, amount: float | int) -> tuple[bool, Any, Any]:
    """Returns (changed, old_value, new_value)."""
    modifiers = components.get("minecraft:attribute_modifiers")
    if not isinstance(modifiers, list):
        return False, None, None

    new_value = canonical_number(amount)
    updated = False
    old_value = None
    for modifier in modifiers:
        if isinstance(modifier, dict) and modifier.get("type") == attribute_type:
            if modifier.get("amount") != new_value:
                old_value = modifier.get("amount")
                modifier["amount"] = new_value
                updated = True
            else:
                old_value = new_value
    return updated, old_value, new_value


def ensure_attribute_modifier(
    components: dict[str, Any], 
    attribute_type: str, 
    amount: float | int, 
    operation: str = "add_value",
    slot: str = "mainhand",
    id_prefix: str = "content_lock.basic_weapon_stats"
) -> tuple[bool, Any, Any]:
    """Ensure an attribute modifier exists with the given parameters.

    Returns (changed, old_value, new_value).
    """
    modifiers = components.get("minecraft:attribute_modifiers")
    if not isinstance(modifiers, list):
        modifiers = []
        components["minecraft:attribute_modifiers"] = modifiers
    
    new_value = canonical_number(amount)
    # Check if the attribute already exists
    for modifier in modifiers:
        if isinstance(modifier, dict) and modifier.get("type") == attribute_type:
            old_value = modifier.get("amount")
            if old_value != new_value:
                modifier["amount"] = new_value
                return True, old_value, new_value
            return False, old_value, new_value
    
    # Add new modifier
    modifiers.append({
        "type": attribute_type,
        "id": id_prefix,
        "amount": new_value,
        "operation": operation,
        "slot": slot
    })
    return True, None, new_value


# ----------------------------------------------------------------------
# Detection helpers (dynamic)
# ----------------------------------------------------------------------

def get_weapon_materials(gear: dict[str, dict[str, dict[str, Any]]]) -> set[str]:
    """Return all material keys for weapons."""
    dur = gear["Weapons"]["Durability Modifiers"]
    weapon_types = set(gear["Weapons"]["DPS"].keys()) - {"Base"}
    return {k for k in dur.keys() if k not in weapon_types and k != "Base"}


def get_weapon_types(gear: dict[str, dict[str, dict[str, Any]]]) -> set[str]:
    """Return all weapon type keys (excluding Base)."""
    return set(gear["Weapons"]["DPS"].keys()) - {"Base"}


def get_armor_materials(gear: dict[str, dict[str, dict[str, Any]]]) -> set[str]:
    """Return all material keys for armor."""
    return set(gear["Armor"]["Armor points"].keys())


def get_armor_slots(gear: dict[str, dict[str, dict[str, Any]]]) -> set[str]:
    """Return all armor slot keys."""
    return set(gear["Armor"]["Armor Piece split (rougly adds up to 1)"].keys())


def detect_weapon(path: Path, gear: dict[str, dict[str, dict[str, Any]]]) -> tuple[str, str] | None:
    """Return (material_key, suffix) if path matches a weapon recipe, else None."""
    stem = path.stem
    weapon_types = get_weapon_types(gear)
    materials = get_weapon_materials(gear)

    for wtype in weapon_types:
        suffix = wtype.lower()
        if stem.endswith(f"_{suffix}"):
            material_prefix = stem[: -len(suffix) - 1]
            material_lower = material_prefix.lower()
            for mat in materials:
                if mat.lower() == material_lower:
                    return mat, suffix
            return None
    return None


def detect_armor(path: Path, gear: dict[str, dict[str, dict[str, Any]]]) -> tuple[str, str] | None:
    """Return (material_key, slot) if path matches an armor recipe, else None."""
    stem = path.stem
    slots = get_armor_slots(gear)
    materials = get_armor_materials(gear)

    for slot in slots:
        slot_lower = slot.lower()
        if stem.endswith(f"_{slot_lower}"):
            material_prefix = stem[: -len(slot_lower) - 1]
            for mat in materials:
                if mat.lower() == material_prefix.lower():
                    return mat, slot_lower
            return None
    return None


# ----------------------------------------------------------------------
# Recipe update functions
# ----------------------------------------------------------------------

def compute_weapon_attack_damage(
    gear: dict[str, dict[str, dict[str, Any]]],
    material_key: str,
    suffix: str,
) -> float:
    dps_table = gear["Weapons"]["DPS"]
    speed_table = gear["Weapons"]["Attack Speed (Maxes out at 1 every 0.5s)"]
    multipliers = gear["Weapons"]["Multipliers for the values higher up"]

    weapon_type = suffix.capitalize()

    base_dps = float(dps_table.get("Base", 1.0))
    weapon_dps = float(dps_table.get(weapon_type, 1.0))
    effective_attack_speed = float(speed_table.get(weapon_type, 1.0)) * float(multipliers.get(material_key, 1.0))

    if effective_attack_speed <= 0:
        raise ValueError(f"computed attack speed is not positive for {material_key}_{suffix}")

    return canonical_number((base_dps * weapon_dps) / effective_attack_speed)


def weapon_split_table(gear: dict[str, dict[str, dict[str, Any]]], material_key: str) -> dict[str, Any]:
    damage_tables = gear["Weapons"]["Stat Splits"]["Damage"]
    return damage_tables.get(material_key, damage_tables.get("Default", {}))


def weapon_status_tables(
    gear: dict[str, dict[str, dict[str, Any]]],
    material_key: str,
    suffix: str,
) -> tuple[dict[str, Any], dict[str, Any]]:
    status_tables = gear["Weapons"]["Stat Splits"]["Status effects"]
    weapon_type = suffix.capitalize()
    weapon_table = status_tables.get(weapon_type, status_tables.get("Default", {}))
    material_table = status_tables.get(material_key, {})
    return weapon_table, material_table


def build_weapon_damage_map(attack_damage: float, split_table: dict[str, Any]) -> dict[str, float]:
    damage_types = ["Physical", "Fire", "Frost", "Magic", "Wither", "Ender"]
    damage_map: dict[str, float] = {}
    for dtype in damage_types:
        value = attack_damage * float(split_table.get(dtype, 0.0))
        damage_map[dtype.lower()] = canonical_number(value)
    return damage_map


def build_weapon_status_map(
    effective_attack_speed: float,
    weapon_table: dict[str, Any],
    material_table: dict[str, Any],
) -> dict[str, float]:
    status_effects = ["Bleed", "Poison", "Corruption", "Wither", "Frostbite"]
    status_map: dict[str, float] = {}
    for effect in status_effects:
        weapon_val = float(weapon_table.get(effect, 0.0))
        material_val = float(material_table.get(effect, 1.0))
        value = (weapon_val * material_val) / effective_attack_speed if effective_attack_speed != 0 else 0.0
        status_map[effect.lower()] = canonical_number(value)
    return status_map


def lore_number(value: float | int) -> str:
    return str(int(math.floor(float(value))))


def build_weapon_lore(damage_map: dict[str, float], status_map: dict[str, float]) -> list[dict[str, Any]]:
    lore: list[dict[str, Any]] = [
        {
            "translate": "content_lock:weapons.damage",
            "fallback": "Damage",
            "bold": True,
        }
    ]

    damage_labels = [
        ("physical", "Physical", "blue"),
        ("fire", "Fire", "blue"),
        ("frost", "Frost", "blue"),
        ("magic", "Magic", "blue"),
        ("wither", "Wither", "blue"),
        ("ender", "Ender", "blue"),
    ]
    for key, label, color in damage_labels:
        lore.append(
            {
                "translate": f"content_lock.weapon.{key}",
                "fallback": f"{label}: ",
                "italic": False,
                "color": "gray",
                "extra": [
                    {
                        "text": lore_number(damage_map[key] * 10),
                        "italic": False,
                        "color": color,
                    }
                ],
            }
        )

    lore.append(
        {
            "translate": "content_lock:weapons.status_effects",
            "fallback": "Status Effects",
            "bold": True,
        }
    )

    status_labels = [
        ("bleed", "Bleed"),
        ("poison", "Poison"),
        ("corruption", "Corruption"),
        ("wither", "Wither"),
        ("frostbite", "Frostbite"),
    ]
    for key, label in status_labels:
        lore.append(
            {
                "translate": f"content_lock.weapon.status.{key}",
                "fallback": f"{label}: ",
                "italic": False,
                "color": "gray",
                "extra": [
                    {
                        "text": lore_number(status_map[key]),
                        "italic": False,
                        "color": "red",
                    }
                ],
            }
        )

    return lore


def ensure_weapon_custom_data(
    components: dict[str, Any],
    weapon_type: str,
    damage_map: dict[str, float],
    status_map: dict[str, float],
) -> tuple[dict[str, Any], bool, dict[str, Any], dict[str, Any]]:
    """Returns (weapon_data, changed, old_damage, old_status)."""
    existing_custom_data = components.get("custom_data")
    if not isinstance(existing_custom_data, dict):
        existing_custom_data = {}
    enchanted = existing_custom_data.get("content_lock:enchanted", False)

    weapon_data = existing_custom_data.get("content_lock:weapon")
    if not isinstance(weapon_data, dict):
        weapon_data = {}

    old_damage = copy.deepcopy(weapon_data.get("damage"))
    old_status = copy.deepcopy(weapon_data.get("status_effects"))

    weapon_data["type"] = weapon_type
    weapon_data["damage_type"] = "melee"
    weapon_data["damage"] = damage_map
    weapon_data["status_effects"] = status_map

    damage_types = ["Physical", "Fire", "Frost", "Magic", "Wither", "Ender"]
    status_effects = ["Bleed", "Poison", "Corruption", "Wither", "Frostbite"]

    existing_damage_modifiers = weapon_data.get("damage_modifiers")
    if not isinstance(existing_damage_modifiers, dict):
        weapon_data["damage_modifiers"] = {dtype.lower(): [] for dtype in damage_types}
    else:
        weapon_data["damage_modifiers"] = {
            dtype.lower(): existing_damage_modifiers.get(dtype.lower(), [])
            for dtype in damage_types
        }

    existing_status_modifiers = weapon_data.get("status_effect_modifiers")
    if not isinstance(existing_status_modifiers, dict):
        weapon_data["status_effect_modifiers"] = {effect.lower(): [] for effect in status_effects}
    else:
        weapon_data["status_effect_modifiers"] = {
            effect.lower(): existing_status_modifiers.get(effect.lower(), [])
            for effect in status_effects
        }

    # Ensure scaling exists
    if "scaling" not in weapon_data:
        weapon_data["scaling"] = {
            "strength": 1,
            "dexterity": 1.5,
            "notardness": 0,
            "promiles": 2.5
        }

    new_custom_data = {"content_lock:enchanted": enchanted}
    new_custom_data.update(existing_custom_data)
    new_custom_data["content_lock:weapon"] = weapon_data
    changed = components.get("custom_data") != new_custom_data
    components["custom_data"] = new_custom_data
    return weapon_data, changed, old_damage, old_status


def ensure_weapon_component(components: dict[str, Any]) -> tuple[bool, Any, Any]:
    """Ensure weapon durability decreases by ten per attack. Returns (changed, old, new)."""
    weapon_component = components.get("weapon")
    if not isinstance(weapon_component, dict):
        weapon_component = {}

    old_value = weapon_component.get("item_damage_per_attack")
    new_value = 10
    changed = old_value != new_value
    weapon_component["item_damage_per_attack"] = new_value
    components["weapon"] = weapon_component
    return changed, old_value, new_value


def set_tool_rule_speed(components: dict[str, Any], speed: float | int) -> tuple[bool, dict[str, Any], float | int]:
    """Returns (changed, {old speeds per rule index}, new speed)."""
    tool_component = components.get("minecraft:tool")
    if not isinstance(tool_component, dict):
        return False, {}, speed

    rules = tool_component.get("rules")
    if not isinstance(rules, list):
        return False, {}, speed

    expected_speed = canonical_number(speed)
    changed = False
    old_speeds: dict[str, Any] = {}
    for i, rule in enumerate(rules):
        if isinstance(rule, dict):
            old_val = rule.get("speed")
            if old_val != expected_speed:
                old_speeds[f"rules[{i}].speed"] = old_val
                rule["speed"] = expected_speed
                changed = True
    return changed, old_speeds, expected_speed


def set_tool_damage_per_block(components: dict[str, Any]) -> tuple[bool, Any, Any]:
    """Ensure minecraft:tool has damage_per_block set to 1. Returns (changed, old, new)."""
    tool_component = components.get("minecraft:tool")
    if not isinstance(tool_component, dict):
        return False, None, None

    old_value = tool_component.get("damage_per_block")
    new_value = 1
    if old_value != new_value:
        tool_component["damage_per_block"] = new_value
        return True, old_value, new_value
    return False, old_value, new_value


def ensure_minimum_attack_charge(components: dict[str, Any]) -> tuple[bool, Any, Any]:
    """Ensure the 'minimum_attack_charge' component exists. Returns (changed, old, new)."""
    old_value = components.get("minimum_attack_charge")
    new_value = 1
    if old_value != new_value:
        components["minimum_attack_charge"] = new_value
        return True, old_value, new_value
    return False, old_value, new_value


def build_armor_lore(
    damage_resistance: dict[str, float | int],
    status_resistance: dict[str, float | int],
) -> list[dict[str, Any]]:
    lore: list[dict[str, Any]] = [
        {
            "translate": "content_lock:armor.damage_resistance",
            "fallback": "Damage Resistance",
            "bold": True,
        }
    ]

    damage_labels = [
        ("physical", "Physical"),
        ("fire", "Fire"),
        ("frost", "Frost"),
        ("magic", "Magic"),
        ("wither", "Wither"),
        ("ender", "Ender"),
    ]
    for key, label in damage_labels:
        lore.append(
            {
                "translate": f"content_lock.weapon.{key}",
                "fallback": f"{label}: ",
                "italic": False,
                "color": "gray",
                "extra": [
                    {
                        "text": lore_number(damage_resistance[key]),
                        "italic": False,
                        "color": "blue",
                    }
                ],
            }
        )

    lore.append(
        {
            "translate": "content_lock:armor.status_resistance",
            "fallback": "Status Resistance",
            "bold": True,
        }
    )

    status_labels = [
        ("bleed", "Bleed"),
        ("poison", "Poison"),
        ("corruption", "Corruption"),
        ("wither", "Wither"),
        ("frostbite", "Frostbite"),
    ]
    for key, label in status_labels:
        lore.append(
            {
                "translate": f"content_lock.weapon.status.{key}",
                "fallback": f"{label}: ",
                "italic": False,
                "color": "gray",
                "extra": [
                    {
                        "text": lore_number(status_resistance[key]),
                        "italic": False,
                        "color": "red",
                    }
                ],
            }
        )

    return lore


def ensure_armor_custom_data(
    components: dict[str, Any],
    damage_resistance: dict[str, float | int],
    status_resistance: dict[str, float | int],
) -> tuple[bool, dict[str, Any], dict[str, Any]]:
    """Returns (changed, old_damage_resistance, old_status_resistance)."""
    existing_custom_data = components.get("custom_data")
    if not isinstance(existing_custom_data, dict):
        existing_custom_data = {}
    original_custom_data = copy.deepcopy(existing_custom_data)
    enchanted = existing_custom_data.get("content_lock:enchanted", False)

    armor_data = existing_custom_data.get("content_lock:armor")
    if not isinstance(armor_data, dict):
        armor_data = {}

    old_damage_resistance = copy.deepcopy(armor_data.get("damage_resistance"))
    old_status_resistance = copy.deepcopy(armor_data.get("status_resistance"))

    damage_types = ["physical", "fire", "frost", "magic", "wither", "ender"]
    status_effects = ["bleed", "poison", "corruption", "wither", "frostbite"]
    existing_damage_modifiers = armor_data.get("damage_resistance_modifiers")
    if not isinstance(existing_damage_modifiers, dict):
        existing_damage_modifiers = {}
    existing_status_modifiers = armor_data.get("status_resistance_modifiers")
    if not isinstance(existing_status_modifiers, dict):
        existing_status_modifiers = {}

    armor_data["damage_resistance"] = {
        key: canonical_number(damage_resistance[key]) for key in damage_types
    }
    armor_data["status_resistance"] = {
        key: canonical_number(status_resistance[key]) for key in status_effects
    }
    armor_data["damage_resistance_modifiers"] = {
        key: existing_damage_modifiers.get(key, [])
        for key in damage_types
    }
    armor_data["status_resistance_modifiers"] = {
        key: existing_status_modifiers.get(key, [])
        for key in status_effects
    }

    new_custom_data = {"content_lock:enchanted": enchanted}
    new_custom_data.update(existing_custom_data)
    new_custom_data["content_lock:armor"] = armor_data
    changed = original_custom_data != new_custom_data
    components["custom_data"] = new_custom_data
    return changed, old_damage_resistance, old_status_resistance


def update_weapon_recipe(
    path: Path,
    gear: dict[str, dict[str, dict[str, Any]]],
    apply_changes: bool,
) -> dict[str, Any]:
    """Returns a dict of change details (empty if no changes)."""
    detected = detect_weapon(path, gear)
    if detected is None:
        return {}

    material_key, suffix = detected
    weapon_type = suffix.capitalize()

    durability = gear["Weapons"]["Durability Modifiers"]
    speed = gear["Weapons"]["Attack Speed (Maxes out at 1 every 0.5s)"]
    multipliers = gear["Weapons"]["Multipliers for the values higher up"]
    mining_efficiency = gear["Weapons"].get("Mining efficiency", {})

    base_durability = float(durability.get("Base", 1.0))
    material_multiplier = float(durability.get(material_key, 1.0))
    tool_multiplier = float(durability.get(weapon_type, 1.0))
    max_damage = int(round(base_durability * material_multiplier * tool_multiplier))

    base_attack_speed = float(speed.get("Base", 1.0))
    target_attack_speed = float(speed.get(weapon_type, 1.0)) * float(multipliers.get(material_key, 1.0))
    attack_speed_amount = target_attack_speed - base_attack_speed
    attack_damage = compute_weapon_attack_damage(gear, material_key, suffix)

    damage_split = weapon_split_table(gear, material_key)
    damage_map = build_weapon_damage_map(attack_damage, damage_split)
    weapon_status_table, material_status_table = weapon_status_tables(gear, material_key, suffix)
    status_map = build_weapon_status_map(target_attack_speed, weapon_status_table, material_status_table)
    lore = build_weapon_lore(damage_map, status_map)

    data = json.loads(path.read_text(encoding="utf-8"))
    changes: dict[str, Any] = {}

    # Check if result exists
    if "result" not in data:
        return {}

    # Ensure result has components
    if "components" not in data["result"]:
        data["result"]["components"] = {}
        changes["components_created"] = True

    components = data["result"]["components"]
    if isinstance(components, dict):
        # Ensure weapon durability decreases by ten per attack.
        changed, old, new = ensure_weapon_component(components)
        if changed:
            changes["weapon.item_damage_per_attack"] = {"old": old, "new": new}

        # Apply the material mining-efficiency multiplier to every tool rule.
        mining_speed = float(mining_efficiency.get("Base", 2.0)) * float(
            mining_efficiency.get(material_key, 1.0)
        )
        changed, old_speeds, new_speed = set_tool_rule_speed(components, mining_speed)
        if changed:
            changes["minecraft:tool.rules.speed"] = {
                "old": old_speeds,
                "new": canonical_number(new_speed),
            }

        # Ensure damage_per_block is 1
        changed, old, new = set_tool_damage_per_block(components)
        if changed:
            changes["minecraft:tool.damage_per_block"] = {"old": old, "new": new}

        # Ensure minimum_attack_charge exists
        changed, old, new = ensure_minimum_attack_charge(components)
        if changed:
            changes["minimum_attack_charge"] = {"old": old, "new": new}

        # max_damage
        old_value = components.get("minecraft:max_damage")
        if old_value != max_damage:
            components["minecraft:max_damage"] = max_damage
            changes["minecraft:max_damage"] = {"old": old_value, "new": max_damage}
        
        # attack_damage - ensure it exists
        fixed_attack_damage = 0.01
        changed, old, new = ensure_attribute_modifier(
            components, "minecraft:attack_damage", fixed_attack_damage, "add_multiplied_total"
        )
        if changed:
            changes["minecraft:attribute_modifiers.attack_damage"] = {"old": old, "new": new}
        
        # attack_speed - ensure it exists
        changed, old, new = ensure_attribute_modifier(
            components, "minecraft:attack_speed", attack_speed_amount, "add_value"
        )
        if changed:
            changes["minecraft:attribute_modifiers.attack_speed"] = {"old": old, "new": new}

        # custom_data
        weapon_data, custom_data_changed, old_damage, old_status = ensure_weapon_custom_data(
            components, weapon_type, damage_map, status_map
        )
        if custom_data_changed:
            damage_diff = {
                k: {"old": (old_damage or {}).get(k), "new": v}
                for k, v in damage_map.items()
                if (old_damage or {}).get(k) != v
            }
            status_diff = {
                k: {"old": (old_status or {}).get(k), "new": v}
                for k, v in status_map.items()
                if (old_status or {}).get(k) != v
            }
            if damage_diff:
                changes["custom_data.content_lock:weapon.damage"] = damage_diff
            if status_diff:
                changes["custom_data.content_lock:weapon.status_effects"] = status_diff
            if not damage_diff and not status_diff:
                changes["custom_data"] = True

        # lore
        if components.get("lore") != lore:
            changes["lore"] = {"old": components.get("lore"), "new": lore}
        
        # tooltip_display
        tooltip_display = components.get("tooltip_display")
        expected_tooltip_display = {
            "hidden_components": ["minecraft:attribute_modifiers"]
        }
        if tooltip_display != expected_tooltip_display:
            changes["tooltip_display"] = {"old": tooltip_display, "new": expected_tooltip_display}

    if changes and apply_changes:
        path.write_text(json.dumps(data, indent=2, ensure_ascii=False) + "\n", encoding="utf-8")

    return changes


def update_armor_recipe(
    path: Path,
    gear: dict[str, dict[str, dict[str, Any]]],
    apply_changes: bool,
) -> dict[str, Any]:
    """Returns a dict of change details (empty if no changes)."""
    detected = detect_armor(path, gear)
    if detected is None:
        return {}

    material_key, slot = detected
    slot_key = slot.capitalize()

    armor = gear["Armor"]["Armor points"]
    toughness = gear["Armor"]["Armor toughness points"]
    movement = gear["Armor"]["Movement efficiency"]
    damage_resistance_tables = gear["Armor"]["Damage resistance"]
    status_resistance_tables = gear["Armor"]["Status resistance"]
    split = gear["Armor"]["Armor Piece split (rougly adds up to 1)"]

    piece_share = float(split.get(slot_key, 0.0))
    armor_value = float(armor.get(material_key, 0.0)) * piece_share
    toughness_value = float(toughness.get(material_key, 0.0)) * piece_share
    movement_value = float(movement.get(material_key, 0.0)) * piece_share
    damage_resistance_table = damage_resistance_tables.get(
        material_key,
        damage_resistance_tables.get("Default", {}),
    )
    status_resistance_table = status_resistance_tables.get(
        material_key,
        status_resistance_tables.get("Default", {}),
    )
    damage_types = ["Physical", "Fire", "Frost", "Magic", "Wither", "Ender"]
    status_effects = ["Bleed", "Poison", "Corruption", "Wither", "Frostbite"]
    damage_resistance = {
        key.lower(): float(damage_resistance_table.get(key, 0.0)) * piece_share
        for key in damage_types
    }
    status_resistance = {
        key.lower(): float(status_resistance_table.get(key, 0.0)) * piece_share
        for key in status_effects
    }
    armor_lore = build_armor_lore(damage_resistance, status_resistance)

    data = json.loads(path.read_text(encoding="utf-8"))
    changes: dict[str, Any] = {}

    # Check if result exists
    if "result" not in data:
        return {}

    # Ensure result has components
    if "components" not in data["result"]:
        data["result"]["components"] = {}
        changes["components_created"] = True

    components = data["result"]["components"]
    if isinstance(components, dict):
        changed, old, new = set_attribute_amount(components, "minecraft:armor", armor_value)
        if changed:
            changes["minecraft:attribute_modifiers.armor"] = {"old": old, "new": new}

        changed, old, new = set_attribute_amount(components, "minecraft:armor_toughness", toughness_value)
        if changed:
            changes["minecraft:attribute_modifiers.armor_toughness"] = {"old": old, "new": new}

        changed, old, new = set_attribute_amount(components, "minecraft:movement_efficiency", movement_value)
        if changed:
            changes["minecraft:attribute_modifiers.movement_efficiency"] = {"old": old, "new": new}

        changed, old_damage_res, old_status_res = ensure_armor_custom_data(
            components,
            damage_resistance,
            status_resistance,
        )
        if changed:
            damage_diff = {
                k: {"old": (old_damage_res or {}).get(k), "new": v}
                for k, v in damage_resistance.items()
                if (old_damage_res or {}).get(k) != canonical_number(v)
            }
            status_diff = {
                k: {"old": (old_status_res or {}).get(k), "new": v}
                for k, v in status_resistance.items()
                if (old_status_res or {}).get(k) != canonical_number(v)
            }
            if damage_diff:
                changes["custom_data.content_lock:armor.damage_resistance"] = damage_diff
            if status_diff:
                changes["custom_data.content_lock:armor.status_resistance"] = status_diff

        if components.get("lore") != armor_lore:
            changes["lore"] = {"old": components.get("lore"), "new": armor_lore}

    if changes and apply_changes:
        path.write_text(json.dumps(data, indent=2, ensure_ascii=False) + "\n", encoding="utf-8")

    return changes


# ----------------------------------------------------------------------
# File discovery
# ----------------------------------------------------------------------

def resolve_recipe_roots(gear: dict[str, dict[str, dict[str, Any]]], gear_file: Path) -> list[Path]:
    resource_tables = [
        gear["Weapons"].get("Resource Locations", {}),
        gear["Armor"].get("Resource Locations", {}),
    ]
    roots: list[Path] = []
    seen: set[Path] = set()

    for table in resource_tables:
        for raw_path in table.values():
            if not isinstance(raw_path, str) or not raw_path.strip():
                continue
            candidate = Path(raw_path).expanduser()
            if not candidate.is_absolute():
                candidate = (gear_file.parent / candidate).resolve()
            else:
                candidate = candidate.resolve()
            if candidate not in seen:
                seen.add(candidate)
                roots.append(candidate)

    return roots


def iter_recipe_files(gear: dict[str, dict[str, dict[str, Any]]], gear_file: Path) -> list[Path]:
    files: list[Path] = []
    seen: set[Path] = set()
    
    # Print debug info about resource locations
    weapon_resources = gear["Weapons"].get("Resource Locations", {})
    armor_resources = gear["Armor"].get("Resource Locations", {})
    
    print(f"Weapon resource locations: {list(weapon_resources.values())}")
    print(f"Armor resource locations: {list(armor_resources.values())}")
    
    for recipe_root in resolve_recipe_roots(gear, gear_file):
        print(f"Checking recipe root: {recipe_root}")
        if not recipe_root.is_dir():
            print(f"  WARNING: {recipe_root} is not a directory or doesn't exist")
            continue
        for recipe_path in sorted(recipe_root.rglob("*.json")):
            if recipe_path not in seen:
                seen.add(recipe_path)
                files.append(recipe_path)
                print(f"  Found recipe: {recipe_path}")
    
    return files


# ----------------------------------------------------------------------
# Change reporting
# ----------------------------------------------------------------------

def format_value(value: Any) -> str:
    """Format a value for readable display."""
    if value is None:
        return "<missing>"
    if isinstance(value, bool):
        return str(value)
    if isinstance(value, (int, float)):
        return str(value)
    if isinstance(value, str):
        return f'"{value}"'
    return json.dumps(value, ensure_ascii=False)


def format_diff(diff: dict[str, Any], indent: int = 0) -> list[str]:
    """Format a nested change dict into readable lines."""
    lines: list[str] = []
    prefix = "  " * indent
    for key, value in diff.items():
        if isinstance(value, dict) and "old" in value and "new" in value:
            old_str = format_value(value["old"])
            new_str = format_value(value["new"])
            lines.append(f"{prefix}{key}: {old_str} -> {new_str}")
        elif isinstance(value, dict):
            # Nested structure (e.g. per-damage-type diffs)
            lines.append(f"{prefix}{key}:")
            lines.extend(format_diff(value, indent + 1))
        else:
            lines.append(f"{prefix}{key}: {format_value(value)}")
    return lines


class ChangeReport:
    """Collects change details and writes a readable report to changes.txt."""

    def __init__(self, report_path: Path) -> None:
        self.report_path = report_path
        self.entries: list[tuple[Path, dict[str, Any]]] = []

    def add(self, path: Path, changes: dict[str, Any]) -> None:
        if changes:
            self.entries.append((path, changes))

    def write(self, apply_changes: bool) -> None:
        lines: list[str] = []
        mode = "APPLIED" if apply_changes else "DRY RUN (no files written)"
        lines.append("=" * 72)
        lines.append(f"Gear recipe update report — {mode}")
        lines.append("=" * 72)
        lines.append("")

        if not self.entries:
            lines.append("No changes detected. Everything is already up to date.")
        else:
            total_fields = 0
            for path, changes in self.entries:
                lines.append(f"FILE: {path}")
                lines.append("-" * 72)
                for change_lines in format_diff(changes):
                    lines.append(f"  {change_lines}")
                lines.append("")
                total_fields += 1
            lines.append("=" * 72)
            lines.append(f"Total files changed: {len(self.entries)}")
            lines.append("=" * 72)

        text = "\n".join(lines) + "\n"
        self.report_path.write_text(text, encoding="utf-8")

        # Also print to console
        print()
        print(text)


# ----------------------------------------------------------------------
# Main
# ----------------------------------------------------------------------

def main() -> int:
    parser = argparse.ArgumentParser(description="Apply gear.txt balancing values to recipe JSON files.")
    parser.add_argument(
        "--gear-file",
        type=Path,
        default=None,
        help="Path to gear.txt. Defaults to gear.txt beside this script.",
    )
    parser.add_argument(
        "--apply",
        action="store_true",
        help="Write changes back to disk. Without this flag the script only reports planned updates.",
    )
    parser.add_argument(
        "--debug",
        action="store_true",
        help="Print debug information about file discovery.",
    )
    args = parser.parse_args()

    gear_file = args.gear_file.resolve() if args.gear_file else Path(__file__).resolve().with_name("gear.txt")

    if not gear_file.is_file():
        raise SystemExit(f"gear file not found: {gear_file}")

    gear = parse_gear_file(gear_file)
    
    # Print the resolved resource locations for debugging
    if args.debug:
        print("\nParsed resource locations:")
        print(f"  Weapons: {gear['Weapons'].get('Resource Locations', {})}")
        print(f"  Armor: {gear['Armor'].get('Resource Locations', {})}")
        print()
    
    files = iter_recipe_files(gear, gear_file)

    if not files:
        print("No recipe JSON files found from gear.txt resource locations.")
        if args.debug:
            print("\nDebug: Make sure the paths in your gear.txt are correct.")
            print(f"Current working directory: {Path.cwd()}")
            print(f"gear.txt location: {gear_file}")
            print(f"gear.txt parent: {gear_file.parent}")
        return 0

    report_path = Path(__file__).resolve().with_name("changes.txt")
    report = ChangeReport(report_path)

    for recipe_path in files:
        if detect_weapon(recipe_path, gear) is not None:
            changes = update_weapon_recipe(recipe_path, gear, args.apply)
        elif detect_armor(recipe_path, gear) is not None:
            changes = update_armor_recipe(recipe_path, gear, args.apply)
        else:
            continue

        report.add(recipe_path, changes)

    report.write(args.apply)

    if not args.apply:
        print("No files were written. Re-run with --apply to save changes.")
    else:
        print(f"Report written to: {report_path}")

    return 0


if __name__ == "__main__":
    raise SystemExit(main())