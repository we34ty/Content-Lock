attribute @s movement_speed modifier remove content_lock.frostbite

function content_lock:player/weapons/modifier/armor/remove {name: "content_lock.frostbite"}

tellraw @s [{"translate": "content_lock:effect.frostbite.deactivated","color":"blue"}]
tag @s remove content_lock.frostbite_active

scoreboard players set @s content_lock.frostbite_stacks 0