#!/usr/bin/env python3
"""Update datapack recipe values from scripts/gear.txt.

The gear file contains the balancing tables for weapon durability, attack speed,
and armor stats. This script applies those values to matching recipe JSON files
listed in gear.txt resource-location folders.

It intentionally leaves combat flavor values that are not defined in gear.txt
alone, such as sweeping ratio and knockback.
"""

from __future__ import annotations

import argparse
import json
import re
from pathlib import Path
from typing import Any


WEAPON_DURABILITY_KEYS = [
    "Base",
    "Wood",
    "Stone",
    "Copper",
    "Iron",
    "Gold",
    "Diamond",
    "Netherite",
    "Sword",
    "Hoe",
    "Axe",
    "Pickaxe",
    "Shovel",
    "Spear",
]

WEAPON_DPS_KEYS = ["Base", "Sword", "Hoe", "Axe", "Pickaxe", "Shovel", "Spear"]
WEAPON_SPEED_KEYS = ["Base", "Sword", "Hoe", "Axe", "Pickaxe", "Shovel", "Spear"]
WEAPON_MULTIPLIER_KEYS = ["Wood", "Stone", "Copper", "Iron", "Gold", "Netherite", "Diamond"]
WEAPON_RESOURCE_KEYS = ["Wood", "Stone", "Copper", "Iron", "Gold", "Netherite", "Diamond"]

ARMOR_POINTS_KEYS = ["Leather", "Chainmail", "Copper", "Iron", "Gold", "Netherite", "Diamond"]
ARMOR_TOUGHNESS_KEYS = ["Leather", "Chainmail", "Copper", "Iron", "Gold", "Netherite", "Diamond"]
ARMOR_MOVEMENT_KEYS = ["Leather", "Chainmail", "Copper", "Iron", "Gold", "Netherite", "Diamond"]
ARMOR_SPLIT_KEYS = ["Helmet", "Chestplate", "Leggings", "Boots"]
ARMOR_RESOURCE_KEYS = ["Leather", "Chainmail", "Copper", "Iron", "Gold", "Netherite", "Diamond"]

WEAPON_SUFFIXES = {"sword", "axe", "pickaxe", "shovel", "hoe", "spear"}
ARMOR_SUFFIXES = {"helmet", "chestplate", "leggings", "boots"}

WEAPON_MATERIALS = {
    "wooden": "Wood",
    "stone": "Stone",
    "copper": "Copper",
    "iron": "Iron",
    "golden": "Gold",
    "diamond": "Diamond",
    "netherite": "Netherite",
}

ARMOR_MATERIALS = {
    "leather": "Leather",
    "chainmail": "Chainmail",
    "copper": "Copper",
    "iron": "Iron",
    "golden": "Gold",
    "diamond": "Diamond",
    "netherite": "Netherite",
}

SUFFIX_TO_TOOL = {
    "sword": "Sword",
    "spear": "Spear",
    "hoe": "Hoe",
    "axe": "Axe",
    "pickaxe": "Pickaxe",
    "shovel": "Shovel",
}

SUFFIX_TO_SLOT = {
    "helmet": "Helmet",
    "chestplate": "Chestplate",
    "leggings": "Leggings",
    "boots": "Boots",
}


def parse_value(raw_value: str) -> Any:
    value = raw_value.strip()
    if value.startswith('"') and value.endswith('"') and len(value) >= 2:
        return value[1:-1]
    if re.fullmatch(r"-?\d+", value):
        return int(value)
    if re.fullmatch(r"-?\d+(?:\.\d+)?", value):
        return float(value)
    return value


def parse_gear_file(path: Path) -> dict[str, dict[str, dict[str, Any]]]:
    lines = [line.strip() for line in path.read_text(encoding="utf-8").splitlines()]
    data_lines = [line for line in lines if line and not line.startswith("#")]
    gear: dict[str, dict[str, dict[str, Any]]] = {"Weapons": {}, "Armor": {}}
    index = 0

    def consume_table(section: str, table_name: str, keys: list[str]) -> None:
        nonlocal index
        table: dict[str, Any] = {}
        for expected_key in keys:
            if index >= len(data_lines):
                raise ValueError(f"gear.txt ended early while reading {section} / {table_name}")
            line = data_lines[index]
            if ":" not in line:
                raise ValueError(f"invalid gear.txt line: {line!r}")
            actual_key, raw_value = line.split(":", 1)
            actual_key = actual_key.strip()
            if actual_key != expected_key:
                raise ValueError(
                    f"expected {expected_key!r} while reading {section} / {table_name}, got {actual_key!r}"
                )
            table[actual_key] = parse_value(raw_value)
            index += 1
        gear[section][table_name] = table

    consume_table("Weapons", "Durability Modifiers", WEAPON_DURABILITY_KEYS)
    consume_table("Weapons", "DPS", WEAPON_DPS_KEYS)
    consume_table("Weapons", "Attack Speed (Maxes out at 1 every 0.5s)", WEAPON_SPEED_KEYS)
    consume_table("Weapons", "Multipliers for the values higher up", WEAPON_MULTIPLIER_KEYS)
    consume_table("Weapons", "Resource Locations", WEAPON_RESOURCE_KEYS)
    consume_table("Armor", "Armor points", ARMOR_POINTS_KEYS)
    consume_table("Armor", "Armor toughness points", ARMOR_TOUGHNESS_KEYS)
    consume_table("Armor", "Movement efficiency", ARMOR_MOVEMENT_KEYS)
    consume_table("Armor", "Armor Piece split (rougly adds up to 1)", ARMOR_SPLIT_KEYS)
    consume_table("Armor", "Resource Locations", ARMOR_RESOURCE_KEYS)

    if index != len(data_lines):
        leftover = data_lines[index:]
        raise ValueError(f"unexpected extra data in gear.txt: {leftover!r}")

    return gear


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


def compute_weapon_attack_damage(
    gear: dict[str, dict[str, dict[str, Any]]],
    material_key: str,
    suffix: str,
) -> float:
    dps_table = gear["Weapons"]["DPS"]
    speed_table = gear["Weapons"]["Attack Speed (Maxes out at 1 every 0.5s)"]
    multipliers = gear["Weapons"]["Multipliers for the values higher up"]

    base_dps = float(dps_table["Base"])
    weapon_dps = float(dps_table[SUFFIX_TO_TOOL[suffix]])
    effective_attack_speed = float(speed_table[SUFFIX_TO_TOOL[suffix]]) * float(multipliers[material_key])

    if effective_attack_speed <= 0:
        raise ValueError(f"computed attack speed is not positive for {material_key}_{suffix}")

    return canonical_number((base_dps * weapon_dps) / effective_attack_speed)


def detect_weapon(path: Path) -> tuple[str, str] | None:
    stem = path.stem
    for suffix in sorted(WEAPON_SUFFIXES, key=len, reverse=True):
        suffix_token = f"_{suffix}"
        if stem.endswith(suffix_token):
            material_prefix = stem[: -len(suffix_token)]
            material_key = WEAPON_MATERIALS.get(material_prefix)
            if material_key is None:
                return None
            return material_key, suffix
    return None


def detect_armor(path: Path) -> tuple[str, str] | None:
    stem = path.stem
    for suffix in ARMOR_SUFFIXES:
        suffix_token = f"_{suffix}"
        if stem.endswith(suffix_token):
            material_prefix = stem[: -len(suffix_token)]
            material_key = ARMOR_MATERIALS.get(material_prefix)
            if material_key is None:
                return None
            return material_key, suffix
    return None


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
    for recipe_root in resolve_recipe_roots(gear, gear_file):
        if not recipe_root.is_dir():
            continue
        for recipe_path in sorted(recipe_root.rglob("*.json")):
            if recipe_path not in seen:
                seen.add(recipe_path)
                files.append(recipe_path)
    return files


def update_weapon_recipe(
    path: Path,
    gear: dict[str, dict[str, dict[str, Any]]],
    apply_changes: bool,
) -> list[str]:
    detected = detect_weapon(path)
    if detected is None:
        return []

    material_key, suffix = detected
    tool_key = SUFFIX_TO_TOOL[suffix]

    durability = gear["Weapons"]["Durability Modifiers"]
    speed = gear["Weapons"]["Attack Speed (Maxes out at 1 every 0.5s)"]
    multipliers = gear["Weapons"]["Multipliers for the values higher up"]

    base_durability = float(durability["Base"])
    material_multiplier = float(durability[material_key])
    tool_multiplier = float(durability[tool_key])
    max_damage = int(round(base_durability * material_multiplier * tool_multiplier))

    base_attack_speed = float(speed["Base"])
    target_attack_speed = float(speed[tool_key]) * float(multipliers[material_key])
    attack_speed_amount = target_attack_speed - base_attack_speed
    attack_damage = compute_weapon_attack_damage(gear, material_key, suffix)

    data = json.loads(path.read_text(encoding="utf-8"))
    changes: list[str] = []

    components = data.get("result", {}).get("components", {})
    if isinstance(components, dict):
        if components.get("minecraft:max_damage") != max_damage:
            components["minecraft:max_damage"] = max_damage
            changes.append(f"max_damage={max_damage}")
        if set_attribute_amount(components, "minecraft:attack_damage", attack_damage):
            changes.append(f"attack_damage={canonical_number(attack_damage)}")
        if set_attribute_amount(components, "minecraft:attack_speed", attack_speed_amount):
            changes.append(f"attack_speed={canonical_number(attack_speed_amount)}")

    if changes and apply_changes:
        path.write_text(json.dumps(data, indent=2, ensure_ascii=False) + "\n", encoding="utf-8")

    return changes


def update_armor_recipe(
    path: Path,
    gear: dict[str, dict[str, dict[str, Any]]],
    apply_changes: bool,
) -> list[str]:
    detected = detect_armor(path)
    if detected is None:
        return []

    material_key, suffix = detected
    slot_key = SUFFIX_TO_SLOT[suffix]

    armor = gear["Armor"]["Armor points"]
    toughness = gear["Armor"]["Armor toughness points"]
    movement = gear["Armor"]["Movement efficiency"]
    split = gear["Armor"]["Armor Piece split (rougly adds up to 1)"]

    piece_share = float(split[slot_key])
    armor_value = float(armor[material_key]) * piece_share
    toughness_value = float(toughness[material_key]) * piece_share
    movement_value = float(movement[material_key]) * piece_share

    data = json.loads(path.read_text(encoding="utf-8"))
    changes: list[str] = []

    components = data.get("result", {}).get("components", {})
    if isinstance(components, dict):
        if set_attribute_amount(components, "minecraft:armor", armor_value):
            changes.append(f"armor={canonical_number(armor_value)}")
        if set_attribute_amount(components, "minecraft:armor_toughness", toughness_value):
            changes.append(f"armor_toughness={canonical_number(toughness_value)}")
        if set_attribute_amount(components, "minecraft:movement_efficiency", movement_value):
            changes.append(f"movement_efficiency={canonical_number(movement_value)}")

    if changes and apply_changes:
        path.write_text(json.dumps(data, indent=2, ensure_ascii=False) + "\n", encoding="utf-8")

    return changes


def iter_recipe_files(root: Path) -> list[Path]:
    recipe_roots = [root / "data" / "minecraft" / "recipe", root / "data" / "content_lock" / "recipe"]
    files: list[Path] = []
    for recipe_root in recipe_roots:
        if recipe_root.is_dir():
            files.extend(sorted(recipe_root.glob("*.json")))
    return files


def main() -> int:
    parser = argparse.ArgumentParser(description="Apply gear.txt balancing values to recipe JSON files.")
    parser.add_argument(
        "--root",
        type=Path,
        default=Path(__file__).resolve().parent.parent,
        help="Datapack root directory. Defaults to the repository root.",
    )
    parser.add_argument(
        "--gear-file",
        type=Path,
        default=None,
        help="Path to gear.txt. Defaults to scripts/gear.txt under the root.",
    )
    parser.add_argument(
        "--apply",
        action="store_true",
        help="Write changes back to disk. Without this flag the script only reports planned updates.",
    )
    args = parser.parse_args()

    root = args.root.resolve()
    gear_file = args.gear_file.resolve() if args.gear_file else root / "scripts" / "gear.txt"

    if not gear_file.is_file():
        raise SystemExit(f"gear file not found: {gear_file}")

    gear = parse_gear_file(gear_file)
    files = iter_recipe_files(root)

    if not files:
        print(f"No recipe JSON files found under {root / 'data'}")
        return 0

    total_changes = 0
    for recipe_path in files:
        if detect_weapon(recipe_path) is not None:
            changes = update_weapon_recipe(recipe_path, gear, args.apply)
        elif detect_armor(recipe_path) is not None:
            changes = update_armor_recipe(recipe_path, gear, args.apply)
        else:
            continue

        if changes:
            total_changes += len(changes)
            action = "updated" if args.apply else "would update"
            print(f"{action}: {recipe_path.relative_to(root)} -> {', '.join(changes)}")

    if not args.apply:
        print("\nNo files were written. Re-run with --apply to save changes.")
    else:
        print(f"\nApplied {total_changes} field updates.")

    return 0


if __name__ == "__main__":
    raise SystemExit(main())