#$execute if entity @n[distance=0.01..,type=item_display,tag=aj.weapons.root,scores={content_lock.UUID_id=$(Id)}] if score @n[distance=0.01..,type=item_display,tag=aj.weapons.root,scores={content_lock.UUID_id=$(Id)}] content_lock.attack_timer <= @s content_lock.attack_timer run function animated_java:weapons/remove/this
tag @e remove content_lock.im_a_target
$tag @p[nbt={UUID:$(UUID)}] add content_lock.im_a_target
$execute unless entity @r[tag=content_lock.im_a_target] run tag @n[nbt={UUID:$(UUID)}] add content_lock.im_a_target
$execute at @n[tag=content_lock.im_a_target] rotated $(yaw) $(pitch) positioned ~ ~$(distance) ~ positioned ^ ^ ^0.7 run tp @s ~ ~ ~
execute unless score @s content_lock.UUID_id = @n[tag=content_lock.im_a_target] content_lock.UUID_id run function animated_java:weapons/remove/this