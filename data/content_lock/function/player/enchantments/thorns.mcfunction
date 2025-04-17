tag @e remove content_lock.thorner
tag @s add content_lock.thorner
execute at @s positioned ~-1.5 ~-0.5 ~-1.5 at @e[dx=3,dy=1,dz=3,tag=!content_lock.thorner] run particle block{block_state:redstone_block} ~ ~1 ~ 0.2 0.2 0.2 1 5 normal @a
execute at @s positioned ~-1.5 ~-0.5 ~-1.5 as @e[dx=3,dy=1,dz=3,tag=!content_lock.thorner] run scoreboard players add @s content_lock.bleed_stacks 20
playsound enchant.thorns.hit player @a ~ ~ ~ 1 1
