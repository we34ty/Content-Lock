execute if entity @s[scores={wither_killed=20..}] run effect give @s resistance 1 5
execute if entity @s[scores={wither_killed=200}] run tellraw @a[distance=0..20] [{"text": "<Blaze Lord> ","color": "red"},{"text": "What, still here?","color": "white"}]
execute if entity @s[scores={wither_killed=140}] run playsound entity.blaze.hurt voice @a[distance=0..20] ~ ~ ~ 2 0.5
execute if entity @s[scores={wither_killed=120}] run playsound entity.blaze.hurt voice @a[distance=0..20] ~ ~ ~ 2 0.5
execute if entity @s[scores={wither_killed=100}] run playsound entity.blaze.hurt voice @a[distance=0..20] ~ ~ ~ 2 0.5
execute if entity @s[scores={wither_killed=80}] run tellraw @a[distance=0..20] [{"text": "<Blaze Lord> ","color": "red"},{"text": "Oh, I see.","color": "white"}]
execute if entity @s[scores={wither_killed=20}] run tellraw @a[distance=0..20] [{"text": "<Blaze Lord> ","color": "red"},{"text": "Lets get this over with.","color": "white"}]
scoreboard players remove @s wither_killed 1
scoreboard players set @s attack_timer 140