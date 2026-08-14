##checks if player's UUID is inside of the array, and if it isn't it is added
$execute if data storage content_lock:player_data UUIDs[{UUID:$(UUID)}] run return 0
$data modify storage content_lock:player_data UUIDs append value {UUID:$(UUID),data:{stamina:{stamina:"",stamina_spaces:0},weapon:{}}}