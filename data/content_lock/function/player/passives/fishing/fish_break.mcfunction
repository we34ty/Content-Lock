playsound item.lead.break neutral @a ~ ~ ~ 1 0.7
function content_lock:player/passives/fishing/fish_free

scoreboard players set @s content_lock.temp1 -100
execute if items entity @s weapon.mainhand minecraft:fishing_rod run return run function content_lock:player/passives/fishing/damage_right
execute if items entity @s weapon.offhand minecraft:fishing_rod run item modify entity @s weapon.offhand content_lock:durability_from_scoreboard_add
execute store result score @s content_lock.temp2 run data get entity @s equipment.offhand.components."minecraft:damage"
execute store result score @s content_lock.temp1 run data get entity @s equipment.offhand.components."minecraft:max_damage"
execute if score @s content_lock.temp2 = @s content_lock.temp1 at @s run playsound entity.item.break player @a ~ ~ ~ 1 1
execute if score @s content_lock.temp2 = @s content_lock.temp1 run item replace entity @s weapon.offhand with minecraft:air