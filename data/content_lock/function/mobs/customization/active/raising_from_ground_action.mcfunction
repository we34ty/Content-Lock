execute at @p run tp @s[nbt=!{IsBaby:1b}] ~ ~-1 ~
execute at @p run tp @s[nbt={IsBaby:1b}] ~ ~1 ~
execute at @p run playsound entity.zombie.attack_wooden_door hostile @a ~ ~ ~ 2 0.5
execute at @p run playsound entity.zombie.infect hostile @a ~ ~ ~ 2 0.5
execute if entity @s[type=#zombies] at @p run playsound entity.zombie.hurt hostile @a ~ ~ ~ 1 0.8
execute if entity @s[type=#skeletons] at @p run playsound entity.skeleton.hurt hostile @a ~ ~ ~ 1 0.8
execute at @p run particle block_crumble{block_state:{Name:"minecraft:dirt"}} ~ ~ ~ 0.5 0.5 0.5 0.1 30 normal
execute at @p run particle block{block_state:{Name:"minecraft:dirt"}} ~ ~ ~ 0.5 0.5 0.5 0.1 30 normal