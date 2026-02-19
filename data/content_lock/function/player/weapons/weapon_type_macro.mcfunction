item modify entity @s weapon.mainhand content_lock:weapon_disable_invisible

function content_lock:player/weapons/uuid_save

function content_lock:player/weapons/calculate_hit_timer
scoreboard players add @s content_lock.weapons.hit_nr 1
$scoreboard players set @s content_lock.weapons.cooldown $(cooldown)
$scoreboard players set @s content_lock.weapons.weapon_visible_timer $(visible_timer)

$execute if entity @s[nbt={OnGround:false}] run scoreboard players set @s content_lock.weapons.hit_nr $(jumping_attack)
$execute if entity @s[predicate=lsp:is_sprinting] run scoreboard players set @s content_lock.weapons.hit_nr $(running_attack)

scoreboard players operation @s content_lock.UUID_id = L content_lock.UUID_id
$execute rotated ~ 0 positioned ^ ^ ^0.5 positioned ~ ~$(distance) ~ run function animated_java:weapons/summon {args:{}}
$data modify entity @n[type=minecraft:item_display,tag=aj.weapons.bone.weapon.child.item_display,tag=!content_lock.weapons.$(name)] item set from entity @s SelectedItem
$execute if score @s content_lock.weapons.hit_nr matches 1 as @n[type=minecraft:item_display,tag=aj.weapons.root,tag=!content_lock.weapons.$(name)] run function animated_java:weapons/animations/$(anims)1/play
$execute if score @s content_lock.weapons.hit_nr matches 2 as @n[type=minecraft:item_display,tag=aj.weapons.root,tag=!content_lock.weapons.$(name)] run function animated_java:weapons/animations/$(anims)2/play
$execute if score @s content_lock.weapons.hit_nr matches 3 as @n[type=minecraft:item_display,tag=aj.weapons.root,tag=!content_lock.weapons.$(name)] run function animated_java:weapons/animations/$(anims)3/play
$execute if score @s content_lock.weapons.hit_nr matches 9 as @n[type=minecraft:item_display,tag=aj.weapons.root,tag=!content_lock.weapons.$(name)] run function animated_java:weapons/animations/$(anims)_running/play
$execute as @n[type=minecraft:item_display,tag=aj.weapons.root,tag=!content_lock.weapons.$(name)] at @s rotated ~ 0 run tp @s ~ ~ ~ ~ ~
$execute as @n[type=minecraft:item_display,tag=aj.weapons.root,tag=!content_lock.weapons.$(name)] run scoreboard players operation @s content_lock.UUID_id = L content_lock.UUID_id
$execute as @n[type=minecraft:item_display,tag=aj.weapons.root,tag=!content_lock.weapons.$(name)] run scoreboard players operation @s content_lock.weapons.weapon_visible_timer = @p[tag=content_lock.weapons.attacking] content_lock.weapons.weapon_visible_timer
$execute if score @s content_lock.weapons.hit_nr matches 1 as @n[type=minecraft:item_display,tag=aj.weapons.root,tag=!content_lock.weapons.$(name)] run tag @s add content_lock.weapons.hit1
$execute if score @s content_lock.weapons.hit_nr matches 2 as @n[type=minecraft:item_display,tag=aj.weapons.root,tag=!content_lock.weapons.$(name)] run tag @s add content_lock.weapons.hit2
$execute if score @s content_lock.weapons.hit_nr matches 3 as @n[type=minecraft:item_display,tag=aj.weapons.root,tag=!content_lock.weapons.$(name)] run tag @s add content_lock.weapons.hit3
$execute if score @s content_lock.weapons.hit_nr matches 9 as @n[type=minecraft:item_display,tag=aj.weapons.root,tag=!content_lock.weapons.$(name)] run tag @s add content_lock.weapons.running
$execute as @n[type=minecraft:item_display,tag=aj.weapons.root,tag=!content_lock.weapons.$(name)] run tag @s add content_lock.weapons.initialized
$execute as @n[type=minecraft:item_display,tag=aj.weapons.root,tag=!content_lock.weapons.$(name)] run tag @s add content_lock.weapons.$(name)
$execute as @n[type=minecraft:item_display,tag=aj.weapons.bone.weapon.child.item_display,tag=!content_lock.weapons.$(name)] run tag @s add content_lock.weapons.$(name)

$execute if score @s content_lock.weapons.hit_nr matches $(max_combo).. run scoreboard players set @s content_lock.weapons.hit_nr 0

tp @s ~ ~ ~
attribute @s movement_speed modifier add content_lock.weapons.attacking -0.75 add_multiplied_total
#attribute @s jump_strength modifier add content_lock.weapons.attacking -1 add_multiplied_total

$playsound $(sound) player @a ~ ~ ~ 1 $(sound_pitch)

function lsp:attacking

attribute @s attack_damage modifier remove content_lock.weapons.crit
attribute @s attack_damage modifier remove content_lock.weapons.running

execute if items entity @s weapon.mainhand #content_lock:weapon[custom_model_data={strings:["content_lock:weapons.visible"]}] run item modify entity @s weapon.mainhand content_lock:weapon_enable_invisible
execute if items entity @s weapon.mainhand #content_lock:weapon[!custom_model_data={}] run item modify entity @s weapon.mainhand content_lock:weapon_enable_invisible