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


def set_attribute_amount(components: dict[str, Any], attribute_type: str, amount: float | int) -> bool:
    modifiers = components.get("minecraft:attribute_modifiers")
    if not isinstance(modifiers, list):
        return False

    updated = False
    for modifier in modifiers:
        if isinstance(modifier, dict) and modifier.get("type") == attribute_type:
            modifier["amount"] = canonical_number(amount)
            updated = True
    return updated


def ensure_attribute_modifier(
    components: dict[str, Any], 
    attribute_type: str, 
    amount: float | int, 
    operation: str = "add_value",
    slot: str = "mainhand",
    id_prefix: str = "content_lock.basic_weapon_stats"
) -> bool:
    """Ensure an attribute modifier exists with the given parameters."""
    modifiers = components.get("minecraft:attribute_modifiers")
    if not isinstance(modifiers, list):
        modifiers = []
        components["minecraft:attribute_modifiers"] = modifiers
    
    # Check if the attribute already exists
    for modifier in modifiers:
        if isinstance(modifier, dict) and modifier.get("type") == attribute_type:
            modifier["amount"] = canonical_number(amount)
            return True
    
    # Add new modifier
    modifiers.append({
        "type": attribute_type,
        "id": id_prefix,
        "amount": canonical_number(amount),
        "operation": operation,
        "slot": slot
    })
    return True


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
) -> tuple[dict[str, Any], bool]:
    existing_custom_data = components.get("custom_data")
    if not isinstance(existing_custom_data, dict):
        existing_custom_data = {}

    weapon_data = existing_custom_data.get("content_lock:weapon")
    if not isinstance(weapon_data, dict):
        weapon_data = {}

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

    new_custom_data = dict(existing_custom_data)
    new_custom_data["content_lock:weapon"] = weapon_data
    changed = components.get("custom_data") != new_custom_data
    components["custom_data"] = new_custom_data
    return weapon_data, changed


def ensure_weapon_component(components: dict[str, Any]) -> bool:
    """Ensure the 'weapon' component exists with default values."""
    if "weapon" not in components:
        components["weapon"] = {
            "item_damage_per_attack": 1
        }
        return True
    return False


def ensure_minimum_attack_charge(components: dict[str, Any]) -> bool:
    """Ensure the 'minimum_attack_charge' component exists."""
    if "minimum_attack_charge" not in components:
        components["minimum_attack_charge"] = 1
        return True
    return False


def build_armor_lore(
    damage_resistance: dict[str, float | int],
    status_resistance: dict[str, float | int],
    weight: float | int,
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

    lore.extend(
        [
            {"text": ""},
            {
                "translate": "content_lock.armor.weight",
                "fallback": "Weight: ",
                "italic": False,
                "color": "gold",
                "extra": [
                    {
                        "text": f"{lore_number(float(weight) * 100)}%",
                        "italic": False,
                        "color": "red",
                    }
                ],
            },
        ]
    )
    return lore


def ensure_armor_custom_data(
    components: dict[str, Any],
    weight: float | int,
    damage_resistance: dict[str, float | int],
    status_resistance: dict[str, float | int],
) -> bool:
    existing_custom_data = components.get("custom_data")
    if not isinstance(existing_custom_data, dict):
        existing_custom_data = {}
    original_custom_data = copy.deepcopy(existing_custom_data)

    armor_data = existing_custom_data.get("content_lock:armor")
    if not isinstance(armor_data, dict):
        armor_data = {}

    damage_types = ["physical", "fire", "frost", "magic", "wither", "ender"]
    status_effects = ["bleed", "poison", "corruption", "wither", "frostbite"]
    existing_damage_modifiers = armor_data.get("damage_resistance_modifiers")
    if not isinstance(existing_damage_modifiers, dict):
        existing_damage_modifiers = {}
    existing_status_modifiers = armor_data.get("status_resistance_modifiers")
    if not isinstance(existing_status_modifiers, dict):
        existing_status_modifiers = {}

    armor_data["weight"] = canonical_number(weight)
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

    new_custom_data = dict(existing_custom_data)
    new_custom_data["content_lock:armor"] = armor_data
    changed = original_custom_data != new_custom_data
    components["custom_data"] = new_custom_data
    return changed


def update_weapon_recipe(
    path: Path,
    gear: dict[str, dict[str, dict[str, Any]]],
    apply_changes: bool,
) -> list[str]:
    detected = detect_weapon(path, gear)
    if detected is None:
        return []

    material_key, suffix = detected
    weapon_type = suffix.capitalize()

    durability = gear["Weapons"]["Durability Modifiers"]
    speed = gear["Weapons"]["Attack Speed (Maxes out at 1 every 0.5s)"]
    multipliers = gear["Weapons"]["Multipliers for the values higher up"]

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
    changes: list[str] = []

    # Check if result exists
    if "result" not in data:
        return []

    # Ensure result has components
    if "components" not in data["result"]:
        data["result"]["components"] = {}
        changes.append("components_created")

    components = data["result"]["components"]
    if isinstance(components, dict):
        # Ensure weapon component exists
        if ensure_weapon_component(components):
            changes.append("weapon_component_added")
        
        # Ensure minimum_attack_charge exists
        if ensure_minimum_attack_charge(components):
            changes.append("minimum_attack_charge_added")

        # max_damage
        if components.get("minecraft:max_damage") != max_damage:
            components["minecraft:max_damage"] = max_damage
            changes.append(f"max_damage={max_damage}")
        
        # attack_damage - ensure it exists
        fixed_attack_damage = 0.01
        if ensure_attribute_modifier(components, "minecraft:attack_damage", fixed_attack_damage, "add_multiplied_total"):
            changes.append(f"attack_damage={canonical_number(fixed_attack_damage)}")
        
        # attack_speed - ensure it exists
        if ensure_attribute_modifier(components, "minecraft:attack_speed", attack_speed_amount, "add_value"):
            changes.append(f"attack_speed={canonical_number(attack_speed_amount)}")

        # custom_data
        _, custom_data_changed = ensure_weapon_custom_data(components, weapon_type, damage_map, status_map)
        if custom_data_changed:
            changes.append("custom_data")

        # lore
        if components.get("lore") != lore:
            components["lore"] = lore
            changes.append("lore")
        
        # tooltip_display
        tooltip_display = components.get("tooltip_display")
        expected_tooltip_display = {
            "hidden_components": ["minecraft:attribute_modifiers"]
        }
        if tooltip_display != expected_tooltip_display:
            components["tooltip_display"] = expected_tooltip_display
            changes.append("tooltip_display")

    if changes and apply_changes:
        path.write_text(json.dumps(data, indent=2, ensure_ascii=False) + "\n", encoding="utf-8")

    return changes


def update_armor_recipe(
    path: Path,
    gear: dict[str, dict[str, dict[str, Any]]],
    apply_changes: bool,
) -> list[str]:
    detected = detect_armor(path, gear)
    if detected is None:
        return []

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
    armor_lore = build_armor_lore(damage_resistance, status_resistance, movement_value)

    data = json.loads(path.read_text(encoding="utf-8"))
    changes: list[str] = []

    # Check if result exists
    if "result" not in data:
        return []

    # Ensure result has components
    if "components" not in data["result"]:
        data["result"]["components"] = {}
        changes.append("components_created")

    components = data["result"]["components"]
    if isinstance(components, dict):
        if set_attribute_amount(components, "minecraft:armor", armor_value):
            changes.append(f"armor={canonical_number(armor_value)}")
        if set_attribute_amount(components, "minecraft:armor_toughness", toughness_value):
            changes.append(f"armor_toughness={canonical_number(toughness_value)}")
        if set_attribute_amount(components, "minecraft:movement_efficiency", movement_value):
            changes.append(f"movement_efficiency={canonical_number(movement_value)}")
        if ensure_armor_custom_data(
            components,
            movement_value,
            damage_resistance,
            status_resistance,
        ):
            changes.append("custom_data")
        if components.get("lore") != armor_lore:
            components["lore"] = armor_lore
            changes.append("lore")

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

    total_changes = 0
    for recipe_path in files:
        if detect_weapon(recipe_path, gear) is not None:
            changes = update_weapon_recipe(recipe_path, gear, args.apply)
        elif detect_armor(recipe_path, gear) is not None:
            changes = update_armor_recipe(recipe_path, gear, args.apply)
        else:
            continue

        if changes:
            total_changes += len(changes)
            action = "updated" if args.apply else "would update"
            print(f"{action}: {recipe_path} -> {', '.join(changes)}")

    if not args.apply:
        print("\nNo files were written. Re-run with --apply to save changes.")
    else:
        print(f"\nApplied {total_changes} field updates.")

    return 0


if __name__ == "__main__":
    raise SystemExit(main())