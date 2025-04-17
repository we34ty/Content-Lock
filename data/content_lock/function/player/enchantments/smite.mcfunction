execute store result score @s content_lock.temp1 run data get entity @s Health 100
execute store result score @s content_lock.temp2 run attribute @s max_health get 1
scoreboard players operation @s content_lock.temp1 /= @s content_lock.temp2

execute store result score @s content_lock.temp2 on attacker run data get entity @s SelectedItem.components."minecraft:enchantments".levels."minecraft:smite"
tag @e remove content_lock.attacker
execute on attacker run tag @s add content_lock.attacker

execute unless entity @s[tag=content_lock.boss] if score @s content_lock.temp2 matches 1 if score @s content_lock.temp1 matches ..15 run return run function content_lock:player/enchantments/smite_activate
execute unless entity @s[tag=content_lock.boss] if score @s content_lock.temp2 matches 2 if score @s content_lock.temp1 matches ..20 run return run function content_lock:player/enchantments/smite_activate
execute unless entity @s[tag=content_lock.boss] if score @s content_lock.temp2 matches 3.. if score @s content_lock.temp1 matches ..25 run return run function content_lock:player/enchantments/smite_activate

execute if entity @s[tag=content_lock.boss] if score @s content_lock.temp2 matches 1 if score @s content_lock.temp1 matches ..3 run return run function content_lock:player/enchantments/smite_activate
execute if entity @s[tag=content_lock.boss] if score @s content_lock.temp2 matches 2 if score @s content_lock.temp1 matches ..6 run return run function content_lock:player/enchantments/smite_activate
execute if entity @s[tag=content_lock.boss] if score @s content_lock.temp2 matches 3.. if score @s content_lock.temp1 matches ..9 run return run function content_lock:player/enchantments/smite_activate