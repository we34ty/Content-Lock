##Turn player's weapon visible for a moment
item modify entity @s weapon.mainhand content_lock:weapon_disable_invisible

##Save some of the more important information to the projectile array
function content_lock:player/weapons/uuid_save

##Assign all of the values
function content_lock:player/weapons/calculate_hit_timer
$scoreboard players set @s content_lock.weapons.cooldown $(cooldown)
$scoreboard players set @s content_lock.weapons.weapon_visible_timer $(visible_timer)

##Give yourself a projectile owner ID
scoreboard players operation @s content_lock.UUID_id = L content_lock.UUID_id
##Summon the item display with animations
$execute rotated ~ 0 positioned ^ ^ ^0.5 positioned ~ ~$(distance) ~ run function animated_java:weapons/summon {args:{}}
##Set the item model based on your weapon
$data modify entity @n[type=minecraft:item_display,tag=aj.weapons.bone.weapon.child.item_display,tag=!content_lock.weapons.$(name)] item set from entity @s SelectedItem
##Set the animation
$execute as @n[type=minecraft:item_display,tag=aj.weapons.root,tag=!content_lock.weapons.$(name)] run function animated_java:weapons/animations/$(anims)$(attack_anim_id)/play
$execute as @n[type=minecraft:item_display,tag=aj.weapons.root,tag=!content_lock.weapons.$(name)] at @s rotated ~ 0 run tp @s ~ ~ ~ ~ ~
##Give the weapon a projectile ID
$execute as @n[type=minecraft:item_display,tag=aj.weapons.root,tag=!content_lock.weapons.$(name)] run scoreboard players operation @s content_lock.UUID_id = L content_lock.UUID_id
$execute as @n[type=minecraft:item_display,tag=aj.weapons.root,tag=!content_lock.weapons.$(name)] run scoreboard players operation @s content_lock.weapons.weapon_visible_timer = @n[tag=content_lock.weapons.attacking] content_lock.weapons.weapon_visible_timer
$execute as @n[type=minecraft:item_display,tag=aj.weapons.root,tag=!content_lock.weapons.$(name)] run tag @s add content_lock.weapons.hit$(attack_anim_id)
$execute as @n[type=minecraft:item_display,tag=aj.weapons.root,tag=!content_lock.weapons.$(name)] run tag @s add content_lock.weapons.initialized
$execute as @n[type=minecraft:item_display,tag=aj.weapons.root,tag=!content_lock.weapons.$(name)] run tag @s add content_lock.weapons.$(name)
$execute as @n[type=minecraft:item_display,tag=aj.weapons.bone.weapon.child.item_display,tag=!content_lock.weapons.$(name)] run tag @s add content_lock.weapons.$(name)

##Reset the combo when it raches max
$execute if score @s content_lock.weapons.hit_nr matches $(max_combo).. run scoreboard players set @s content_lock.weapons.hit_nr $(combo_set)

##Reduce player speed when attacking
#tp @s ~ ~ ~
attribute @s movement_speed modifier add content_lock.weapons.attacking -0.75 add_multiplied_total
#attribute @s jump_strength modifier add content_lock.weapons.attacking -1 add_multiplied_total

$playsound $(sound) player @a ~ ~ ~ 1 $(sound_pitch)

##Consume stamina
function lsp:attacking

##Not needed anymore
attribute @s attack_damage modifier remove content_lock.weapons.crit
attribute @s attack_damage modifier remove content_lock.weapons.running

##Turn you weapon invisible if it doesn't have a custom texture
execute if items entity @s weapon.mainhand #content_lock:weapon[custom_model_data={strings:["content_lock:weapons.visible"]}] run item modify entity @s weapon.mainhand content_lock:weapon_enable_invisible
execute if items entity @s weapon.mainhand #content_lock:weapon[!custom_model_data={}] run item modify entity @s weapon.mainhand content_lock:weapon_enable_invisible