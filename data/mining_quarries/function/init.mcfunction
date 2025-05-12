scoreboard objectives remove quarry_damage
scoreboard objectives add quarry_damage dummy

scoreboard objectives remove quarry_temp_var
scoreboard objectives add quarry_temp_var dummy

scoreboard objectives add quarry_cooldown dummy

scoreboard objectives add quarry_place minecraft.used:minecraft.dropper


scoreboard players set mining_quarry_2 quarry_temp_var 2


schedule function mining_quarries:tick 2t replace
schedule function mining_quarries:quarry_tick 10t replace