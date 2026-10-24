import * as vscode from "vscode";
import { preprocessGearText } from "./preprocessor";

const CATEGORIES = {
    StructuralWeapons: ["Durability", "DPS", "Attack_speed", "Mining_efficiency", "Split_Damage", "Status_effects", "Resource_locations"],
    StructuralArmor: ["Armor_points", "Armor_toughness", "Movement_efficiency", "Damage_resistance", "Status_resistance", "Split", "Resource_locations"],
    WeaponTypes: ["Sword", "Hoe", "Axe", "Pickaxe", "Shovel", "Spear"],
    ArmorSlots: ["Helmet", "Chestplate", "Leggings", "Boots"],
    DamageTypes: ["Physical", "Fire", "Frost", "Magic", "Wither", "Ender"],
    StatusEffects: ["Bleed", "Poison", "Corruption", "Wither", "Frostbite"]
};

const DEFAULT_WEAPON_MATS = ["Wooden", "Stone", "Copper", "Iron", "Golden", "Diamond", "Netherite", "Quartz"];
const DEFAULT_ARMOR_MATS = ["Leather", "Chainmail", "Copper", "Iron", "Golden", "Diamond", "Netherite", "Quartz"];

// --- 1. Dynamic Materials Extraction ---
function getDynamicMaterials(document: vscode.TextDocument) {
    let weaponMats = [...DEFAULT_WEAPON_MATS];
    let armorMats = [...DEFAULT_ARMOR_MATS];
    const text = document.getText();

    try {
        const { json } = preprocessGearText(text);
        const obj = JSON.parse(json);
        if (obj.Weapons?.Resource_locations) weaponMats = Object.keys(obj.Weapons.Resource_locations);
        if (obj.Armor?.Resource_locations) armorMats = Object.keys(obj.Armor.Resource_locations);
    } catch (e) {
        // Regex fallback if file is temporarily invalid
        const wMatch = text.match(/Weapons\s*:\s*\{[\s\S]*?Resource_locations\s*:\s*\{([\s\S]*?)\}/);
        if (wMatch) {
            const keys = [...wMatch[1].matchAll(/([A-Za-z_][A-Za-z0-9_]*)\s*:/g)].map(m => m[1]);
            if (keys.length > 0) weaponMats = keys;
        }
        const aMatch = text.match(/Armor\s*:\s*\{[\s\S]*?Resource_locations\s*:\s*\{([\s\S]*?)\}/);
        if (aMatch) {
            const keys = [...aMatch[1].matchAll(/([A-Za-z_][A-Za-z0-9_]*)\s*:/g)].map(m => m[1]);
            if (keys.length > 0) armorMats = keys;
        }
    }
    return { weaponMats, armorMats };
}

// --- 2. Context Parsing ---
interface OpenBlock {
    name: string;
    startIndex: number;
}

function getOpenBlocks(document: vscode.TextDocument, position: vscode.Position): OpenBlock[] {
    const textBeforeCursor = document.getText(new vscode.Range(new vscode.Position(0, 0), position));
    let depth = 0;
    let inString = false;
    let inComment = false;
    const stack: OpenBlock[] = [];

    for (let i = textBeforeCursor.length - 1; i >= 0; i--) {
        const char = textBeforeCursor[i];
        const prevChar = i > 0 ? textBeforeCursor[i - 1] : '';

        if (char === '\n') inComment = false;
        if (char === '#' && !inString) inComment = true;
        if (inComment) continue;

        if (char === '"' && prevChar !== '\\') inString = !inString;
        
        if (!inString) {
            if (char === '}') depth++;
            else if (char === '{') {
                if (depth === 0) {
                    const textBeforeBrace = textBeforeCursor.slice(0, i).trimEnd();
                    const match = textBeforeBrace.match(/([A-Za-z_][A-Za-z0-9_]*)\s*:\s*$/);
                    stack.push({ name: match ? match[1] : "", startIndex: i });
                } else {
                    depth--;
                }
            }
        }
    }
    return stack;
}

// --- 3. Two-Way Filtering of Existing Keys ---
function getExistingKeys(documentText: string, blockStartIndex: number): Set<string> {
    const textInBlock = documentText.slice(blockStartIndex + 1);
    let depth = 0;
    let inString = false;
    let inComment = false;
    let endIndex = -1;

    // 1. Scan forward to find the end of the current block (ignoring strings/comments)
    for (let i = 0; i < textInBlock.length; i++) {
        const char = textInBlock[i];
        if (char === '\n') inComment = false;
        if (char === '#' && !inString) inComment = true;
        if (inComment) continue;

        if (char === '"' && textInBlock[i-1] !== '\\') inString = !inString;
        if (!inString) {
            if (char === '{' || char === '[') depth++;
            else if (char === '}' || char === ']') {
                if (depth === 0) { endIndex = i; break; }
                depth--;
            }
        }
    }

    // If the block is incomplete, scan to the end of the file
    const buffer = endIndex !== -1 ? textInBlock.slice(0, endIndex) : textInBlock;

    // 2. Extract all keys at depth 0 (ignores nested objects)
    const keys = new Set<string>();
    depth = 0;
    inString = false;
    inComment = false;
    let currentKeyBuffer = "";

    for (let i = 0; i < buffer.length; i++) {
        const char = buffer[i];
        if (char === '\n') inComment = false;
        if (char === '#' && !inString) inComment = true;
        if (inComment) continue;

        if (char === '"' && buffer[i-1] !== '\\') inString = !inString;
        
        if (!inString) {
            if (char === '{' || char === '[') depth++;
            else if (char === '}' || char === ']') depth--;
            else if (char === ':' && depth === 0) {
                const match = currentKeyBuffer.match(/([A-Za-z_][A-Za-z0-9_]*)\s*$/);
                if (match) keys.add(match[1]);
                currentKeyBuffer = "";
            } else {
                if (depth === 0) currentKeyBuffer += char;
            }
        }
    }
    return keys;
}

function createFilteredItems(names: string[], existing: Set<string>, kind: vscode.CompletionItemKind, detail: string): vscode.CompletionItem[] {
    return names
        .filter(name => !existing.has(name))
        .map(name => {
            const item = new vscode.CompletionItem(name, kind);
            item.detail = detail;
            item.sortText = (name === "Base" || name === "Default") ? "0" + name : "1" + name;
            return item;
        });
}

export function registerCompletions(context: vscode.ExtensionContext) {
    const provider = vscode.languages.registerCompletionItemProvider(
        { language: "gear" },
        {
            provideCompletionItems(document: vscode.TextDocument, position: vscode.Position) {
                const { weaponMats, armorMats } = getDynamicMaterials(document);
                const blocks = getOpenBlocks(document, position);
                const parent = blocks[0];
                const grandParent = blocks[1];

                let existingKeys = new Set<string>();
                if (parent) {
                    existingKeys = getExistingKeys(document.getText(), parent.startIndex);
                }

                if (!parent) {
                    return createFilteredItems(["Weapons", "Armor"], existingKeys, vscode.CompletionItemKind.Module, "Top-level Block");
                }

                if (parent.name === "Resource_locations") {
                    const mats = grandParent?.name === "Armor" ? armorMats : weaponMats;
                    return createFilteredItems(mats, existingKeys, vscode.CompletionItemKind.Value, "Material");
                }

                if (parent.name === "Weapons") {
                    return createFilteredItems(CATEGORIES.StructuralWeapons, existingKeys, vscode.CompletionItemKind.Property, "Weapon Block");
                }
                if (parent.name === "Armor") {
                    return createFilteredItems(CATEGORIES.StructuralArmor, existingKeys, vscode.CompletionItemKind.Property, "Armor Block");
                }

                if (parent.name === "Durability") {
                    return createFilteredItems(["Base", ...CATEGORIES.WeaponTypes, ...weaponMats], existingKeys, vscode.CompletionItemKind.Property, "Key");
                }
                if (parent.name === "DPS") {
                    return createFilteredItems(["Base", ...CATEGORIES.WeaponTypes], existingKeys, vscode.CompletionItemKind.Property, "Key");
                }
                if (parent.name === "Attack_speed") {
                    return createFilteredItems(["Base", ...CATEGORIES.WeaponTypes, ...weaponMats], existingKeys, vscode.CompletionItemKind.Property, "Key");
                }
                if (parent.name === "Mining_efficiency") {
                    return createFilteredItems(["Base", ...weaponMats], existingKeys, vscode.CompletionItemKind.Property, "Key");
                }
                if (parent.name === "Split_Damage") {
                    return createFilteredItems(["Default", ...weaponMats], existingKeys, vscode.CompletionItemKind.Property, "Key");
                }
                if (parent.name === "Status_effects") {
                    return createFilteredItems(["Default", ...CATEGORIES.WeaponTypes, ...weaponMats], existingKeys, vscode.CompletionItemKind.Property, "Key");
                }

                if (["Armor_points", "Armor_toughness", "Movement_efficiency"].includes(parent.name)) {
                    return createFilteredItems(armorMats, existingKeys, vscode.CompletionItemKind.Property, "Material");
                }
                if (parent.name === "Damage_resistance" || parent.name === "Status_resistance") {
                    return createFilteredItems(["Default", ...armorMats], existingKeys, vscode.CompletionItemKind.Property, "Material");
                }
                if (parent.name === "Split") {
                    return createFilteredItems(CATEGORIES.ArmorSlots, existingKeys, vscode.CompletionItemKind.Property, "Slot");
                }

                if (grandParent?.name === "Split_Damage" || grandParent?.name === "Damage_resistance") {
                    return createFilteredItems(CATEGORIES.DamageTypes, existingKeys, vscode.CompletionItemKind.EnumMember, "Damage Element");
                }
                if (grandParent?.name === "Status_effects" || grandParent?.name === "Status_resistance") {
                    return createFilteredItems(CATEGORIES.StatusEffects, existingKeys, vscode.CompletionItemKind.EnumMember, "Status Effect");
                }

                return [];
            }
        },
        ":", " ", "{", "\n" 
    );

    context.subscriptions.push(provider);
}