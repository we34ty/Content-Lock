data merge storage content_lock:saved_stats {type:"max_health"}
execute store result storage content_lock:saved_stats value float 0.5 run scoreboard players get @s content_lock.hp_from_level
function content_lock:player/levels/scale_level_statistic_macro_add with storage content_lock:saved_stats

data merge storage content_lock:saved_stats {type:"movement_efficiency"}
execute store result storage content_lock:saved_stats value float 0.05 run scoreboard players get @s content_lock.eqld_from_level
function content_lock:player/levels/scale_level_statistic_macro_add with storage content_lock:saved_stats

data merge storage content_lock:saved_stats {type:"attack_speed"}
execute store result storage content_lock:saved_stats value float 0.015 run scoreboard players get @s content_lock.atkspd_from_level
function content_lock:player/levels/scale_level_statistic_macro_multiply with storage content_lock:saved_stats

data merge storage content_lock:saved_stats {type:"mining_efficiency"}
execute store result storage content_lock:saved_stats value float 0.25 run scoreboard players get @s content_lock.atkspd_from_level
function content_lock:player/levels/scale_level_statistic_macro_add with storage content_lock:saved_stats

data merge storage content_lock:saved_stats {type:"attack_damage"}
execute store result storage content_lock:saved_stats value float 0.015 run scoreboard players get @s content_lock.dmg_from_level
function content_lock:player/levels/scale_level_statistic_macro_multiply with storage content_lock:saved_stats

data merge storage content_lock:saved_stats {type:"entity_interaction_range"}
execute store result storage content_lock:saved_stats value float 0.015 run scoreboard players get @s content_lock.atkrng_from_level
function content_lock:player/levels/scale_level_statistic_macro_multiply with storage content_lock:saved_stats

data merge storage content_lock:saved_stats {type:"block_interaction_range"}
execute store result storage content_lock:saved_stats value float 0.025 run scoreboard players get @s content_lock.atkrng_from_level
function content_lock:player/levels/scale_level_statistic_macro_multiply with storage content_lock:saved_stats

data merge storage content_lock:saved_stats {type:"movement_speed"}
execute store result storage content_lock:saved_stats value float 0.05 run scoreboard players get @s content_lock.mvtspd_from_level
function content_lock:player/levels/scale_level_statistic_macro_multiply with storage content_lock:saved_stats