##Calculates the entity size, using some basic trigonometry, to know where to place the weapon
execute rotated ~ 0 positioned ^ ^ ^1 facing entity @s eyes run summon armor_stand ~ ~ ~ {Tags:["content_lock.weapons.angle"],Invisible:1b,NoGravity:1b,Marker:1b,Invulnerable:1b}
execute as @n[type=minecraft:armor_stand,tag=content_lock.weapons.angle,distance=..5] at @s facing entity @p[tag=content_lock.weapons.attacking] eyes run tp @s ~ ~ ~ ~ ~
data merge storage content_lock:weapon_stats {angle:0,distance:0,attack_anim_id:0}
execute store result storage content_lock:weapon_stats angle int 1 run data get entity @n[type=minecraft:armor_stand,tag=content_lock.weapons.angle,distance=..5] Rotation[1] -1000
kill @n[type=minecraft:armor_stand,tag=content_lock.weapons.angle,distance=..5]
execute store result storage content_lock:weapon_stats distance float 0.0007 run function content_lock:math/tan with storage content_lock:weapon_stats

##Increases the combo or sets the attack index to jumping/running attack based on entity actions/position
scoreboard players add @s content_lock.weapons.hit_nr 1
$execute if entity @s[nbt={OnGround:false}] run scoreboard players set @s content_lock.weapons.hit_nr $(jumping_attack)
$execute if entity @s[predicate=lsp:is_sprinting] run scoreboard players set @s content_lock.weapons.hit_nr $(running_attack)
execute store result storage content_lock:weapon_stats attack_anim_id int 1 run scoreboard players get @s content_lock.weapons.hit_nr
##ids of 30 and 31 are reserved for running and jumping attacks respectively, and use indexes '_running' and '_jumping' instead of numbered ones
execute if score @s content_lock.weapons.hit_nr matches 30 run data merge storage content_lock:weapon_stats {attack_anim_id:"_running"}
execute if score @s content_lock.weapons.hit_nr matches 31 run data merge storage content_lock:weapon_stats {attack_anim_id:"_jumping"}

##Handles the creation of weapon item display
$data merge storage content_lock:weapon_stats {name:$(name),cooldown:$(cooldown),visible_timer:$(visible_timer),max_combo:$(max_combo),combo_set:$(combo_set),sound:$(sound),sound_pitch:$(sound_pitch),anims:$(anims),jumping_attack:$(jumping_attack),running_attack:$(running_attack)}
function content_lock:player/weapons/weapon_type_macro with storage content_lock:weapon_stats