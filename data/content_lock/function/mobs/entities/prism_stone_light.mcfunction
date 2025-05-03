scoreboard players add @s content_lock.timer1 1
execute at @s if block ~ ~ ~ #air run setblock ~ ~ ~ light[level=9]
execute at @s if block ~ ~ ~ water run setblock ~ ~ ~ light[level=9,waterlogged=true]


execute if score @s content_lock.timer1 matches 21 at @s if block ~ ~ ~ light[waterlogged=false] run setblock ~ ~ ~ air replace
execute if score @s content_lock.timer1 matches 21 at @s if block ~ ~ ~ light[waterlogged=true] run setblock ~ ~ ~ water replace

execute if score @s content_lock.timer1 matches 21 run kill @s
