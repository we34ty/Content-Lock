scoreboard objectives remove content_lock.quarry_damage
scoreboard objectives add content_lock.quarry_damage dummy

scoreboard objectives remove content_lock.quarry_temp_var
scoreboard objectives add content_lock.quarry_temp_var dummy

scoreboard objectives add content_lock.quarry_cooldown dummy

scoreboard objectives add content_lock.quarry_place minecraft.used:minecraft.dropper


scoreboard players set mining_quarry_2 content_lock.quarry_temp_var 2

scoreboard objectives add content_lock.quarry_id dummy


schedule function mining_quarries:tick 2t replace
schedule function mining_quarries:quarry_tick 10t replace