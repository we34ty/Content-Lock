tag @s remove content_lock.duplicator.item_present
execute store result score @s content_lock.temp1 run data get block ~ ~ ~ Items[{Slot:11b}].count

execute if items block ~ ~ ~ container.11 lapis_lazuli run scoreboard players set @s content_lock.temp2 1
execute if items block ~ ~ ~ container.11 lapis_block run scoreboard players set @s content_lock.temp2 9
execute if items block ~ ~ ~ container.11 nether_star run scoreboard players set @s content_lock.temp2 128

scoreboard players operation @s content_lock.temp1 *= @s content_lock.temp2

scoreboard players operation @s content_lock.duplication_storage += @s content_lock.temp1

item replace block ~ ~ ~ container.11 with air