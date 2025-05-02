data merge entity @s {NoAI:1b}
effect give @s resistance infinite 4 false

summon minecraft:zombified_piglin ~-1 ~ ~ {attributes:[{id:"max_health",base:10},{id:"attack_damage",base:1},{id:"movement_speed",base:0.16},{id:"fall_damage_multiplier",base:-1}],Tags:["content_lock.can_cast_fireball","content_lock.zombified_piglin_princess.minion"]}
summon minecraft:zombified_piglin ~1 ~ ~ {attributes:[{id:"max_health",base:10},{id:"attack_damage",base:1},{id:"movement_speed",base:0.16},{id:"fall_damage_multiplier",base:-1}],Tags:["content_lock.can_cast_fireball","content_lock.zombified_piglin_princess.minion"]}
summon minecraft:zombified_piglin ~ ~ ~-1 {attributes:[{id:"max_health",base:10},{id:"attack_damage",base:1},{id:"movement_speed",base:0.16},{id:"fall_damage_multiplier",base:-1}],Tags:["content_lock.can_cast_fireball","content_lock.zombified_piglin_princess.minion"]}
summon minecraft:zombified_piglin ~ ~ ~1 {attributes:[{id:"max_health",base:10},{id:"attack_damage",base:1},{id:"movement_speed",base:0.16},{id:"fall_damage_multiplier",base:-1}],Tags:["content_lock.can_cast_fireball","content_lock.zombified_piglin_princess.minion"]}
summon minecraft:zombified_piglin ~-1 ~ ~1 {attributes:[{id:"max_health",base:10},{id:"attack_damage",base:1},{id:"movement_speed",base:0.16},{id:"fall_damage_multiplier",base:-1}],Tags:["content_lock.can_cast_fireball","content_lock.zombified_piglin_princess.minion"]}
summon minecraft:zombified_piglin ~1 ~ ~-1 {attributes:[{id:"max_health",base:10},{id:"attack_damage",base:1},{id:"movement_speed",base:0.16},{id:"fall_damage_multiplier",base:-1}],Tags:["content_lock.can_cast_fireball","content_lock.zombified_piglin_princess.minion"]}

fill ~-1 ~2 ~-1 ~1 ~6 ~1 air destroy
tp @s ~ ~3 ~
tag @s add content_lock.zombified_piglin_princess.phase1.begin
