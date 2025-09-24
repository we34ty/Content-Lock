$attribute @s[scores={lsp.stamina=0}] movement_speed modifier add lsp.no_sprint $(low) add_multiplied_total
attribute @s[scores={lsp.stamina=0}] jump_strength modifier add lsp.no_jump -1 add_multiplied_total
attribute @s[scores={lsp.stamina=1..}] movement_speed modifier remove lsp.no_sprint
attribute @s[scores={lsp.stamina=1..}] jump_strength modifier remove lsp.no_jump

execute if entity @s[scores={lsp.stamina=0}] unless items entity @s armor.* *[enchantments~[{enchantments:"minecraft:binding_curse"}]] run attribute @s attack_damage modifier add lsp.no_dmg -1 add_multiplied_total
execute if entity @s[scores={lsp.stamina=0}] unless items entity @s armor.* *[enchantments~[{enchantments:"minecraft:binding_curse"}]] run attribute @s attack_speed modifier add lsp.no_atkspd -1 add_multiplied_total
execute if entity @s[scores={lsp.stamina=0}] if items entity @s armor.* *[enchantments~[{enchantments:"minecraft:binding_curse"}]] run function lsp:binding_curse
attribute @s[scores={lsp.stamina=1..}] attack_damage modifier remove lsp.no_dmg
attribute @s[scores={lsp.stamina=1..}] attack_speed modifier remove lsp.no_atkspd
attribute @s[scores={lsp.stamina=1..}] armor modifier remove lsp.bonus_armor

tag @s[scores={lsp.stamina=1..},tag=content_lock.ran_out_of_stamina] remove content_lock.ran_out_of_stamina

scoreboard players set @s[scores={lsp.stamina=0},tag=!content_lock.ran_out_of_stamina] content_lock.stamina_delay_timer 0
tag @s[scores={lsp.stamina=0},tag=!content_lock.ran_out_of_stamina] add content_lock.ran_out_of_stamina
