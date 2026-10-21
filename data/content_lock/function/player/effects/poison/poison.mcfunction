tag @s add content_lock.poison_active
#effect give @s poison 15 0
scoreboard players set @s content_lock.poison_timer 0
scoreboard players set @s content_lock.poison_stacks 12000
tellraw @s [{"translate": "content_lock:effect.poison.activated","color":"gold"}]
