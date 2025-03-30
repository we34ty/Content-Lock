execute if score enabled lsp.Values matches 1 run function lsp:check
execute store result storage lsp:macro stamina.low float -0.1 run scoreboard players get unsprintable.speed lsp.Values

#> indicator
#execute as @a[scores={lsp.stamina=0..199}] run function lsp:staminabar
