scoreboard players add @s content_lock.temp1 1

particle dust{color:16711718,scale:1} ~ ~ ~ 0.5 0.5 0.5 0.02 100 force @a

execute unless block ~ ~ ~ #walkable run return 0
execute if score @s content_lock.temp1 matches 80.. run return 0

execute rotated as @s positioned ^ ^ ^1 run function content_lock:mobs/bosses/second_and_third_officers/ghast/raycast_damage_prediction