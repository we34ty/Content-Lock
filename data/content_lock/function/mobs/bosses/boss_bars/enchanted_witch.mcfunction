execute store result bossbar content_lock.enchanted_witch max run attribute @s max_health get
execute store result bossbar content_lock.enchanted_witch value run data get entity @s Health
bossbar set content_lock.enchanted_witch players @a[distance=0..40] 