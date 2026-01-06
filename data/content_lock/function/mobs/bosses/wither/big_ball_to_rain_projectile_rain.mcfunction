tp @s ~ ~-0.6 ~
particle dust{color:4276551,scale:2} ~ ~ ~ 0.4 0.4 0.4 1 5 force @a
particle soul ~ ~ ~ 0.4 0.4 0.4 0.01 3 normal @a

playsound block.fire.ambient hostile @a ~ ~ ~ 0.3 1.5
function content_lock:mobs/bosses/universal/damage_player_d {half_distance:0.3,distance:0.6,damage:4,damage_type:wither_skull}


scoreboard players add @s content_lock.timer1 1
execute if score @s content_lock.timer1 matches 20.. run kill @s