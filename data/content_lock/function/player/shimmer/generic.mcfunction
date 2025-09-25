particle bubble ~ ~ ~ 0.3 0.3 0.3 1 20 normal @a
playsound entity.zombie.converted_to_drowned neutral @a ~ ~ ~ 1 2

$data merge storage content_lock:saved_stats {count:1,item:$(item)}
$execute store result storage content_lock:saved_stats count int $(count) run data get entity @s Item.count

function content_lock:player/shimmer/generic_summon with storage content_lock:saved_stats
kill @s