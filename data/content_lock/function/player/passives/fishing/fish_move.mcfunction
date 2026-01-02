particle fishing ~ ~ ~ 0 0 0 0.05 3 force @a
playsound entity.fish.swim neutral @a ~ ~ ~ 0.5 1
$execute rotated $(yaw) 0 positioned ^ ^ ^0.2 unless block ~ ~-0.2 ~ #water_filled run scoreboard players add @p[tag=content_lock.fishing.hooked_tag] content_lock.fishing.stress 12
$execute rotated $(yaw) 0 positioned ^ ^ ^0.2 unless block ~ ~-0.2 ~ #water_filled run return run scoreboard players add @s content_lock.fishing.yaw 90

$execute if entity @p[tag=content_lock.fishing.hooked_tag,distance=..10] rotated $(yaw) 0 run tp @s ^ ^ ^0.2
execute unless entity @p[tag=content_lock.fishing.hooked_tag,distance=..10] facing entity @p[tag=content_lock.fishing.hooked_tag] feet rotated ~ 0 run tp @s ^ ^ ^0.2
tp @n[tag=content_lock.fishing.bobber] @s
