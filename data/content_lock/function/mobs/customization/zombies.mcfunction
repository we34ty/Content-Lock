attribute @s spawn_reinforcements modifier add content_lock.customized_content_lock 0.6 add_multiplied_base
attribute @s max_health modifier add content_lock.customized_content_lock -0.3 add_multiplied_total
data merge entity @s {CanBreakDoors:1b}
tag @s add content_lock.can_be_raised_from_ground
tag @s add content_lock.can_charge_jump
tag @s add content_lock.attacks_on_sight

execute unless score L content_lock.progression matches 1 run return 0
execute unless entity @s[type=zombie] run return 0
execute store result score @s content_lock.temp1 run function content_lock:check_random_chance {chance:6}
execute if score @s content_lock.temp1 matches 1 run summon wither_skeleton ~ ~ ~ {DeathLootTable:"content_lock:entities/wither_skeleton_with_soul_sand",attributes:[{id:"minecraft:scale",base:0.8},{id:"minecraft:attack_damage",base:1}]}
execute if score @s content_lock.temp1 matches 2 run summon zombified_piglin ~ ~ ~
execute if score @s content_lock.temp1 matches 1..2 run function content_lock:mobs/bosses/boss_despawn