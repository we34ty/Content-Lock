execute if entity @s[tag=content_lock.enchantment.bonus.armor.iron.damaged_already] run return 0
tag @s add content_lock.enchantment.bonus.armor.iron.damaged_already

execute unless score @s content_lock.enchantment.bonus.armor.iron.stacks matches 1.. run return 0
scoreboard players remove @s content_lock.enchantment.bonus.armor.iron.stacks 1

scoreboard players set @s content_lock.enchantment.bonus.armor.iron.enemy_timer 10
execute if score @s content_lock.enchantment.bonus.armor.iron.pieces matches 1 unless score @s content_lock.enchantment.bonus.armor.iron.enemy_stacks matches 3.. run scoreboard players add @s content_lock.enchantment.bonus.armor.iron.enemy_stacks 1
execute if score @s content_lock.enchantment.bonus.armor.iron.pieces matches 2 unless score @s content_lock.enchantment.bonus.armor.iron.enemy_stacks matches 5.. run scoreboard players add @s content_lock.enchantment.bonus.armor.iron.enemy_stacks 1
execute if score @s content_lock.enchantment.bonus.armor.iron.pieces matches 3 unless score @s content_lock.enchantment.bonus.armor.iron.enemy_stacks matches 8.. run scoreboard players add @s content_lock.enchantment.bonus.armor.iron.enemy_stacks 1
execute if score @s content_lock.enchantment.bonus.armor.iron.pieces matches 4 unless score @s content_lock.enchantment.bonus.armor.iron.enemy_stacks matches 10.. run scoreboard players add @s content_lock.enchantment.bonus.armor.iron.enemy_stacks 1

function content_lock:player/enchantments/bonuses/armor/iron/enemy_update_damage

tag @e remove content_lock.enchantment.bonus.armor.iron.knockback_immune
tag @s add content_lock.enchantment.bonus.armor.iron.knockback_immune
scoreboard players set $strength player_motion.api.launch 1000
execute at @s positioned ~-3 ~-3 ~-3 as @e[type=#hostile,dx=6,dy=6,dz=6,tag=!content_lock.enchantment.bonus.armor.iron.knockback_immune] at @s run function content_lock:player/enchantments/bonuses/armor/iron/enemy_knockback

execute at @s run playsound entity.player.attack.nodamage player @s ~ ~ ~ 1 1