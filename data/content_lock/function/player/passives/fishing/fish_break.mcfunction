playsound item.lead.break neutral @a ~ ~ ~ 1 0.7
function content_lock:player/passives/fishing/fish_free

scoreboard players set @s content_lock.temp1 -100
execute if items entity @s weapon.mainhand minecraft:fishing_rod run return run item modify entity @s weapon.mainhand content_lock:durability_from_scoreboard_add
execute if items entity @s weapon.offhand minecraft:fishing_rod run item modify entity @s weapon.offhand content_lock:durability_from_scoreboard_add