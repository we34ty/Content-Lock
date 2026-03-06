#initialize
execute if entity @s[tag=!content_lock.wormhole] at @s run function content_lock:mobs/entities/wormhole/spawn
#check if blocks under the wormhole aren't air during its creation, otherwise place a block there/remove blocks which could suffocate the player
execute if entity @s[tag=!content_lock.wormhole.checked_for_blocks] at @s run function content_lock:mobs/entities/wormhole/check_blocks

#check if the block under the wormhole are air and destroy it and the wormhole it's connected to
execute at @s if block ~ ~-1 ~ #air run return run function content_lock:mobs/entities/wormhole/remove

#open and close wormholes if player is nearby
execute if entity @s[tag=content_lock.wormhole.open] unless entity @r[distance=..1.5] run function content_lock:mobs/entities/wormhole/close
execute if entity @s[tag=!content_lock.wormhole.open] if entity @r[distance=..1.5] run function content_lock:mobs/entities/wormhole/open