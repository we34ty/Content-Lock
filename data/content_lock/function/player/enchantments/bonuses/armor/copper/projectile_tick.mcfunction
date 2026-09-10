scoreboard players add @s content_lock.timer2 1

particle electric_spark ~ ~ ~ 0.3 0.3 0.3 0.1 3 force @a

execute unless score @s content_lock.timer2 matches 20 run return 0
scoreboard players set @s content_lock.temp1 0
scoreboard players set @s content_lock.timer2 0
scoreboard players add @s content_lock.timer1 1
playsound content_lock:item.enchantment.lightstruck.attack player @a ~ ~ ~ 0.1 1

tag @e remove content_lock.enchantment.bonus.armor.copper.lightning_marked
data merge storage content_lock:weapon_stats {Id:0,storage:"content_lock:weapon_stats"}
execute store result storage content_lock:weapon_stats Id int 1 run scoreboard players get @s content_lock.UUID_id
function content_lock:player/passives/storage/uuid_id/load with storage content_lock:weapon_stats

function content_lock:player/enchantments/bonuses/armor/copper/projectile_raycast with storage content_lock:weapon_stats data

execute store result storage content_lock:weapon_stats data.physical_damage float 0.5 run data get storage content_lock:weapon_stats data.physical_damage
execute store result storage content_lock:weapon_stats data.fire_damage float 0.5 run data get storage content_lock:weapon_stats data.fire_damage
execute store result storage content_lock:weapon_stats data.frost_damage float 0.5 run data get storage content_lock:weapon_stats data.frost_damage
execute store result storage content_lock:weapon_stats data.magic_damage float 0.5 run data get storage content_lock:weapon_stats data.magic_damage
execute store result storage content_lock:weapon_stats data.wither_damage float 0.5 run data get storage content_lock:weapon_stats data.wither_damage
execute store result storage content_lock:weapon_stats data.ender_damage float 0.5 run data get storage content_lock:weapon_stats data.ender_damage

execute if score @s content_lock.timer1 matches 5.. run kill @s