scoreboard players set @s content_lock.temp1 300
scoreboard players operation @s content_lock.temp2 = @s lsp.stamina
scoreboard players operation @s content_lock.temp3 = @s content_lock.max_stamina
scoreboard players operation @s content_lock.temp2 /= @s content_lock.temp1
scoreboard players operation @s content_lock.temp3 /= @s content_lock.temp1
scoreboard players operation @s content_lock.temp3 -= @s content_lock.temp2

execute if score @s content_lock.stamina.current_old = @s content_lock.temp2 if score @s content_lock.stamina.max_old = @s content_lock.temp3 run return 0

scoreboard players operation @s content_lock.stamina.current_old = @s content_lock.temp2
scoreboard players operation @s content_lock.stamina.max_old = @s content_lock.temp3

scoreboard players operation @s content_lock.temp1 = @s content_lock.temp2
scoreboard players operation @s content_lock.temp1 += @s content_lock.temp3
scoreboard players remove @s content_lock.temp1 5
scoreboard players operation @s content_lock.temp1 += @s content_lock.temp1
scoreboard players operation @s content_lock.temp1 += @s content_lock.temp3
scoreboard players operation @s content_lock.temp1 += @s content_lock.temp2

data merge storage content_lock:saved_stats {stamina_spaces:0}
execute store result storage content_lock:saved_stats stamina_spaces int 1 run scoreboard players get @s content_lock.temp1

execute unless score @s content_lock.temp2 matches 1.. run scoreboard players remove @s content_lock.temp3 1
execute unless score @s content_lock.temp2 matches 1.. run data merge storage content_lock:saved_stats {stamina:"{\"translate\":\"content_lock:font.E082\",\"shadow_color\": 0}"}
execute if score @s content_lock.temp2 matches 1.. run data merge storage content_lock:saved_stats {stamina:"{\"translate\":\"content_lock:font.E083\",\"shadow_color\": 0}"}

data merge storage content_lock:saved_stats {stamina_amount:0,value:"",type:"stamina_amount","end":"stamina"}
execute store result storage content_lock:saved_stats value int 1 run scoreboard players get @s lsp.stamina
function content_lock:player/effects/add_ends with storage content_lock:saved_stats
function content_lock:player/effects/stamina_segments with storage content_lock:saved_stats
execute if score L content_lock.options.player.stamina matches 0 run data merge storage content_lock:saved_stats {stamina:"",stamina_amount:"",stamina_spaces:0}
execute if entity @s[gamemode=creative] run data merge storage content_lock:saved_stats {stamina:"",stamina_amount:"",stamina_spaces:0}
execute if entity @s[gamemode=spectator] run data merge storage content_lock:saved_stats {stamina:"",stamina_amount:"",stamina_spaces:0}

data merge storage content_lock:saved_stats {data:{stamina:0,stamina_spaces:0},UUID:[I;0,0,0,0],path:"stamina"}
data modify storage content_lock:saved_stats UUID set from entity @s UUID
data modify storage content_lock:saved_stats data.stamina set from storage content_lock:saved_stats stamina
data modify storage content_lock:saved_stats data.stamina_spaces set from storage content_lock:saved_stats stamina_spaces
function content_lock:player/passives/storage/player_data/save_path with storage content_lock:saved_stats
data remove storage content_lock:saved_stats data