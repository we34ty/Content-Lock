scoreboard players add @s cures_kill_detect 1
execute if score @s timer1 matches ..30 run particle dust{color:[0.2, 0.2, 0.2],scale: 2} ~ ~ ~ 0.1 0.1 0.1 1 4 force @a
execute as @a[distance=0..1] run damage @s 14 wither by @e[type=wither,limit=1,sort=nearest]
tp @s ^ ^ ^1 ~ ~
execute if score @s cures_kill_detect matches 40.. run function content_lock:bosses/wither/wither_dark_beams_pass
execute at @e[type=wither,limit=1,sort=nearest] unless entity @e[distance=0..40,tag=!locked_in_by_dark_beam,tag=to_be_locked_in_by_dark_beam] run return 0
execute as @s at @s run function content_lock:bosses/wither/wither_dark_beams


