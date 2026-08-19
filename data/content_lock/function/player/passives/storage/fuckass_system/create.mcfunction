$data merge storage content_lock:saved_stats {UUID:$(UUID),Name:"$(Name)",id:0,value:$(value)}
$execute store result storage content_lock:saved_stats id int 1 run scoreboard players add #$(UUID).content_lock.$(Name) content_lock.temp1 1
function content_lock:player/passives/storage/fuckass_system/overwrite with storage content_lock:saved_stats
$return run scoreboard players get #$(UUID).content_lock.$(Name) content_lock.temp1