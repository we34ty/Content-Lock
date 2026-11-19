#!/usr/bin/env python3
"""
26.3 biome conversion:
  creature_spawn_probability -> attributes."minecraft:gameplay/creature_world_gen_spawn_probability"
  spawn_costs + spawners     -> attributes."minecraft:gameplay/natural_mob_spawns"
                                {"argument": {"spawn_costs": ..., "spawns_by_category": ...}, "modifier": "overlay"}
  minCount/maxCount          -> "count": {"type": "uniform", "max_inclusive": .., "min_inclusive": ..}

The new attributes go right after "minecraft:audio/background_music", or at the end of "attributes".
Files that have no "spawners" / "spawn_costs" / "creature_spawn_probability" left are not touched.

Usage:
    python scripts/convert_biomes.py --dry-run
    python scripts/convert_biomes.py
"""
import argparse
import json
import sys
from pathlib import Path

MUSIC = "minecraft:audio/background_music"
PROBABILITY = "minecraft:gameplay/creature_world_gen_spawn_probability"
MOB_SPAWNS = "minecraft:gameplay/natural_mob_spawns"
OLD_KEYS = ("creature_spawn_probability", "spawn_costs", "spawners")

warnings = []


def convert_spawn(s, where):
    if not isinstance(s, dict) or ("minCount" not in s and "maxCount" not in s):
        return s
    lo = s.get("minCount", s.get("maxCount"))
    hi = s.get("maxCount", s.get("minCount"))
    if lo > hi:
        warnings.append(f"{where}: minCount {lo} > maxCount {hi} - swapped")
        lo, hi = hi, lo
    count = {"type": "uniform", "max_inclusive": hi, "min_inclusive": lo}
    out = {}
    for k, v in s.items():
        if k in ("minCount", "maxCount"):
            if "count" not in out:
                out["count"] = count
        else:
            out[k] = v
    return out


def convert_biome(b, where):
    if not isinstance(b, dict) or not any(k in b for k in OLD_KEYS):
        return b
    new_attrs = {}
    if "creature_spawn_probability" in b:
        new_attrs[PROBABILITY] = b["creature_spawn_probability"]
    if "spawn_costs" in b or "spawners" in b:
        spawners = b.get("spawners", {})
        by_category = {
            cat: [convert_spawn(s, f"{where} spawners.{cat}[{i}]") for i, s in enumerate(lst)]
            for cat, lst in spawners.items()
        }
        new_attrs[MOB_SPAWNS] = {
            "argument": {"spawn_costs": b.get("spawn_costs", {}), "spawns_by_category": by_category},
            "modifier": "overlay",
        }

    attrs = b.get("attributes", {})
    clash = [k for k in new_attrs if k in attrs]
    if clash:
        warnings.append(f"{where}: already has {', '.join(clash)} - skipped, merge by hand")
        return b

    merged = {}
    placed = False
    for k, v in attrs.items():
        merged[k] = v
        if k == MUSIC:
            merged.update(new_attrs)
            placed = True
    if not placed:
        merged.update(new_attrs)

    out = {}
    for k, v in b.items():
        if k in OLD_KEYS:
            continue
        out[k] = merged if k == "attributes" else v
    if "attributes" not in b:
        out = {"attributes": merged, **out}
    return out


def read_text(path):
    raw = path.read_bytes().decode("utf-8-sig")
    newline = "\r\n" if "\r\n" in raw else "\n"
    return raw.replace("\r\n", "\n"), newline


def detect_indent(text):
    for line in text.split("\n")[1:]:
        if line.strip():
            ws = line[: len(line) - len(line.lstrip())]
            if ws.startswith("\t"):
                return "\t"
            return len(ws) or 2
    return 2


def dump_json(data, original):
    body = original.strip()
    if "\n" not in body:
        s = json.dumps(data, ensure_ascii=False, separators=(",", ":"))
    else:
        s = json.dumps(data, ensure_ascii=False, indent=detect_indent(body))
    return s + ("\n" if original.endswith("\n") else "")


def main():
    ap = argparse.ArgumentParser(description="Convert biome spawn data to the 26.3 attribute format")
    ap.add_argument("pack", nargs="?", type=Path, default=Path(__file__).resolve().parent.parent)
    ap.add_argument("--dry-run", action="store_true")
    args = ap.parse_args()

    data_dir = args.pack.resolve() / "data"
    if not data_dir.is_dir():
        sys.exit(f"{data_dir} not found - pass the pack folder as the first argument")

    files = 0
    for path in sorted(data_dir.glob("*/worldgen/biome/**/*.json")):
        where = path.relative_to(data_dir).as_posix()
        text, newline = read_text(path)
        try:
            data = json.loads(text)
        except json.JSONDecodeError as e:
            warnings.append(f"{where}: invalid JSON, skipped ({e})")
            continue
        new = convert_biome(data, where)
        if new != data:
            files += 1
            if not args.dry_run:
                path.write_bytes(dump_json(new, text).replace("\n", newline).encode("utf-8"))

    print(f"{'Would convert' if args.dry_run else 'Converted'} {files} biome files")
    for w in warnings:
        print("  " + w)


if __name__ == "__main__":
    main()