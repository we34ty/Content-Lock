data remove storage content_lock:saved_stats data
$data merge storage content_lock:saved_stats {UUID:0, data:{name:"$(name)",operation:"$(operation)"}}
data modify storage content_lock:saved_stats UUID set from entity @s UUID

$execute unless data storage content_lock:saved_stats {physical_damage:0} run function content_lock:player/weapons/entity/apply/player_modifier {type: "physical", value: $(physical_damage)}
$execute unless data storage content_lock:saved_stats {fire_damage:0} run function content_lock:player/weapons/entity/apply/player_modifier {type: "fire", value: $(fire_damage)}
$execute unless data storage content_lock:saved_stats {frost_damage:0} run function content_lock:player/weapons/entity/apply/player_modifier {type: "frost", value: $(frost_damage)}
$execute unless data storage content_lock:saved_stats {magic_damage:0} run function content_lock:player/weapons/entity/apply/player_modifier {type: "magic", value: $(magic_damage)}
$execute unless data storage content_lock:saved_stats {wither_damage:0} run function content_lock:player/weapons/entity/apply/player_modifier {type: "wither", value: $(wither_damage)}
$execute unless data storage content_lock:saved_stats {ender_damage:0} run function content_lock:player/weapons/entity/apply/player_modifier {type: "ender", value: $(ender_damage)}

$execute unless data storage content_lock:saved_stats {bleed_status:0} run function content_lock:player/weapons/entity/apply/player_status_modifier {type: "bleed", value: $(bleed_status)}
$execute unless data storage content_lock:saved_stats {poison_status:0} run function content_lock:player/weapons/entity/apply/player_status_modifier {type: "poison", value: $(poison_status)}
$execute unless data storage content_lock:saved_stats {corruption_status:0} run function content_lock:player/weapons/entity/apply/player_status_modifier {type: "corruption", value: $(corruption_status)}
$execute unless data storage content_lock:saved_stats {wither_status:0} run function content_lock:player/weapons/entity/apply/player_status_modifier {type: "wither", value: $(wither_status)}
$execute unless data storage content_lock:saved_stats {frostbite_status:0} run function content_lock:player/weapons/entity/apply/player_status_modifier {type: "frostbite", value: $(frostbite_status)}
data remove storage content_lock:saved_stats data