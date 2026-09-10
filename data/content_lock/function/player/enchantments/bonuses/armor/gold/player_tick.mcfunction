execute if score @s content_lock.enchantment.bonus.armor.gold.pieces matches 1 run scoreboard players set @s content_lock.enchantment.bonus.armor.gold.reduction 800
execute if score @s content_lock.enchantment.bonus.armor.gold.pieces matches 2 run scoreboard players set @s content_lock.enchantment.bonus.armor.gold.reduction 500
execute if score @s content_lock.enchantment.bonus.armor.gold.pieces matches 3 run scoreboard players set @s content_lock.enchantment.bonus.armor.gold.reduction 200
execute if score @s content_lock.enchantment.bonus.armor.gold.pieces matches 4 run scoreboard players set @s content_lock.enchantment.bonus.armor.gold.reduction 0

execute if predicate content_lock:sneaking run scoreboard players set @s content_lock.enchantment.bonus.armor.gold.stacks 0

scoreboard players operation @s content_lock.temp1 = @s content_lock.enchantment.bonus.armor.gold.pieces
scoreboard players operation @s content_lock.temp1 *= @s content_lock.enchantment.bonus.armor.gold.stacks

scoreboard players set @s content_lock.temp2 4
# if score @s content_lock.enchantment.bonus.armor.gold.timer matches ..0 if score @s content_lock.enchantment.bonus.armor.gold.stacks matches 40000.. if entity @s[nbt={OnGround:1b}] run scoreboard players operation @s content_lock.temp1 /= @s content_lock.temp2

execute store result storage content_lock:saved_stats value float 0.000045 run scoreboard players get @s content_lock.temp1

function content_lock:player/enchantments/bonuses/armor/gold/give_buff with storage content_lock:saved_stats

scoreboard players set @s content_lock.enchantment.bonus.armor.gold.pieces 0

#execute if predicate content_lock:detect_movement if score @s content_lock.enchantment.bonus.armor.gold.stacks_old >= @s content_lock.enchantment.bonus.armor.gold.stacks if score @s content_lock.enchantment.bonus.armor.gold.stacks matches 1.. run scoreboard players remove @s content_lock.enchantment.bonus.armor.gold.stacks 100

execute unless predicate content_lock:detect_movement if score @s content_lock.enchantment.bonus.armor.gold.stacks matches 1.. run function content_lock:player/enchantments/bonuses/armor/gold/reduce_speed
execute if score @s content_lock.enchantment.bonus.armor.gold.stacks matches ..-1 run scoreboard players set @s content_lock.enchantment.bonus.armor.gold.stacks 0

execute if score @s content_lock.enchantment.bonus.armor.gold.stacks_old >= @s content_lock.enchantment.bonus.armor.gold.stacks run scoreboard players remove @s content_lock.enchantment.bonus.armor.gold.timer 1
execute if score @s content_lock.enchantment.bonus.armor.gold.stacks_old < @s content_lock.enchantment.bonus.armor.gold.stacks run scoreboard players set @s content_lock.enchantment.bonus.armor.gold.timer 5

scoreboard players operation @s content_lock.enchantment.bonus.armor.gold.stacks_old = @s content_lock.enchantment.bonus.armor.gold.stacks