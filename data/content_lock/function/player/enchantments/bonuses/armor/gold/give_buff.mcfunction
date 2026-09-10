$attribute @s movement_speed modifier add content_lock.enchantment.bonus.armor.gold $(value) add_multiplied_total
$attribute @s step_height modifier add content_lock.enchantment.bonus.armor.gold $(value) add_value
$attribute @s safe_fall_distance modifier add content_lock.enchantment.bonus.armor.gold $(value) add_value
$attribute @s attack_knockback modifier add content_lock.enchantment.bonus.armor.gold $(value) add_value


data remove storage content_lock:saved_stats data
data merge storage content_lock:saved_stats {UUID:0, path:"weapon.damage_modifiers.fire",data:{name:"content_lock.enchantment.bonus.armor.gold",operation:"add",value:0.0f}}
data modify storage content_lock:saved_stats UUID set from entity @s UUID

execute store result score @s content_lock.temp1 run attribute @s movement_speed get 1000

execute store result storage content_lock:saved_stats data.value float 0.001 run scoreboard players get @s content_lock.temp1
#tellraw @a {"storage":"content_lock:saved_stats","nbt":"data.value","color":"gold"}

execute if score @s content_lock.enchantment.bonus.armor.gold.timer matches 1.. run function content_lock:player/passives/storage/player_data/append_to_path with storage content_lock:saved_stats
data remove storage content_lock:saved_stats data