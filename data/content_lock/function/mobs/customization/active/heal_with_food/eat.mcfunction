particle item{item:"rotten_flesh"} ~ ~1 ~ 0.1 0.5 0.1 0.1 4 normal
execute if score @s content_lock.mob.eating matches 30 run playsound entity.generic.eat hostile @a ~ ~ ~ 1 1
execute if score @s content_lock.mob.eating matches 20 run playsound entity.generic.eat hostile @a ~ ~ ~ 1 1
execute if score @s content_lock.mob.eating matches 10 run playsound entity.generic.eat hostile @a ~ ~ ~ 1 1
execute if score @s content_lock.mob.eating matches 1 run function content_lock:mobs/customization/active/heal_with_food/tick

scoreboard players remove @s content_lock.mob.eating 1