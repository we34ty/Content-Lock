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
exports.activate = activate;
exports.deactivate = deactivate;
const vscode = __importStar(require("vscode"));
const preprocessor_1 = require("./preprocessor");
const validator_1 = require("./validator");
const completion_1 = require("./completion");
const collection = vscode.languages.createDiagnosticCollection("gear");
function toDiagnostic(err, doc) {
    const lineText = doc.lineAt(err.line).text;
    const start = new vscode.Position(err.line, Math.min(err.startCol, lineText.length));
    const end = new vscode.Position(err.line, Math.max(err.endCol, err.startCol));
    const d = new vscode.Diagnostic(new vscode.Range(start, end), err.message, err.severity);
    d.source = "gear";
    return d;
}
function locateJsonError(message, jsonText, lineMap) {
    // Extract offset from V8's JSON.parse error messages when possible
    const m = message.match(/(?:at position|position)\s+(\d+)/i);
    if (m) {
        const offset = parseInt(m[1], 10);
        const before = jsonText.slice(0, offset);
        const ppLine = (before.match(/\n/g) || []).length;
        const lastNl = before.lastIndexOf("\n");
        const col = offset - lastNl - 1;
        const originalLine = lineMap[ppLine] ?? 0;
        return {
            line: originalLine,
            startCol: col,
            endCol: col + 1,
            message: `JSON error: ${message}`,
            severity: vscode.DiagnosticSeverity.Error,
        };
    }
    return {
        line: 0, startCol: 0, endCol: 0,
        message: `JSON error: ${message}`,
        severity: vscode.DiagnosticSeverity.Error,
    };
}
function validateDocument(doc) {
    if (doc.languageId !== "gear")
        return;
    const text = doc.getText();
    const { json, lineMap } = (0, preprocessor_1.preprocessGearText)(text);
    let obj;
    try {
        obj = JSON.parse(json);
    }
    catch (e) {
        const err = locateJsonError(e.message ?? String(e), json, lineMap);
        collection.set(doc.uri, [toDiagnostic(err, doc)]);
        return;
    }
    const lines = text.split(/\r?\n/);
    const errors = (0, validator_1.validateGear)(obj, lines);
    collection.set(doc.uri, errors.map(e => toDiagnostic(e, doc)));
}
function activate(context) {
    (0, completion_1.registerCompletions)(context);
    // Validate on open
    if (vscode.window.activeTextEditor) {
        validateDocument(vscode.window.activeTextEditor.document);
    }
    // Debounced re-validation on edit
    let timer;
    context.subscriptions.push(vscode.workspace.onDidChangeTextDocument(e => {
        if (e.document.languageId !== "gear")
            return;
        if (timer)
            clearTimeout(timer);
        timer = setTimeout(() => validateDocument(e.document), 250);
    }), vscode.workspace.onDidOpenTextDocument(doc => validateDocument(doc)), vscode.workspace.onDidCloseTextDocument(doc => collection.delete(doc.uri)), vscode.commands.registerCommand("gear.validate", () => {
        const editor = vscode.window.activeTextEditor;
        if (editor && editor.document.languageId === "gear") {
            validateDocument(editor.document);
            vscode.window.showInformationMessage("Gear file validated.");
        }
        else {
            vscode.window.showWarningMessage("No gear.txt file active.");
        }
    }), collection);
}
function deactivate() {
    collection.clear();
    collection.dispose();
}
//# sourceMappingURL=extension.js.map