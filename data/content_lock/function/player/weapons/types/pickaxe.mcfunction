function content_lock:player/weapons/uuid_save

scoreboard players set @s content_lock.weapons.hit_timer 35
scoreboard players set @s content_lock.weapons.cooldown 20

$execute rotated ~ 0 positioned ^ ^ ^0.5 positioned ~ ~$(distance) ~ run function animated_java:weapons/summon {args:{}}
data modify entity @n[type=minecraft:item_display,tag=aj.weapons.bone.weapon.child.item_display] item set from entity @s SelectedItem
execute as @n[type=minecraft:item_display,tag=aj.weapons.root] run function animated_java:weapons/animations/pickaxe1/play
execute as @n[type=minecraft:item_display,tag=aj.weapons.root] at @s rotated ~ 0 run tp @s ~ ~ ~ ~ ~
execute as @n[type=minecraft:item_display,tag=aj.weapons.root] run scoreboard players operation @s content_lock.UUID_id = L content_lock.UUID_id
execute as @n[type=minecraft:item_display,tag=aj.weapons.root] run tag @s add content_lock.weapons.pickaxe

tp @s ~ ~ ~
attribute @s movement_speed modifier add content_lock.weapons.attacking -1 add_multiplied_total
attribute @s jump_strength modifier add content_lock.weapons.attacking -1 add_multiplied_total

playsound entity.player.attack.strong player @a ~ ~ ~ 1 0.7

function lsp:attacking