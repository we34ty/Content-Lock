execute if score @s content_lock.fishing.stress matches ..29 run title @s subtitle {score:{name:"@s",objective:"content_lock.fishing.stress"},color:"green"}
execute if score @s content_lock.fishing.stress matches 30..74 run title @s subtitle {score:{name:"@s",objective:"content_lock.fishing.stress"},color:"yellow"}
execute if score @s content_lock.fishing.stress matches 75.. run title @s subtitle {score:{name:"@s",objective:"content_lock.fishing.stress"},color:"red"}

execute if score @s content_lock.fishing.display matches 2.. run scoreboard players set @s content_lock.fishing.display 0

execute if score @s content_lock.fishing.progress matches ..60 unless score @s content_lock.fishing.display matches 1 run title @s title {"text":"\uE072","shadow_color": 0}
execute if score @s content_lock.fishing.progress matches ..60 if score @s content_lock.fishing.display matches 1 run title @s title {"text":"\uE078","shadow_color": 0}

execute if score @s content_lock.fishing.progress matches 61..140 unless score @s content_lock.fishing.display matches 1 run title @s title {"text":"\uE073","shadow_color": 0}
execute if score @s content_lock.fishing.progress matches 61..140 if score @s content_lock.fishing.display matches 1 run title @s title {"text":"\uE077","shadow_color": 0}

execute if score @s content_lock.fishing.progress matches 141..250 unless score @s content_lock.fishing.display matches 1 run title @s title {"text":"\uE074","shadow_color": 0}
execute if score @s content_lock.fishing.progress matches 141..250 if score @s content_lock.fishing.display matches 1 run title @s title {"text":"\uE076","shadow_color": 0}

execute if score @s content_lock.fishing.progress matches 250..299 run title @s title {"text":"\uE075","shadow_color": 0}

execute if score @s content_lock.fishing.progress matches 300.. run title @s title {"text":"\uE079","shadow_color": 0}