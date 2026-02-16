execute if score @s content_lock.weapons.cooldown matches 1.. run return 0
execute unless score @s lsp.stamina matches 1.. run return 0

tag @e remove content_lock.weapons.attacking
tag @s add content_lock.weapons.attacking
execute rotated ~ 0 positioned ^ ^ ^1 facing entity @s eyes run summon armor_stand ~ ~ ~ {Tags:["content_lock.weapons.angle"],Invisible:1b,NoGravity:1b,Marker:1b,Invulnerable:1b}
execute as @n[type=minecraft:armor_stand,tag=content_lock.weapons.angle,distance=..5] at @s facing entity @p[tag=content_lock.weapons.attacking] eyes run tp @s ~ ~ ~ ~ ~
data merge storage content_lock:weapon_stats {angle:0,distance:0}
execute store result storage content_lock:weapon_stats angle int 1 run data get entity @n[type=minecraft:armor_stand,tag=content_lock.weapons.angle,distance=..5] Rotation[1] -1000
kill @n[type=minecraft:armor_stand,tag=content_lock.weapons.angle,distance=..5]
execute store result storage content_lock:weapon_stats distance float 0.0008 run function content_lock:math/tan with storage content_lock:weapon_stats

execute if items entity @s weapon.mainhand #minecraft:swords run function content_lock:player/weapons/types/sword with storage content_lock:weapon_stats
execute if items entity @s weapon.mainhand #minecraft:pickaxes run function content_lock:player/weapons/types/pickaxe with storage content_lock:weapon_stats
execute if items entity @s weapon.mainhand #minecraft:hoes run function content_lock:player/weapons/types/hoe with storage content_lock:weapon_stats
execute if items entity @s weapon.mainhand #minecraft:axes run function content_lock:player/weapons/types/axe with storage content_lock:weapon_stats
execute if items entity @s weapon.mainhand #minecraft:shovels run function content_lock:player/weapons/types/shovel with storage content_lock:weapon_stats


tag @s remove content_lock.weapons.attacking