scoreboard players add @s timer1 1
execute if score @s timer1 matches 1 as @a[distance=9.1..40] at @s run summon area_effect_cloud ~ ~ ~ {Tags:[to_be_locked_in_by_dark_beam],Duration:30}
execute if entity @e[distance=9.1..40,tag=!locked_in_by_dark_beam,tag=to_be_locked_in_by_dark_beam] facing entity @e[distance=9.1..40,tag=!locked_in_by_dark_beam,tag=to_be_locked_in_by_dark_beam,limit=1,sort=arbitrary] feet run function content_lock:bosses/wither/wither_dark_beams
tag @e remove locked_in_by_dark_beam

