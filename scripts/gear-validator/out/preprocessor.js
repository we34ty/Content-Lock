"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.preprocessGearText = preprocessGearText;
function preprocessGearText(text) {
    const lines = text.split(/\r?\n/);
    const processed = [];
    const lineMap = [];
    let inResourceSection = false;
    const push = (line, origIdx) => {
        processed.push(line);
        lineMap.push(origIdx);
    };
    for (let i = 0; i < lines.length; i++) {
        let line = lines[i];
        const stripped = line.trim();
        // Commented-out resource section header — Python-compatible trigger
        if (stripped.includes("# Resource_locations:")) {
            const lead = line.length - line.trimStart().length;
            const rest = line.trimStart().replace(/^#\s*/, "");
            inResourceSection = true;
            push(" ".repeat(lead) + rest, i);
            continue;
        }
        if (inResourceSection) {
            if (stripped.startsWith("#") && stripped.includes(":")) {
                const lead = line.length - line.trimStart().length;
                const rest = line.trimStart().replace(/^#\s*/, "");
                push(" ".repeat(lead) + rest, i);
                continue;
            }
            if (stripped === "{") {
                push(line, i);
                continue;
            }
            if (stripped === "}" || stripped === "},") {
                inResourceSection = false;
                push(line.replace(/,\s*$/, ""), i);
                continue;
            }
        }
        if (stripped.startsWith("#")) {
            continue; // drop pure comment lines
        }
        push(line, i);
    }
    let joined = processed.join("\n");
    joined = joined.replace(/,\s*([}\]])/g, "$1"); // strip trailing commas
    // Protect quoted strings, then quote bare keys
    const strings = [];
    joined = joined.replace(/"(?:[^"\\]|\\.)*"/g, (m) => {
        strings.push(m);
        return `\u0000STR${strings.length - 1}\u0000`;
    });
    joined = joined.replace(/([A-Za-z_][A-Za-z0-9_]*)\s*:/g, '"$1":');
    for (let i = 0; i < strings.length; i++) {
        joined = joined.split(`\u0000STR${i}\u0000`).join(strings[i]);
    }
    return { json: joined, lineMap };
}
//# sourceMappingURL=preprocessor.js.map