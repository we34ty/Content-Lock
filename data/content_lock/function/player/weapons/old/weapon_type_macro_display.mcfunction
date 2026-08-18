$function animated_java:weapons/animations/$(anims)$(attack_anim_id)/play
execute at @s rotated ~ 0 run tp @s ~ ~ ~ ~ ~
##Give the weapon a projectile ID
scoreboard players operation @s content_lock.UUID_id = L content_lock.UUID_id
scoreboard players operation @s content_lock.weapons.weapon_visible_timer = @n[tag=content_lock.weapons.attacking] content_lock.weapons.weapon_visible_timer
$tag @s add content_lock.weapons.hit$(attack_anim_id)
tag @s add content_lock.weapons.initialized
$tag @s add content_lock.weapons.$(name)
