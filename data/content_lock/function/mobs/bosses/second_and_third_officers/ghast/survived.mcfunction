execute at @p unless entity @n[tag=content_lock.third_officer] run return 0

scoreboard players set L content_lock.defeated_officer 3

tellraw @a {"translate":"content_lock:notifications.killed_one_officer","color": "light_purple"}

function content_lock:mobs/bosses/boss_despawn