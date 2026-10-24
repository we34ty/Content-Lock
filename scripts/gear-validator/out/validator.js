"use strict";
var __createBinding = (this && this.__createBinding) || (Object.create ? (function(o, m, k, k2) {
    if (k2 === undefined) k2 = k;
    var desc = Object.getOwnPropertyDescriptor(m, k);
    if (!desc || ("get" in desc ? !m.__esModule : desc.writable || desc.configurable)) {
      desc = { enumerable: true, get: function() { return m[k]; } };
    }
    Object.defineProperty(o, k2, desc);
}) : (function(o, m, k, k2) {
    if (k2 === undefined) k2 = k;
    o[k2] = m[k];
}));
var __setModuleDefault = (this && this.__setModuleDefault) || (Object.create ? (function(o, v) {
    Object.defineProperty(o, "default", { enumerable: true, value: v });
}) : function(o, v) {
    o["default"] = v;
});
var __importStar = (this && this.__importStar) || (function () {
    var ownKeys = function(o) {
        ownKeys = Object.getOwnPropertyNames || function (o) {
            var ar = [];
            for (var k in o) if (Object.prototype.hasOwnProperty.call(o, k)) ar[ar.length] = k;
            return ar;
        };
        return ownKeys(o);
    };
    return function (mod) {
        if (mod && mod.__esModule) return mod;
        var result = {};
        if (mod != null) for (var k = ownKeys(mod), i = 0; i < k.length; i++) if (k[i] !== "default") __createBinding(result, mod, k[i]);
        __setModuleDefault(result, mod);
        return result;
    };
})();
Object.defineProperty(exports, "__esModule", { value: true });
exports.validateGear = validateGear;
const vscode = __importStar(require("vscode"));
const WEAPON_TYPES = ["Sword", "Hoe", "Axe", "Pickaxe", "Shovel", "Spear"];
const DAMAGE_TYPES = ["Physical", "Fire", "Frost", "Magic", "Wither", "Ender"];
const STATUS_EFFECTS = ["Bleed", "Poison", "Corruption", "Wither", "Frostbite"];
const ARMOR_SLOTS = ["Helmet", "Chestplate", "Leggings", "Boots"];
const isObject = (v) => typeof v === "object" && v !== null && !Array.isArray(v);
const isNum = (v) => typeof v === "number" && isFinite(v);
const isStr = (v) => typeof v === "string";
function findObjectRange(lines, key, searchStart = 0) {
    const re = new RegExp(`^\\s*(?:#\\s*)?${key}\\s*:\\s*\\{`);
    let start = -1;
    for (let i = searchStart; i < lines.length; i++) {
        if (re.test(lines[i])) {
            start = i;
            break;
        }
    }
    if (start === -1)
        return null;
    let depth = 0, opened = false;
    for (let i = start; i < lines.length; i++) {
        const line = lines[i];
        let inStr = false;
        for (let j = 0; j < line.length; j++) {
            const c = line[j];
            if (c === '"' && line[j - 1] !== "\\")
                inStr = !inStr;
            if (inStr)
                continue;
            if (c === "#")
                break;
            if (c === "{") {
                depth++;
                opened = true;
            }
            else if (c === "}") {
                depth--;
            }
        }
        if (opened && depth === 0)
            return [start, i];
    }
    return [start, lines.length - 1];
}
function findKeyLine(lines, key, start = 0, end = lines.length) {
    const esc = key.replace(/[.*+?^${}()|[\]\\]/g, "\\$&");
    const re = new RegExp(`(^|\\s|#)${esc}\\s*:`);
    for (let i = start; i < end; i++) {
        if (re.test(lines[i]))
            return i;
    }
    return -1;
}
// --- NEW: Detect Duplicate Keys ---
function findDuplicateKeys(lines) {
    const errors = [];
    const context = [];
    const seenKeys = new Map();
    for (let i = 0; i < lines.length; i++) {
        const line = lines[i];
        let inString = false;
        for (let j = 0; j < line.length; j++) {
            const c = line[j];
            if (c === '#' && !inString)
                break; // Ignore comments
            if (c === '"' && line[j - 1] !== '\\')
                inString = !inString;
            if (inString)
                continue;
            if (c === '{') {
                const before = line.slice(0, j).trimEnd();
                const match = before.match(/([A-Za-z_][A-Za-z0-9_]*)\s*:\s*$/);
                context.push(match ? match[1] : "anonymous");
            }
            else if (c === '}') {
                context.pop();
            }
            else if (c === '[') {
                context.push("array");
            }
            else if (c === ']') {
                context.pop();
            }
            else if (c === ':') {
                const before = line.slice(0, j).trimEnd();
                const match = before.match(/([A-Za-z_][A-Za-z0-9_]*)\s*$/);
                if (match) {
                    const keyName = match[1];
                    const charBefore = before[match.index - 1];
                    if (charBefore && /[A-Za-z0-9_]/.test(charBefore))
                        continue;
                    const currentPath = context.join('.');
                    if (!seenKeys.has(currentPath))
                        seenKeys.set(currentPath, new Set());
                    const keys = seenKeys.get(currentPath);
                    if (keys.has(keyName)) {
                        const startCol = before.lastIndexOf(keyName);
                        errors.push({
                            line: i,
                            startCol: startCol,
                            endCol: startCol + keyName.length,
                            message: `Duplicate key '${keyName}' in '${currentPath || 'root'}'`,
                            severity: vscode.DiagnosticSeverity.Error
                        });
                    }
                    else {
                        keys.add(keyName);
                    }
                }
            }
        }
    }
    return errors;
}
function validateGear(obj, lines) {
    const errors = [];
    const emit = (message, key, range, severity = vscode.DiagnosticSeverity.Error) => {
        let line = 0, startCol = 0, endCol = 0;
        if (key && range) {
            const found = findKeyLine(lines, key, range[0], range[1]);
            if (found >= 0) {
                line = found;
                const text = lines[line];
                startCol = text.length - text.trimStart().length;
                endCol = text.length;
            }
        }
        errors.push({ line, startCol, endCol, message, severity });
    };
    if (!isObject(obj)) {
        emit("Root value is not an object", undefined, null);
        return errors;
    }
    const weaponsRange = findObjectRange(lines, "Weapons");
    const armorRange = findObjectRange(lines, "Armor");
    if (!isObject(obj.Weapons)) {
        emit("Missing 'Weapons' object", "Weapons", null);
    }
    if (!isObject(obj.Armor)) {
        emit("Missing 'Armor' object", "Armor", null);
    }
    // ---------- Weapons ----------
    if (isObject(obj.Weapons)) {
        const W = obj.Weapons;
        const durRange = weaponsRange ? findObjectRange(lines, "Durability", weaponsRange[0]) : null;
        const dpsRange = weaponsRange ? findObjectRange(lines, "DPS", weaponsRange[0]) : null;
        const atkRange = weaponsRange ? findObjectRange(lines, "Attack_speed", weaponsRange[0]) : null;
        const mineRange = weaponsRange ? findObjectRange(lines, "Mining_efficiency", weaponsRange[0]) : null;
        const splitRange = weaponsRange ? findObjectRange(lines, "Split_Damage", weaponsRange[0]) : null;
        const statRange = weaponsRange ? findObjectRange(lines, "Status_effects", weaponsRange[0]) : null;
        const dur = W.Durability;
        const dps = W.DPS;
        const atk = W.Attack_speed;
        const mine = W.Mining_efficiency;
        const split = W.Split_Damage;
        const status = W.Status_effects;
        if (!isObject(dur)) {
            emit("Weapons.Durability must be an object", "Durability", weaponsRange);
        }
        else {
            if (!isNum(dur.Base))
                emit("Weapons.Durability.Base must be a number", "Base", durRange);
            for (const t of WEAPON_TYPES) {
                if (t in dur && !isNum(dur[t]))
                    emit(`Weapons.Durability.${t} must be a number`, t, durRange);
            }
        }
        if (!isObject(dps)) {
            emit("Weapons.DPS must be an object", "DPS", weaponsRange);
        }
        else if (!isNum(dps.Base)) {
            emit("Weapons.DPS.Base must be a number", "Base", dpsRange);
        }
        if (!isObject(atk)) {
            emit("Weapons.Attack_speed must be an object", "Attack_speed", weaponsRange);
        }
        else if (!isNum(atk.Base)) {
            emit("Weapons.Attack_speed.Base must be a number", "Base", atkRange);
        }
        if (!isObject(mine)) {
            emit("Weapons.Mining_efficiency must be an object", "Mining_efficiency", weaponsRange);
        }
        else if (!isNum(mine.Base)) {
            emit("Weapons.Mining_efficiency.Base must be a number", "Base", mineRange);
        }
        const durMaterials = isObject(dur)
            ? Object.keys(dur).filter(k => k !== "Base" && !WEAPON_TYPES.includes(k))
            : [];
        const weaponTypesInDps = isObject(dps)
            ? Object.keys(dps).filter(k => k !== "Base")
            : [];
        const materialChecks = [
            ["Attack_speed", atk, atkRange],
            ["Mining_efficiency", mine, mineRange],
            ["Split_Damage", split, splitRange],
            ["Status_effects", status, statRange],
        ];
        for (const [name, table, range] of materialChecks) {
            if (!isObject(table))
                continue;
            const extra = Object.keys(table).filter(k => !durMaterials.includes(k) && k !== "Base" && !WEAPON_TYPES.includes(k) && k !== "Default");
            for (const k of extra) {
                emit(`'${k}' appears in Weapons.${name} but not in Weapons.Durability materials`, k, range, vscode.DiagnosticSeverity.Warning);
            }
            for (const k of durMaterials) {
                if (!(k in table)) {
                    emit(`Missing material '${k}' in Weapons.${name}`, name, range, vscode.DiagnosticSeverity.Warning);
                }
            }
        }
        for (const t of weaponTypesInDps) {
            if (!WEAPON_TYPES.includes(t)) {
                emit(`'${t}' in Weapons.DPS is not a recognized weapon type`, t, dpsRange, vscode.DiagnosticSeverity.Warning);
            }
        }
        if (isObject(split)) {
            if (!("Default" in split))
                emit("Weapons.Split_Damage should define a 'Default' entry", "Split_Damage", splitRange);
            for (const entryName of ["Default", ...durMaterials]) {
                const entry = split[entryName];
                if (!isObject(entry)) {
                    emit(`Weapons.Split_Damage.${entryName} must be an object`, entryName, splitRange);
                    continue;
                }
                for (const dt of DAMAGE_TYPES) {
                    if (!(dt in entry))
                        emit(`Weapons.Split_Damage.${entryName} missing '${dt}'`, entryName, splitRange);
                    else if (!isNum(entry[dt]))
                        emit(`Weapons.Split_Damage.${entryName}.${dt} must be a number`, dt, splitRange);
                }
            }
        }
        else {
            emit("Weapons.Split_Damage must be an object", "Split_Damage", weaponsRange);
        }
        if (isObject(status)) {
            for (const name of ["Default", ...weaponTypesInDps, ...durMaterials]) {
                const entry = status[name];
                if (!isObject(entry)) {
                    emit(`Weapons.Status_effects.${name} must be an object`, name, statRange);
                    continue;
                }
                for (const se of STATUS_EFFECTS) {
                    if (!(se in entry))
                        emit(`Weapons.Status_effects.${name} missing '${se}'`, name, statRange);
                    else if (!isNum(entry[se]))
                        emit(`Weapons.Status_effects.${name}.${se} must be a number`, se, statRange);
                }
            }
        }
        else {
            emit("Weapons.Status_effects must be an object", "Status_effects", weaponsRange);
        }
        if (!isObject(W.Resource_locations)) {
            emit("Weapons.Resource_locations must be an object", "Resource_locations", weaponsRange);
        }
        else {
            for (const [k, v] of Object.entries(W.Resource_locations)) {
                if (!isStr(v))
                    emit(`Weapons.Resource_locations.${k} must be a string`, k, weaponsRange);
            }
        }
    }
    // ---------- Armor ----------
    if (isObject(obj.Armor)) {
        const A = obj.Armor;
        const pointsRange = armorRange ? findObjectRange(lines, "Armor_points", armorRange[0]) : null;
        const toughRange = armorRange ? findObjectRange(lines, "Armor_toughness", armorRange[0]) : null;
        const moveRange = armorRange ? findObjectRange(lines, "Movement_efficiency", armorRange[0]) : null;
        const dmgResRange = armorRange ? findObjectRange(lines, "Damage_resistance", armorRange[0]) : null;
        const staResRange = armorRange ? findObjectRange(lines, "Status_resistance", armorRange[0]) : null;
        const splitRange = armorRange ? findObjectRange(lines, "Split", armorRange[0]) : null;
        const points = A.Armor_points;
        const tough = A.Armor_toughness;
        const move = A.Movement_efficiency;
        const dmgRes = A.Damage_resistance;
        const staRes = A.Status_resistance;
        const split = A.Split;
        const armorMaterials = isObject(points) ? Object.keys(points) : [];
        const scalarTables = [
            ["Armor_points", points, pointsRange],
            ["Armor_toughness", tough, toughRange],
            ["Movement_efficiency", move, moveRange],
        ];
        for (const [name, table, range] of scalarTables) {
            if (!isObject(table)) {
                emit(`Armor.${name} must be an object`, name, armorRange);
                continue;
            }
            for (const [k, v] of Object.entries(table)) {
                if (!isNum(v))
                    emit(`Armor.${name}.${k} must be a number`, k, range);
            }
            for (const k of armorMaterials) {
                if (!(k in table))
                    emit(`Missing material '${k}' in Armor.${name}`, name, range, vscode.DiagnosticSeverity.Warning);
            }
        }
        const resChecks = [
            ["Damage_resistance", dmgRes, dmgResRange, DAMAGE_TYPES],
            ["Status_resistance", staRes, staResRange, STATUS_EFFECTS],
        ];
        for (const [name, table, range, expected] of resChecks) {
            if (!isObject(table)) {
                emit(`Armor.${name} must be an object`, name, armorRange);
                continue;
            }
            if (!("Default" in table))
                emit(`Armor.${name} should define a 'Default' entry`, name, range, vscode.DiagnosticSeverity.Warning);
            for (const mat of ["Default", ...armorMaterials]) {
                const entry = table[mat];
                if (!isObject(entry)) {
                    emit(`Armor.${name}.${mat} must be an object`, mat, range);
                    continue;
                }
                for (const key of expected) {
                    if (!(key in entry))
                        emit(`Armor.${name}.${mat} missing '${key}'`, mat, range);
                    else if (!isNum(entry[key]))
                        emit(`Armor.${name}.${mat}.${key} must be a number`, key, range);
                }
            }
        }
        if (!isObject(split)) {
            emit("Armor.Split must be an object", "Split", armorRange);
        }
        else {
            for (const slot of ARMOR_SLOTS) {
                if (!(slot in split))
                    emit(`Armor.Split missing '${slot}'`, slot, splitRange);
                else if (!isNum(split[slot]))
                    emit(`Armor.Split.${slot} must be a number`, slot, splitRange);
            }
        }
        if (!isObject(A.Resource_locations)) {
            emit("Armor.Resource_locations must be an object", "Resource_locations", armorRange);
        }
        else {
            for (const [k, v] of Object.entries(A.Resource_locations)) {
                if (!isStr(v))
                    emit(`Armor.Resource_locations.${k} must be a string`, k, armorRange);
            }
        }
    }
    // Append Duplicate Key Errors
    errors.push(...findDuplicateKeys(lines));
    return errors;
}
//# sourceMappingURL=validator.js.map