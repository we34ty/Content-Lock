execute store result bossbar content_lock.iron_guardian max run attribute @s max_health get
execute store result bossbar content_lock.iron_guardian value run data get entity @s Health
bossbar set content_lock.iron_guardian players @a[distance=0..40] 