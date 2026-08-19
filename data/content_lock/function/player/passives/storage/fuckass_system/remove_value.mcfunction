$scoreboard players reset #$(UUID).content_lock.$(Name)-$(id) content_lock.temp1
$data merge storage content_lock:saved_stats {UUID:$(UUID),Name:"$(Name)",id:$(id),nextId:0,maxId:0}
$scoreboard players set L content_lock.temp1 $(id)
scoreboard players add L content_lock.temp1 1
execute store result storage content_lock:saved_stats nextId int 1 run scoreboard players get L content_lock.temp1
$execute store result storage content_lock:saved_stats maxId int 1 run scoreboard players get #$(UUID).content_lock.$(Name) content_lock.temp1
function content_lock:player/passives/storage/fuckass_system/loop_move_back with storage content_lock:saved_stats
$scoreboard players remove #$(UUID).content_lock.$(Name) content_lock.temp1 1