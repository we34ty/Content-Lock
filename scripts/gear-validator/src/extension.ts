import * as vscode from "vscode";
import { preprocessGearText } from "./preprocessor";
import { validateGear, GearError } from "./validator";
import { registerCompletions } from "./completion";

const collection = vscode.languages.createDiagnosticCollection("gear");

function toDiagnostic(err: GearError, doc: vscode.TextDocument): vscode.Diagnostic {
    const lineText = doc.lineAt(err.line).text;
    const start = new vscode.Position(err.line, Math.min(err.startCol, lineText.length));
    const end   = new vscode.Position(err.line, Math.max(err.endCol, err.startCol));
    const d = new vscode.Diagnostic(
        new vscode.Range(start, end),
        err.message,
        err.severity
    );
    d.source = "gear";
    return d;
}

function locateJsonError(
    message: string,
    jsonText: string,
    lineMap: number[]
): GearError {
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

function validateDocument(doc: vscode.TextDocument): void {
    if (doc.languageId !== "gear") return;

    const text = doc.getText();
    const { json, lineMap } = preprocessGearText(text);

    let obj: any;
    try {
        obj = JSON.parse(json);
    } catch (e: any) {
        const err = locateJsonError(e.message ?? String(e), json, lineMap);
        collection.set(doc.uri, [toDiagnostic(err, doc)]);
        return;
    }

    const lines = text.split(/\r?\n/);
    const errors = validateGear(obj, lines);
    collection.set(doc.uri, errors.map(e => toDiagnostic(e, doc)));
}

export function activate(context: vscode.ExtensionContext) {
    registerCompletions(context);
    // Validate on open
    if (vscode.window.activeTextEditor) {
        validateDocument(vscode.window.activeTextEditor.document);
    }

    // Debounced re-validation on edit
    let timer: NodeJS.Timeout | undefined;
    context.subscriptions.push(
        vscode.workspace.onDidChangeTextDocument(e => {
            if (e.document.languageId !== "gear") return;
            if (timer) clearTimeout(timer);
            timer = setTimeout(() => validateDocument(e.document), 250);
        }),
        vscode.workspace.onDidOpenTextDocument(doc => validateDocument(doc)),
        vscode.workspace.onDidCloseTextDocument(doc => collection.delete(doc.uri)),
        vscode.commands.registerCommand("gear.validate", () => {
            const editor = vscode.window.activeTextEditor;
            if (editor && editor.document.languageId === "gear") {
                validateDocument(editor.document);
                vscode.window.showInformationMessage("Gear file validated.");
            } else {
                vscode.window.showWarningMessage("No gear.txt file active.");
            }
        }),
        collection
    );
}

export function deactivate() {
    collection.clear();
    collection.dispose();
}