execute at @p unless entity @n[tag=content_lock.second_officer] run return 0

scoreboard players set L content_lock.defeated_officer 2
tag @s remove content_lock.drop_summon_on_despawn

tellraw @a {"translate":"content_lock:notifications.killed_one_officer","color": "light_purple"}

function content_lock:mobs/bosses/boss_despawn