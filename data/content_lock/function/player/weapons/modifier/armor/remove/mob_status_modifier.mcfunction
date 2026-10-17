$execute if items entity @s armor.feet * run data remove entity @s equipment.feet.components."minecraft:custom_data"."content_lock:armor"."status_resistance_modifiers"."$(type)"[{name:"$(name)"}]

$execute if items entity @s armor.legs * run data remove entity @s equipment.legs.components."minecraft:custom_data"."content_lock:armor"."status_resistance_modifiers"."$(type)"[{name:"$(name)"}]

$execute if items entity @s armor.chest * run data remove entity @s equipment.chest.components."minecraft:custom_data"."content_lock:armor"."status_resistance_modifiers"."$(type)"[{name:"$(name)"}]

$execute if items entity @s armor.head * run data remove entity @s equipment.head.components."minecraft:custom_data"."content_lock:armor"."status_resistance_modifiers"."$(type)"[{name:"$(name)"}]
