execute if score @s content_lock.fishing.stress matches ..29 run title @s subtitle {score:{name:"@s",objective:"content_lock.fishing.stress"},color:"green"}
execute if score @s content_lock.fishing.stress matches 30..74 run title @s subtitle {score:{name:"@s",objective:"content_lock.fishing.stress"},color:"yellow"}
execute if score @s content_lock.fishing.stress matches 75.. run title @s subtitle {score:{name:"@s",objective:"content_lock.fishing.stress"},color:"red"}


execute if score @s content_lock.fishing.progress matches ..299 run title @s title {score:{name:"@s",objective:"content_lock.fishing.progress"}}
execute if score @s content_lock.fishing.progress matches 300.. run title @s title {score:{name:"@s",objective:"content_lock.fishing.progress"},color:"green"}