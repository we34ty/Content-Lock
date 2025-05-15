execute if score @s content_lock.item_use_cooldown matches 1.. run return 0

scoreboard players set @s content_lock.temp1 0
tag @e remove content_lock.not_influenced_by_eye
tag @s add content_lock.not_influenced_by_eye

scoreboard players set @s content_lock.item_use_cooldown 20

playsound entity.phantom.bite player @a ~ ~ ~ 0.6 1.4

function content_lock:player/items/special/riders_eye_raycast