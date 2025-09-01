execute store result score @s content_lock.huhhealth1 run attribute @s max_health get 100000
execute store result score @s content_lock.huhhealth2 run attribute @s max_health get
scoreboard players set @s content_lock.temp1 100000
scoreboard players operation @s content_lock.huhhealth1 %= @s content_lock.temp1
execute if score @s content_lock.huhhealth1 matches 1.. run scoreboard players add @s content_lock.huhhealth2 1
scoreboard players set @s content_lock.temp1 2
scoreboard players operation @s content_lock.huhhealth2 %= @s content_lock.temp1
execute if score @s content_lock.huhhealth2 matches 1 run attribute @s max_health modifier remove content_lock.round_health

execute store result score @s content_lock.huhhealth1 run attribute @s max_health get 100000
execute store result score @s content_lock.huhhealth2 run attribute @s max_health get
scoreboard players set @s content_lock.temp1 100000
scoreboard players operation @s content_lock.huhhealth1 %= @s content_lock.temp1
execute if score @s content_lock.huhhealth1 matches 1.. run scoreboard players add @s content_lock.huhhealth2 1
scoreboard players set @s content_lock.temp1 2
scoreboard players operation @s content_lock.huhhealth2 %= @s content_lock.temp1
execute if score @s content_lock.huhhealth2 matches 1 run attribute @s max_health modifier add content_lock.round_health 1 add_value
