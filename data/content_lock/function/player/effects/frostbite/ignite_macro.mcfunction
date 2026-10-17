execute store result score @s content_lock.temp1 run data get entity @s Health 1000
$data merge storage content_lock:saved_stats {temp:$(damage)}
execute store result score @s content_lock.temp2 run data get storage content_lock:saved_stats temp 1000
execute unless entity @s[tag=content_lock.ignited] if score @s content_lock.temp1 matches 1.. if score @s content_lock.temp1 <= @s content_lock.temp2 at @s run function content_lock:player/effects/frostbite/ignition_charged

$function content_lock:player/effects/frostbite/ignite_damage {damage:$(damage)}