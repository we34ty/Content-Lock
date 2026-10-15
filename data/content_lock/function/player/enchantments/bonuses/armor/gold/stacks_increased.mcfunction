scoreboard players set @s content_lock.enchantment.bonus.armor.gold.timer 5

scoreboard players operation @s content_lock.temp1 = @s content_lock.enchantment.bonus.armor.gold.stacks
scoreboard players operation @s content_lock.temp1 -= @s content_lock.enchantment.bonus.armor.gold.stacks_old
scoreboard players operation @s content_lock.enchantment.bonus.armor.gold.stacks -= @s content_lock.temp1

scoreboard players operation @s content_lock.temp2 = @s content_lock.enchantment.bonus.armor.gold.stacks
scoreboard players set @s content_lock.temp3 100
scoreboard players operation @s content_lock.temp2 /= @s content_lock.temp3
scoreboard players operation @s content_lock.temp1 /= @s content_lock.temp2

execute if score @s content_lock.temp1 matches 1 run scoreboard players set @s content_lock.temp1 0
scoreboard players operation @s content_lock.enchantment.bonus.armor.gold.stacks += @s content_lock.temp1
tellraw @s [{"text":"[Content Lock] Your gold armor bonus has increased! You now have "},{"score":{"name":"@s","objective":"content_lock.enchantment.bonus.armor.gold.stacks"}},{"text":" stacks."}]