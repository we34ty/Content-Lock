attribute @s max_health modifier add content_lock.frostbite 0.2 add_multiplied_base
attribute @s attack_speed modifier add content_lock.frostbite 0.35 add_multiplied_base
attribute @s movement_speed modifier add content_lock.frostbite 0.05 add_value
attribute @s attack_damage modifier add content_lock.frostbite 0.1 add_multiplied_base
effect give @s instant_health 1 100 true
scoreboard players operation @s lsp.stamina = @s content_lock.max_stamina

scoreboard players set @s content_lock.frostbite_stacks -350
execute if entity @s[tag=content_lock.frostbite_active] run return 0
tellraw @s {"translate": "content_lock:effect.frostbite.activated","color":"red"}
tag @s add content_lock.frostbite_active
