execute if score L content_lock.timer1 matches 10 store result score @s content_lock.temp1 run data get entity @s Health 100
execute if score L content_lock.timer1 matches 10 store result score @s content_lock.temp2 run attribute @s max_health get 1
execute if score L content_lock.timer1 matches 10 run scoreboard players operation @s content_lock.temp1 /= @s content_lock.temp2
execute if score L content_lock.timer1 matches 10 if score @s content_lock.temp1 matches ..50 run function content_lock:mobs/bosses/zombified_piglin_princess/phase2_transition

execute if score L content_lock.timer1 matches 10 run scoreboard players set @s content_lock.temp1 0
execute if score L content_lock.timer1 matches 10 as @e[type=zombified_piglin,tag=content_lock.zombified_piglin_princess.minion,distance=..40] run scoreboard players add @e[tag=content_lock.zombified_piglin_princess] content_lock.temp1 1
execute if score L content_lock.timer1 matches 10 if score @s content_lock.temp1 matches 13.. as @e[type=zombified_piglin,distance=..40,tag=!content_lock.boss,tag=content_lock.zombified_piglin_princess.minion,limit=1,sort=random,tag=!content_lock.zombified_piglin_princess.damage_to_boss,tag=!content_lock.zombified_piglin_princess.damage_to_boss.begin] run function content_lock:mobs/bosses/boss_despawn

execute unless entity @s[tag=content_lock.zombified_piglin_princess.phase1.begin] run function content_lock:mobs/bosses/zombified_piglin_princess/phase1_begin
execute if entity @e[type=zombified_piglin,tag=content_lock.zombified_piglin_princess.damage_to_boss.begin] as @e[type=zombified_piglin,tag=content_lock.zombified_piglin_princess.damage_to_boss.begin] at @s run function content_lock:mobs/bosses/zombified_piglin_princess/damage_to_boss_begin
execute if entity @e[type=zombified_piglin,tag=content_lock.zombified_piglin_princess.damage_to_boss] as @e[type=zombified_piglin,tag=content_lock.zombified_piglin_princess.damage_to_boss] at @s run function content_lock:mobs/bosses/zombified_piglin_princess/damage_to_boss

execute if score @s content_lock.attack_timer matches 0 run summon minecraft:zombified_piglin ~ ~-2 ~ {attributes:[{id:"max_health",base:10},{id:"attack_damage",base:1},{id:"movement_speed",base:0.16}],Tags:["content_lock.can_cast_fireball","content_lock.zombified_piglin_princess.minion"]}
execute if score @s content_lock.attack_timer matches 0 run summon minecraft:zombified_piglin ~ ~-2 ~ {attributes:[{id:"max_health",base:10},{id:"attack_damage",base:1},{id:"movement_speed",base:0.16}],Tags:["content_lock.can_cast_fireball","content_lock.zombified_piglin_princess.minion"]}
execute if score @s content_lock.attack_timer matches 0 run summon minecraft:zombified_piglin ~ ~-2 ~ {attributes:[{id:"max_health",base:10},{id:"attack_damage",base:1},{id:"movement_speed",base:0.16}],Tags:["content_lock.can_cast_fireball","content_lock.zombified_piglin_princess.minion"]}
execute if score @s content_lock.attack_timer matches 0 run summon minecraft:zombified_piglin ~ ~-2 ~ {attributes:[{id:"max_health",base:10},{id:"attack_damage",base:1},{id:"movement_speed",base:0.16}],Tags:["content_lock.can_cast_fireball","content_lock.zombified_piglin_princess.minion"]}
execute if score @s content_lock.attack_timer matches 0 run tag @e remove content_lock.zombified_piglin_princess.damage_to_boss
execute if score @s content_lock.attack_timer matches 0 as @e[type=zombified_piglin,limit=1,sort=random,distance=..30,tag=!content_lock.zombified_piglin_princess,tag=content_lock.zombified_piglin_princess.minion] run tag @s add content_lock.zombified_piglin_princess.damage_to_boss.begin
execute if score @s content_lock.attack_timer matches 0 run scoreboard players set @s content_lock.attack_timer 200

execute unless entity @s[tag=content_lock.zombified_piglin_princess.begin] unless entity @e[tag=content_lock.zombified_piglin_princess.damage_to_boss] unless entity @e[tag=content_lock.zombified_piglin_princess.damage_to_boss.begin] run damage @s 30 generic_kill
execute unless entity @s[tag=content_lock.zombified_piglin_princess.begin] unless entity @e[tag=content_lock.zombified_piglin_princess.damage_to_boss] unless entity @e[tag=content_lock.zombified_piglin_princess.damage_to_boss.begin] run scoreboard players set @s content_lock.attack_timer 0

tag @s remove content_lock.zombified_piglin_princess.begin