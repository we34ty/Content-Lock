tag @e[tag=!locked_in_by_dark_beam,distance=0..40,tag=to_be_locked_in_by_dark_beam,limit=1,sort=arbitrary] add locked_in_by_dark_beam
scoreboard players set @s cures_kill_detect 0
execute at @e[type=wither,limit=1,sort=nearest] facing entity @e[tag=!locked_in_by_dark_beam,distance=0..40,tag=to_be_locked_in_by_dark_beam,limit=1,sort=arbitrary] feet run tp @s ~ ~ ~ ~ ~