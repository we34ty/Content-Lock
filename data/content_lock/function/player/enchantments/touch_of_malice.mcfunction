execute unless predicate content_lock:1_durability run return 0

attribute @s attack_damage modifier add content_lock.touch_of_malice 1 add_multiplied_total
tag @s add content_lock.touch_of_malice_active

execute if entity @s[nbt={Inventory:[{Slot:-106b}]}] run summon item ~ ~ ~ {Tags:["content_lock.modify_from_offhand"],Item:{id:"structure_void"}}
execute if entity @s[nbt={Inventory:[{Slot:-106b}]}] run data modify entity @e[type=item,tag=content_lock.modify_from_offhand,limit=1,sort=nearest] Item set from entity @s Inventory[{Slot:-106b}]

scoreboard players set @s content_lock.temp1 1
item modify entity @s weapon.mainhand content_lock:durability_from_scoreboard_add
execute unless predicate content_lock:1_durability run item modify entity @s weapon.mainhand content_lock:durability_from_scoreboard

data merge storage content_lock:saved_stats {damage:1}
execute store result score @s content_lock.temp1 run attribute @s attack_speed get 100
execute if score @s content_lock.temp1 matches 100.. run scoreboard players set @s content_lock.timer1 100
scoreboard players set @s content_lock.temp2 10000
scoreboard players operation @s content_lock.temp2 /= @s content_lock.temp1
execute store result storage content_lock:saved_stats damage double 0.02 run scoreboard players get @s content_lock.temp2
function content_lock:player/enchantments/touch_of_malice_self_damage with storage content_lock:saved_stats