execute if entity @s[scores={content_lock.attack_timer=0}] run scoreboard players add @s content_lock.boss_exhaustion 70
execute if entity @s[scores={content_lock.attack_timer=0}] run scoreboard players set @s content_lock.attack_timer 60

execute if entity @s[scores={content_lock.attack_timer=60}] run particle effect{color:1,power:1} ~ ~2 ~ 1 2 1 1 50 force @a
execute if entity @s[scores={content_lock.attack_timer=60}] run playsound entity.witch.drink hostile @a ~ ~ ~ 4 0.5

execute if entity @s[scores={content_lock.attack_timer=40}] run playsound entity.witch.throw hostile @a ~ ~ ~ 4 0.7
execute if entity @s[scores={content_lock.attack_timer=40}] run summon area_effect_cloud ~ ~ ~ {Duration:400,Radius:3.0f,RadiusOnUse:0.0f,RadiusPerTick:0.01f,ReapplicationDelay:20,potion_contents:{custom_effects:[{id:"wither",duration:20}]},potion_duration_scale:1}

execute if entity @s[scores={content_lock.attack_timer=40}] run tag @s remove content_lock.wither.area_effect_cloud