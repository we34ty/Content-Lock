
scoreboard players add @s content_lock.bow_charge 1

scoreboard players set @s content_lock.temp2 25000
execute store result score @s content_lock.temp1 run attribute @s attack_speed get 1000
scoreboard players operation @s content_lock.temp2 /= @s content_lock.temp1

#execute if score @s content_lock.temp2 = @s content_lock.bow_charge run playsound block.note_block.chime master @s ~ ~ ~ 1 1.5
execute if score @s content_lock.temp2 = @s content_lock.bow_charge run playsound item.crossbow.loading_end master @s ~ ~ ~ 1 1.2
execute if score @s content_lock.temp2 = @s content_lock.bow_charge run playsound entity.player.attack.crit master @s ~ ~ ~ 0.1 1.4
execute if score @s content_lock.temp2 = @s content_lock.bow_charge positioned ~ ~1.5 ~ run particle crit ^ ^ ^1 0.1 0.1 0.1 0.2 5 normal @s