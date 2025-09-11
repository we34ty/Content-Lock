scoreboard players add @s content_lock.attack_timer 1

tag @e remove content_lock.im_a_passanger
execute on passengers run tag @s add content_lock.im_a_passanger
execute unless entity @e[tag=content_lock.im_a_passanger] run kill @s
execute rotated as @e[tag=content_lock.im_a_passanger] run rotate @s ~ 0
execute if entity @s[tag=content_lock.tatsugeki.dolphin.forward] run effect give @e[tag=content_lock.im_a_passanger] resistance 1 1 true
execute if entity @s[tag=content_lock.tatsugeki.dolphin.upward] run effect give @e[tag=content_lock.im_a_passanger] resistance 1 4 true

data merge storage content_lock:saved_stats {value:1}
execute store result storage content_lock:saved_stats value double 0.001 run attribute @s attack_damage get 1000
execute if entity @s[tag=content_lock.tatsugeki.dolphin.forward] positioned ~-1 ~-0.3 ~-1 as @e[type=!#entities,dx=2,dy=1,dz=2,tag=!content_lock.im_a_passanger,tag=!content_lock.tatsugeki.dolphin] run function content_lock:mobs/entities/tatsugeki/damage with storage content_lock:saved_stats
execute if entity @s[tag=content_lock.tatsugeki.dolphin.upward] positioned ~-0.5 ~-1 ~-0.5 as @e[type=!#entities,dx=1,dy=2,dz=1,tag=!content_lock.im_a_passanger,tag=!content_lock.tatsugeki.dolphin] run function content_lock:mobs/entities/tatsugeki/damage with storage content_lock:saved_stats

execute if entity @s[tag=content_lock.tatsugeki.dolphin.forward] if score @s content_lock.attack_timer matches 20.. run kill @s
execute if entity @s[tag=content_lock.tatsugeki.dolphin.upward] if score @s content_lock.attack_timer matches 40.. run kill @s

execute unless entity @s[tag=content_lock.tatsugeki.dolphin.upward] run return 0
execute unless score @s content_lock.attack_timer matches 20 run return 0

data merge storage content_lock:saved_stats {speed:1}
execute as @e[tag=content_lock.im_a_passanger,limit=1,sort=nearest] store result storage content_lock:saved_stats speed double 0.01 run attribute @s movement_speed get 4000
execute rotated as @e[tag=content_lock.im_a_passanger,limit=1,sort=nearest] rotated ~ 60 run summon area_effect_cloud ^ ^ ^5 {Tags:["content_lock.tatsugeki.dolphin.area"],Duration:1,Radius:0.0f}
function content_lock:player/items/custom_weapons/tatsugeki/motion with storage content_lock:saved_stats
