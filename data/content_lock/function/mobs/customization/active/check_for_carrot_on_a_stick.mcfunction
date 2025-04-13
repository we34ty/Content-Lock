execute if block ~ ~ ~ #water_filled run return 0

tag @a remove content_lock.im_a_passanger
execute on passengers run tag @s add content_lock.im_a_passanger
data merge storage content_lock:saved_stats {speed:0}
execute store result storage content_lock:saved_stats speed double 0.01 run attribute @s movement_speed get 200
execute if entity @p[tag=content_lock.im_a_passanger,nbt={SelectedItem:{id:"minecraft:carrot_on_a_stick"}}] rotated as @p[tag=content_lock.im_a_passanger] run function content_lock:mobs/customization/active/carrot_on_a_stick_motion with storage content_lock:saved_stats
