execute if score @s lsp.stamina matches ..0 run return 0
execute if score @s content_lock.enchantment.bonus.armor.diamond.cooldown matches 1.. run return 0

scoreboard players remove @s content_lock.enchantment.bonus.armor.diamond.jumps 1
scoreboard players set @s content_lock.enchantment.bonus.armor.diamond.cooldown 20

execute store result score @s content_lock.temp1 run data get entity @s Motion[1] 5000
#tellraw @s [{"text":"Motion: ","color":"gray"},{"score":{"name":"@s","objective":"content_lock.temp1"},"color":"white"}]

scoreboard players set $strength player_motion.api.launch 10000
scoreboard players operation $strength player_motion.api.launch -= @s content_lock.temp1

execute rotated ~ ~-20 run function player_motion:api/launch_looking

playsound block.soul_sand.place player @a ~ ~ ~ 1 1.3
particle cloud ~ ~ ~ 0.3 0.1 0.3 0.1 10 normal @a

attribute @s safe_fall_distance modifier add content_lock.enchantment.bonus.armor.diamond.jump 1.5 add_multiplied_total
attribute @s fall_damage_multiplier modifier add content_lock.enchantment.bonus.armor.diamond.jump -0.2 add_multiplied_total
scoreboard players set @s content_lock.enchantment.bonus.armor.diamond.safe 50

execute unless score @s content_lock.fight_time matches 1.. run return 0

execute unless score @s lsp.stamina matches ..0 run scoreboard players operation @s lsp.stamina -= sprint.stamina.jump.consumption lsp.Values
execute unless score @s lsp.stamina matches ..0 run scoreboard players operation @s lsp.stamina -= sprint.stamina.jump.consumption lsp.Values
scoreboard players set @s content_lock.jump_check 0