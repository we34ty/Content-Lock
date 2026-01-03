#execute if entity @s[tag=summoning_phase] if predicate content_lock:random if predicate content_lock:random run summon minecraft:blaze ~ ~ ~ {CustomName:'[{"text":"Blaze Warden","color":"gold"}]',CustomNameVisible:1b,Health:100,HasVisualFire:1b,Tags:["blaze_warden"],HandItems:[{id:shield,tag:{Unbreakable:1,AttributeModifiers:[{AttributeName:"generic.movement_speed",Amount:-0.2,Operation:2,Name:"generic.movement_speed",UUID:[I;-123622,18249,19834,-36498]},{AttributeName:"generic.armor_toughness",Amount:10,Name:"generic.armor_toughness",UUID:[I;-123622,18349,19834,-36698]},{AttributeName:"generic.armor",Amount:0.2,Operation:1,Name:"generic.armor",UUID:[I;-123622,18449,19834,-36898]},{AttributeName:"generic.knockback_resistance",Amount:1,Name:"generic.knockback_resistance",UUID:[I;-123622,18549,19834,-37098]},{AttributeName:"generic.max_health",Amount:0.2,Operation:1,Name:"generic.max_health",UUID:[I;-123622,18649,19834,-37298]}],display:{Name:'[{"text":"Blaze Warden\'s Shield","italic":false,"color":"gold"}]'}},Count:1},{id:shield,Count:1}],HandDropChances:[0.05f,0.00f],ArmorItems:[{id:shield,Count:1},{id:shield,Count:1},{id:shield,Count:1},{id:shield,Count:1}],ArmorDropChances:[0.00f,0.00f,0.00f,0.00f],Attributes:[{Name:"generic.armor",Base:16f},{Name:"generic.movement_speed",Base:0.4f},{Name:"generic.knockback_resistance",Base:1f},{Name:"generic.attack_knockback",Base:5f},{Name:"generic.attack_damage",Base:10f},{Name:"generic.max_health",Base:100f}]}

#item replace entity @s weapon.mainhand with enchanted_book[custom_name=[{"bold":true,"color":"dark_purple","italic":false,"text":"Witch's Book"}],lore=[{"color":"light_purple","italic":true,"text":"Can be either used as a resource, catalyst or a tool."}],enchantments={"minecraft:fire_aspect":4,"minecraft:knockback":4},stored_enchantments={"minecraft:fire_aspect":4,"minecraft:knockback":4,"minecraft:unbreaking":4},attribute_modifiers=[{id:"d9471071-e8a4-4262-af81-d411d5d25c5d",type:"attack_damage",amount:0.25,operation:"add_multiplied_total",slot:"offhand"},{id:"20bc711c-474c-48e7-93fe-f2bc425054b6",type:"attack_speed",amount:0.25,operation:"add_multiplied_base",slot:"offhand"},{id:"a42621db-62f3-4b73-8841-06604dc86bee",type:"movement_speed",amount:0.15,operation:"add_multiplied_base",slot:"offhand"}]] 1
item replace entity @s weapon.mainhand with air
execute store result score @s content_lock.temporary_health_holder run data get entity @s Health
execute store result score @s content_lock.huhhealth1 run attribute @s max_health get 0.5
execute if score @s[tag=!content_lock.second_phase] content_lock.temporary_health_holder <= @s content_lock.huhhealth1 run function content_lock:mobs/bosses/enchanted_witch/second_phase_transition


execute positioned ~ ~2 ~ if entity @e[type=splash_potion,distance=0..1,limit=1] as @e[type=splash_potion,distance=0..1] run kill @s
#effect clear @e[distance=0..40] poison

tag @e remove content_lock.im_a_target
execute on target run tag @s add content_lock.im_a_target

execute if entity @s[scores={content_lock.attack_timer=0}] run function content_lock:mobs/bosses/enchanted_witch/choose_attack

execute if entity @s[tag=content_lock.enchanted_witch.taze_attack] run function content_lock:mobs/bosses/enchanted_witch/taze_attack
execute if entity @s[tag=content_lock.enchanted_witch.teleport_away] run function content_lock:mobs/bosses/enchanted_witch/teleport_away
execute if entity @s[tag=content_lock.enchanted_witch.control_flames] run function content_lock:mobs/bosses/enchanted_witch/control_flames

execute if entity @s[tag=content_lock.enchanted_witch.necromancy_attack] run function content_lock:mobs/bosses/enchanted_witch/necromancy_attack
execute if entity @s[tag=content_lock.enchanted_witch.quick_laser] run function content_lock:mobs/bosses/enchanted_witch/quick_laser
execute if entity @s[tag=content_lock.enchanted_witch.frostbite_attack] run function content_lock:mobs/bosses/enchanted_witch/frostbite_attack



scoreboard players add @s content_lock.attack_timer 0
scoreboard players add @s content_lock.boss_exhaustion 0
execute if entity @s[scores={content_lock.attack_timer=1..},tag=!content_lock.exhausted] run scoreboard players remove @s content_lock.attack_timer 1
execute if entity @s[scores={content_lock.boss_exhaustion=1..}] run scoreboard players remove @s content_lock.boss_exhaustion 1
execute if entity @s[scores={content_lock.boss_exhaustion=400..,content_lock.attack_timer=1},tag=!content_lock.exhausted] run function content_lock:mobs/bosses/exhausted
execute if entity @s[scores={content_lock.boss_exhaustion=0},tag=content_lock.exhausted] run function content_lock:mobs/bosses/recovered_from_exhaustion
execute if entity @s[scores={content_lock.boss_exhaustion=1..},tag=content_lock.exhausted] run scoreboard players remove @s content_lock.boss_exhaustion 1
execute if score L content_lock.timer1 matches 2 if entity @s[scores={content_lock.boss_exhaustion=2..},tag=content_lock.second_phase] run scoreboard players remove @s content_lock.boss_exhaustion 2

function content_lock:mobs/bosses/music/boss_music {song:"content_lock:music.yhorm",duration:204}
execute if score L content_lock.timer1 matches 7 run function content_lock:mobs/bosses/boss_player_count_scaling {distance:40}
function content_lock:mobs/bosses/boss_bars/enchanted_witch
function content_lock:mobs/bosses/enchanted_witch/dsiplay
