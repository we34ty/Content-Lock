tp @s ^ ^ ^0.5
particle flame ~ ~ ~ 0.1 0.1 0.1 0.02 6 force @a
scoreboard players add @s content_lock.attack_timer 1
playsound block.conduit.attack.target hostile @a ~ ~ ~ 0.4 2
function content_lock:mobs/bosses/universal/damage_player_d {half_distance:0.75,distance:1.5,damage:6,damage_type:fireball}

execute unless score @s content_lock.attack_timer matches 12.. run return 0
execute if block ~ ~ ~ #minecraft:walkable run return 0

function content_lock:mobs/bosses/universal/damage_player_d {half_distance:3,distance:6,damage:8,damage_type:player_explosion}
particle explosion_emitter ~ ~ ~ 0 0 0 1 1 force @a
particle flame ~ ~ ~ 0.1 0.1 0.1 0.5 20 normal @a
playsound entity.generic.explode hostile @a ~ ~ ~ 1 1.3
kill @s