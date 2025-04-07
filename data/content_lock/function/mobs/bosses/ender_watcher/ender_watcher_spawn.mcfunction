scoreboard players add @s progression 1
execute if entity @s[scores={progression=1}] run time set midnight
execute if entity @s[scores={progression=1}] run data merge entity @s {NoGravity:1b}
execute if entity @s[scores={progression=1}] run data merge entity @s {Motion:[0d,0d,0d]}
execute if entity @s[scores={progression=1}] run kill @e[nbt={Item:{id:"minecraft:ender_pearl",Count:4b}},distance=0..1]
particle minecraft:soul_fire_flame ^ ^ ^0.5 0 0 0 0 1 force @a
particle minecraft:soul_fire_flame ^ ^ ^-0.5 0 0 0 0 1 force @a
tp @s ~ ~0.05 ~ ~15 ~
execute at @s[scores={progression=1000}] run summon minecraft:phantom ~ ~ ~ {Size:0,AX:0,AY:0,AZ:0,CustomName:'[{"text":"Ender Watcher","bold":true,"color":"light_purple"}]',CustomNameVisible:1b,Health:400,Glowing:1b,Motion:[0d,0d,0d],Tags:[ender_watcher,boss],HandItems:[{id:golden_sword,tag:{Damage:12,RepairCost:2000,display:{Name:'[{"text":"Sharpest Blade In The Town","italic":false,"bold":true,"color":"dark_purple"}]'},Enchantments:[{id:sharpness,lvl:160}]},Count:1},{id:spyglass,tag:{watchers_gaze:1b,AttributeModifiers:[{AttributeName:"generic.movement_speed",Amount:0.1,Slot:offhand,Name:"generic.movement_speed",UUID:[I;-123623,165007,133031,-330014]},{AttributeName:"generic.attack_damage",Amount:0.25,Slot:offhand,Operation:2,Name:"generic.attack_damage",UUID:[I;-123623,165107,133031,-330214]}],display:{Name:'[{"text":"Watcher\'s Gaze","italic":false,"bold":true,"color":"dark_purple"}]',Lore:['[{"text":"Looking through it for a few"}]','[{"text":"seconds teleports you to a","italic":true}]','[{"text":"chosen location.","italic":true}]']}},Count:1}],HandDropChances:[0.25f,0.25f],ArmorItems:[{},{},{id:elytra,tag:{RepairCost:2000,display:{Name:'[{"text":"Ender Wings","italic":false,"color":"dark_purple","bold":true}]'}},Count:1},{id:phantom_membrane,Count:15}],ArmorDropChances:[0f,0f,0.05f,1.00f],Attributes:[{Name:"generic.max_health",Base:400f}]}
#execute as @s[scores={progression=100..}] at @s run give @p nether_star
#kill @s[scores={progression=100..}]
data merge entity @s[scores={progression=999..}] {NoGravity:0b}
execute as @s at @s if entity @s[scores={progression=999}] run particle minecraft:cloud ~ ~-50 ~ 5 5 5 0.1 500 force @a
execute as @s at @s if entity @s[scores={progression=999}] run playsound minecraft:entity.phantom.hurt master @a ~ ~-50 ~ 2 0.5
execute as @s at @s if entity @s[scores={progression=..999}] run function content_lock:bosses/ender_watcher/ender_watcher_spawn
