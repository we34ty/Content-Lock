$attribute @s[scores={lsp.stamina=0}] movement_speed modifier add lsp.no_sprint $(low) add_multiplied_total
attribute @s[scores={lsp.stamina=0}] jump_strength modifier add lsp.no_jump -1 add_multiplied_total
attribute @s[scores={lsp.stamina=1..}] movement_speed modifier remove lsp.no_sprint
attribute @s[scores={lsp.stamina=1..}] jump_strength modifier remove lsp.no_jump

attribute @s[scores={lsp.stamina=0}] attack_damage modifier add lsp.no_dmg -1 add_multiplied_total
attribute @s[scores={lsp.stamina=0}] attack_speed modifier add lsp.no_atkspd -1 add_multiplied_total
attribute @s[scores={lsp.stamina=1..}] attack_damage modifier remove lsp.no_dmg
attribute @s[scores={lsp.stamina=1..}] attack_speed modifier remove lsp.no_atkspd
