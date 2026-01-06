$execute positioned ^$(x) ^$(y) ^2 run summon item_display ~ ~1 ~ {item_display:"head",item:{id:"wither_skeleton_skull"},transformation:[-1f,0f,0f,0f,0f,1f,0f,0f,0f,0f,-1f,0f,0f,0f,0f,1f],Tags:["content_lock.wither.projectile_barrage_wall.projectile"]}
$execute positioned ^$(x) ^$(y) ^2 positioned ~ ~1 ~ as @n[tag=content_lock.wither.projectile_barrage_wall.projectile] rotated as @n[type=wither] run rotate @s ~ ~
#summon item_display ~ ~ ~ {item_display:"head",item:{id:"wither_skeleton_skull"},transformation:{left_rotation:{axis:[0.0,1.0,0.0],angle:180},right_rotation:{axis:[0.0,1.0,0.0],angle:0},scale:[1.0,1.0,1.0],translation:[0.0,0.0,0.0]}}
scoreboard players add @s content_lock.boss.temp1 1
execute if score @s content_lock.boss.temp1 matches 6.. run scoreboard players add @s content_lock.boss.temp2 1
execute if score @s content_lock.boss.temp1 matches 6.. run scoreboard players set @s content_lock.boss.temp1 -5