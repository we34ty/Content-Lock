execute if score @s content_lock.enchantment.bloodthirst.fight_time matches 1.. run scoreboard players add @s content_lock.enchantment.bloodthirst 1
execute if score @s content_lock.enchantment.bloodthirst.fight_time matches 0 run function content_lock:player/enchantments/bloodthirst/reset

execute if score @s content_lock.enchantment.bloodthirst matches 100..199 run function content_lock:player/enchantments/bloodthirst/bonus1
execute if score @s content_lock.enchantment.bloodthirst matches 200..299 run function content_lock:player/enchantments/bloodthirst/bonus2
execute if score @s content_lock.enchantment.bloodthirst matches 300..499 run function content_lock:player/enchantments/bloodthirst/bonus3
execute if score @s content_lock.enchantment.bloodthirst matches 500..799 run function content_lock:player/enchantments/bloodthirst/bonus4
execute if score @s content_lock.enchantment.bloodthirst matches 800..1699 run function content_lock:player/enchantments/bloodthirst/bonus5
execute if score @s content_lock.enchantment.bloodthirst matches 1700..6999 run function content_lock:player/enchantments/bloodthirst/bonus6
execute if score @s content_lock.enchantment.bloodthirst matches 7000.. run function content_lock:player/enchantments/bloodthirst/bonus7

tag @s remove content_lock.enchantment.bloodthirst
tag @s remove content_lock.enchantment.bloodthirst.1
tag @s remove content_lock.enchantment.bloodthirst.2
tag @s remove content_lock.enchantment.bloodthirst.3