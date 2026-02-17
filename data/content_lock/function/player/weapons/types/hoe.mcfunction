function content_lock:player/weapons/uuid_save

function content_lock:player/weapons/calculate_hit_timer
scoreboard players add @s content_lock.weapons.hit_nr 1
scoreboard players set @s content_lock.weapons.cooldown 10

$execute rotated ~ 0 positioned ^ ^ ^0.5 positioned ~ ~$(distance) ~ run function animated_java:weapons/summon {args:{}}
data modify entity @n[type=minecraft:item_display,tag=aj.weapons.bone.weapon.child.item_display,tag=!content_lock.weapons.hoe] item set from entity @s SelectedItem
execute if score @s content_lock.weapons.hit_nr matches 1 as @n[type=minecraft:item_display,tag=aj.weapons.root,tag=!content_lock.weapons.hoe] run function animated_java:weapons/animations/hoe1/play
execute if score @s content_lock.weapons.hit_nr matches 2 as @n[type=minecraft:item_display,tag=aj.weapons.root,tag=!content_lock.weapons.hoe] run function animated_java:weapons/animations/hoe2/play
execute as @n[type=minecraft:item_display,tag=aj.weapons.root,tag=!content_lock.weapons.hoe] at @s rotated ~ 0 run tp @s ~ ~ ~ ~ ~
execute as @n[type=minecraft:item_display,tag=aj.weapons.root,tag=!content_lock.weapons.hoe] run scoreboard players operation @s content_lock.UUID_id = L content_lock.UUID_id
execute if score @s content_lock.weapons.hit_nr matches 1 as @n[type=minecraft:item_display,tag=aj.weapons.root,tag=!content_lock.weapons.hoe] run tag @s add content_lock.weapons.hit1
execute if score @s content_lock.weapons.hit_nr matches 2 as @n[type=minecraft:item_display,tag=aj.weapons.root,tag=!content_lock.weapons.hoe] run tag @s add content_lock.weapons.hit2
execute as @n[type=minecraft:item_display,tag=aj.weapons.bone.weapon.child.item_display,tag=!content_lock.weapons.hoe] run tag @s add content_lock.weapons.hoe
execute as @n[type=minecraft:item_display,tag=aj.weapons.root,tag=!content_lock.weapons.hoe] run tag @s add content_lock.weapons.hoe

execute if score @s content_lock.weapons.hit_nr matches 2 run scoreboard players set @s content_lock.weapons.hit_nr 0

tp @s ~ ~ ~
attribute @s movement_speed modifier add content_lock.weapons.attacking -1 add_multiplied_total
attribute @s jump_strength modifier add content_lock.weapons.attacking -1 add_multiplied_total

playsound entity.player.attack.weak player @a ~ ~ ~ 1 0.7

function lsp:attacking