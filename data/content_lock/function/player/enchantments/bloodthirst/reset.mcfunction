scoreboard players set @s content_lock.enchantment.bloodthirst 0
attribute @s attack_damage modifier remove content_lock.bloodthirst
attribute @s attack_speed modifier remove content_lock.bloodthirst

execute at @s run playsound block.note_block.banjo player @s ~ ~ ~ 1 1

scoreboard players set @s content_lock.temp1 -100
execute unless score @s content_lock.enchantment.bloodthirst.kills matches 1.. run item modify entity @s weapon.mainhand content_lock:durability_from_scoreboard_add
execute store result score @s content_lock.temp2 run data get entity @s SelectedItem.components."minecraft:damage"
execute store result score @s content_lock.temp1 run data get entity @s SelectedItem.components."minecraft:max_damage"
execute if score @s content_lock.temp2 = @s content_lock.temp1 at @s run playsound entity.item.break player @a ~ ~ ~ 1 1
execute if score @s content_lock.temp2 = @s content_lock.temp1 run item replace entity @s weapon.mainhand with minecraft:air

scoreboard players remove @s content_lock.enchantment.bloodthirst.fight_time 1
scoreboard players set @s content_lock.enchantment.bloodthirst.kills 0