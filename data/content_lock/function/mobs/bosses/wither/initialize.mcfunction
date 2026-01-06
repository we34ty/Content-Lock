attribute @s armor modifier add content_lock.wither 12 add_value
attribute @s armor_toughness modifier add content_lock.wither 6 add_value

scoreboard players set @s content_lock.wither_regen 1
execute store result entity @s Health float 1 run attribute @s max_health get
tag @s add content_lock.wither.initialized
