tag @s add content_lock.fishing
tag @s remove content_lock.fishing.hooked_fish
tag @s remove content_lock.fishing.hooked_tag
scoreboard players set @s content_lock.fishing.progress 0
scoreboard players set @s content_lock.fishing.is_fishing 0
scoreboard players set @s content_lock.fishing.stress 0

execute store result score @s content_lock.fishing.timer run random value 20..140