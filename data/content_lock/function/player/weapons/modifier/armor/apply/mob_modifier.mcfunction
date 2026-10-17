scoreboard players set L content_lock.temp1 0
execute if data storage content_lock:saved_stats {operation:"add"} run scoreboard players set L content_lock.temp1 1

$execute if items entity @s armor.feet * run data modify entity @s equipment.feet.components."minecraft:custom_data"."content_lock:armor"."damage_resistance_modifiers"."$(type)" append value {name:"$(name)",operation:"$(operation)",value:$(value)}
execute if score L content_lock.temp1 matches 1 if items entity @s armor.feet * run return 0

$execute if items entity @s armor.legs * run data modify entity @s equipment.legs.components."minecraft:custom_data"."content_lock:armor"."damage_resistance_modifiers"."$(type)" append value {name:"$(name)",operation:"$(operation)",value:$(value)}
execute if score L content_lock.temp1 matches 1 if items entity @s armor.legs * run return 0

$execute if items entity @s armor.chest * run data modify entity @s equipment.chest.components."minecraft:custom_data"."content_lock:armor"."damage_resistance_modifiers"."$(type)" append value {name:"$(name)",operation:"$(operation)",value:$(value)}
execute if score L content_lock.temp1 matches 1 if items entity @s armor.chest * run return 0

$execute if items entity @s armor.head * run data modify entity @s equipment.head.components."minecraft:custom_data"."content_lock:armor"."damage_resistance_modifiers"."$(type)" append value {name:"$(name)",operation:"$(operation)",value:$(value)}
execute if score L content_lock.temp1 matches 1 if items entity @s armor.head * run return 0
