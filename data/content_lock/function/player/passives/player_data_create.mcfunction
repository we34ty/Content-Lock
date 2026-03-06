##checks if player's UUID is inside of the arrat, and if it isn't it is added
scoreboard players set @s content_lock.temp1 0
$execute store result score @s content_lock.temp1 run data get storage content_lock:player_data UUIDs[{UUID:$(UUID)}].UUID[0] 1
execute unless score @s content_lock.temp1 matches -2147483648..2147483647 run return 0
$data modify storage content_lock:player_data UUIDs append value {UUID:$(UUID),data:{}}