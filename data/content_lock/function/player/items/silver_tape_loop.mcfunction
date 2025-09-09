execute if items entity @s weapon.mainhand *[damage=400] run return run item replace entity @s weapon.mainhand with minecraft:air

scoreboard players set @s content_lock.temp1 0
$execute if entity @s[nbt={Inventory:[{Slot:$(value)b}]}] if items entity @s container.$(value) *[damage] unless items entity @s container.$(value) minecraft:netherite_pickaxe[custom_data={"content_lock.silver_tape":true}] run function content_lock:player/items/silver_tape_repair with storage content_lock:saved_stats

scoreboard players add @s content_lock.temp3 1
execute store result storage content_lock:saved_stats value int 1 run scoreboard players get @s content_lock.temp3
execute if score @s content_lock.temp3 matches ..35 run function content_lock:player/items/silver_tape_loop with storage content_lock:saved_stats