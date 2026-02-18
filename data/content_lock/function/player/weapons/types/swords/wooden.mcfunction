function content_lock:player/weapons/uuid_save

function content_lock:player/weapons/calculate_hit_timer
scoreboard players add @s content_lock.weapons.hit_nr 1
scoreboard players set @s content_lock.weapons.cooldown 17

execute if entity @s[predicate=lsp:is_sprinting] run scoreboard players set @s content_lock.weapons.hit_nr 9

scoreboard players operation @s content_lock.UUID_id = L content_lock.UUID_id
$execute rotated ~ 0 positioned ^ ^ ^0.5 positioned ~ ~$(distance) ~ run function animated_java:weapons/summon {args:{}}
data modify entity @n[type=minecraft:item_display,tag=aj.weapons.bone.weapon.child.item_display,tag=!content_lock.weapons.wooden_sword] item set from entity @s SelectedItem
execute if score @s content_lock.weapons.hit_nr matches 1 as @n[type=minecraft:item_display,tag=aj.weapons.root,tag=!content_lock.weapons.wooden_sword] run function animated_java:weapons/animations/sword1/play
execute if score @s content_lock.weapons.hit_nr matches 2 as @n[type=minecraft:item_display,tag=aj.weapons.root,tag=!content_lock.weapons.wooden_sword] run function animated_java:weapons/animations/sword2/play
execute if score @s content_lock.weapons.hit_nr matches 9 as @n[type=minecraft:item_display,tag=aj.weapons.root,tag=!content_lock.weapons.wooden_sword] run function animated_java:weapons/animations/sword_running/play
execute as @n[type=minecraft:item_display,tag=aj.weapons.root,tag=!content_lock.weapons.wooden_sword] at @s rotated ~ 0 run tp @s ~ ~ ~ ~ ~
execute as @n[type=minecraft:item_display,tag=aj.weapons.root,tag=!content_lock.weapons.wooden_sword] run scoreboard players operation @s content_lock.UUID_id = L content_lock.UUID_id
execute if score @s content_lock.weapons.hit_nr matches 1 as @n[type=minecraft:item_display,tag=aj.weapons.root,tag=!content_lock.weapons.wooden_sword] run tag @s add content_lock.weapons.hit1
execute if score @s content_lock.weapons.hit_nr matches 2 as @n[type=minecraft:item_display,tag=aj.weapons.root,tag=!content_lock.weapons.wooden_sword] run tag @s add content_lock.weapons.hit2
execute if score @s content_lock.weapons.hit_nr matches 9 as @n[type=minecraft:item_display,tag=aj.weapons.root,tag=!content_lock.weapons.wooden_sword] run tag @s add content_lock.weapons.running
execute as @n[type=minecraft:item_display,tag=aj.weapons.root,tag=!content_lock.weapons.wooden_sword] run tag @s add content_lock.weapons.initialized
execute as @n[type=minecraft:item_display,tag=aj.weapons.root,tag=!content_lock.weapons.wooden_sword] run tag @s add content_lock.weapons.wooden_sword
execute as @n[type=minecraft:item_display,tag=aj.weapons.bone.weapon.child.item_display,tag=!content_lock.weapons.wooden_sword] run tag @s add content_lock.weapons.wooden_sword

execute if score @s content_lock.weapons.hit_nr matches 2 run scoreboard players set @s content_lock.weapons.hit_nr 0

tp @s ~ ~ ~
attribute @s movement_speed modifier add content_lock.weapons.attacking -0.75 add_multiplied_total
#attribute @s jump_strength modifier add content_lock.weapons.attacking -1 add_multiplied_total

playsound entity.player.attack.weak player @a ~ ~ ~ 1 0.7

function lsp:attacking