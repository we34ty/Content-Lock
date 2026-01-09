execute store result bossbar content_lock.wither_skeleton_revolution_leader max run attribute @s max_health get
execute store result bossbar content_lock.wither_skeleton_revolution_leader value run data get entity @s Health
bossbar set content_lock.wither_skeleton_revolution_leader players @a[distance=0..40] 