$scoreboard players set L content_lock.temp1 $(nextId)
$scoreboard players add L content_lock.temp2 $(maxId)
execute if score L content_lock.temp1 > L content_lock.temp2 run return 0

$scoreboard players operation #$(UUID).content_lock.$(Name)-$(id) content_lock.temp1 = #$(UUID).content_lock.$(Name)-$(nextId) content_lock.temp1
$scoreboard players reset #$(UUID).content_lock.$(Name)-$(nextId) content_lock.temp1

execute store result storage content_lock:saved_stats id int 1 run scoreboard players get L content_lock.temp1
scoreboard players add L content_lock.temp1 1
execute store result storage content_lock:saved_stats nextId int 1 run scoreboard players get L content_lock.temp1
function content_lock:player/passives/storage/fuckass_system/loop_move_back with storage content_lock:saved_stats