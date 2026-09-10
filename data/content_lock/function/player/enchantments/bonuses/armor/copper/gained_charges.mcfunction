## Reset the timer to 400 ticks (20 seconds) when the player gains charges
scoreboard players set @s content_lock.enchantment.bonus.armor.copper.timer 400

## Play the lightstruck sound effect and cancel the last instance of it if it was still playing
stopsound @s player content_lock:item.enchantment.lightstruck
playsound content_lock:item.enchantment.lightstruck player @s ~ ~ ~ 0.2 1