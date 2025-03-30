scoreboard players set @s[tag=!content_lock.splintered] content_lock.splinter_counter 30
tag @s add content_lock.splintered
playsound entity.creaking.activate player @a ~ ~ ~ 1 2
particle block_crumble{block_state:oak_log} ~ ~0.5 ~ 1 1 1 1 10 normal