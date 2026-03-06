#get matched wormhole position and generate particles and sound effects on nearest wormhole
execute as @n[tag=content_lock.wormhole] at @s run function content_lock:mobs/entities/wormhole/teleport_wormhole_stats

#in case the chunk loads for longer than 1 tick make sure the player doesn't pass through the ungenerated wormhole
tag @s add content_lock.load_chunk_no_gravity
attribute @s gravity modifier add content_lock.load_chunk_no_gravity -1 add_multiplied_total

damage @s 1 mob_attack by @e[tag=aj.wormhole.root,limit=1,sort=nearest] from @e[tag=aj.wormhole.root,limit=1,sort=nearest] 

#teleport using the arguments from nearest wormhole
function content_lock:mobs/entities/wormhole/teleport_with_args with storage content_lock:saved_stats


