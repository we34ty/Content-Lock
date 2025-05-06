scoreboard players remove @s content_lock.flawless_countdown 1

execute unless score @s content_lock.flawless_countdown matches 0 run return 0
attribute @s attack_damage modifier remove content_lock.flawless_disabled
playsound block.note_block.bit master @s ~ ~ ~ 0.8 1.5
playsound block.note_block.bit master @s ~ ~ ~ 0.8 1.5
playsound block.note_block.bit master @s ~ ~ ~ 0.8 1.5
particle happy_villager ~ ~1.5 ~ 1 3 1 1 20 normal @s