execute store result bossbar content_lock.third_officer max run attribute @s max_health get
execute store result bossbar content_lock.third_officer value run data get entity @s Health
bossbar set content_lock.third_officer players @a[distance=0..40] 