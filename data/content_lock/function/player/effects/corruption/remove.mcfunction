tellraw @s [{"translate": "content_lock:effect.corruption.deactivated","color":"blue"}]
tag @s remove content_lock.corrupted

scoreboard players set @s content_lock.corruption_time 0
scoreboard players set @s content_lock.corruption_meter 0
attribute @s max_health modifier remove content_lock.corruption
function content_lock:player/weapons/modifier/weapon/remove {name: "content_lock.corruption.melee"}
function content_lock:player/weapons/modifier/weapon/remove {name: "content_lock.corruption.ranged"}
function content_lock:player/weapons/modifier/weapon/remove {name: "content_lock.corruption.magic"}