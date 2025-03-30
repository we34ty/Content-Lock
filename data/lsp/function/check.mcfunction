execute if score L content_lock.timer1 matches 3 as @a if score @s lsp.stamina > @s content_lock.max_stamina run scoreboard players operation @s lsp.stamina = @s content_lock.max_stamina
execute as @a[predicate=!lsp:is_sprinting] run function lsp:restore
execute as @a[predicate=lsp:is_sprinting] run function lsp:sprinting
execute if entity @r[scores={content_lock.damage_amount_for_check=1..}] as @a[scores={content_lock.damage_amount_for_check=1..}] run function lsp:attacking