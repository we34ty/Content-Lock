scoreboard players set @s content_lock.temp1 0
$execute positioned ^ ^ ^$(speed) if block ~ ~ ~ #walkable run tp @s ~ ~ ~ facing entity @n[tag=content_lock.im_a_target] feet
$execute positioned ^ ^ ^$(speed) if block ~ ~ ~ #walkable run scoreboard players set @s content_lock.temp1 1
$execute positioned ^ ^ ^$(speed) unless block ~ ~ ~ #walkable run scoreboard players set @s content_lock.ai_timer 0

$execute if score @s content_lock.temp1 matches 0 rotated ~ 0 positioned ^ ^ ^$(speed) if block ~ ~ ~ #walkable if block ~ ~3 ~ #walkable run tp @s ~ ~ ~ facing entity @n[tag=content_lock.im_a_target] feet
$execute if score @s content_lock.temp1 matches 0 rotated ~ 0 positioned ^ ^ ^$(speed) if block ~ ~ ~ #walkable if block ~ ~3 ~ #walkable run scoreboard players set @s content_lock.temp1 1

$execute if score @s content_lock.temp1 matches 0 rotated ~90 0 positioned ^ ^ ^$(speed) if block ~ ~ ~ #walkable if block ~ ~3 ~ #walkable run tp @s ~ ~ ~ facing entity @n[tag=content_lock.im_a_target] feet
$execute if score @s content_lock.temp1 matches 0 rotated ~90 0 positioned ^ ^ ^$(speed) if block ~ ~ ~ #walkable if block ~ ~3 ~ #walkable run scoreboard players set @s content_lock.temp1 1

$execute if score @s content_lock.temp1 matches 0 rotated ~-90 0 positioned ^ ^ ^$(speed) if block ~ ~ ~ #walkable if block ~ ~3 ~ #walkable run tp @s ~ ~ ~ facing entity @n[tag=content_lock.im_a_target] feet
$execute if score @s content_lock.temp1 matches 0 rotated ~-90 0 positioned ^ ^ ^$(speed) if block ~ ~ ~ #walkable if block ~ ~3 ~ #walkable run scoreboard players set @s content_lock.temp1 1

#$execute if score @s content_lock.temp1 matches 0 rotated ~180 0 positioned ^ ^ ^$(speed) if block ~ ~ ~ #walkable run tp @s ~ ~ ~ facing entity @n[tag=content_lock.im_a_target] feet
#$execute if score @s content_lock.temp1 matches 0 rotated ~180 0 positioned ^ ^ ^$(speed) if block ~ ~ ~ #walkable run scoreboard players set @s content_lock.temp1 1

$execute if score @s content_lock.temp1 matches 0 positioned ~ ~$(vertical_speed) ~ if block ~ ~ ~ #walkable if block ~ ~3 ~ #walkable run tp @s ~ ~ ~ facing entity @n[tag=content_lock.im_a_target] feet
$execute if score @s content_lock.temp1 matches 0 positioned ~ ~$(vertical_speed) ~ if block ~ ~ ~ #walkable if block ~ ~3 ~ #walkable run scoreboard players set @s content_lock.temp1 1

$execute if score @s content_lock.temp1 matches 0 positioned ~ ~-$(vertical_speed) ~ if block ~ ~ ~ #walkable if block ~ ~3 ~ #walkable run tp @s ~ ~ ~ facing entity @n[tag=content_lock.im_a_target] feet
$execute if score @s content_lock.temp1 matches 0 positioned ~ ~-$(vertical_speed) ~ if block ~ ~ ~ #walkable if block ~ ~3 ~ #walkable run scoreboard players set @s content_lock.temp1 1
