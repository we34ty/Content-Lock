execute store result bossbar content_lock.death_rider max run attribute @s max_health get
execute store result bossbar content_lock.death_rider value run data get entity @s Health
bossbar set content_lock.death_rider players @a[distance=0..40] 