execute if score L content_lock.options.player.stamina matches 1 run function lsp:check
execute store result storage lsp:macro stamina.low float -0.1 run scoreboard players get unsprintable.speed lsp.Values
scoreboard players set @a content_lock.jump_check 0

#> indicator
#execute as @a[scores={lsp.stamina=0..199}] run function lsp:staminabar
