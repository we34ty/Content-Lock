advancement revoke @s only content_lock:checks/ignite_gravel
execute unless predicate content_lock:random run return 0
execute if block ~ ~ ~ #air run setblock ~ ~ ~ fire
playsound item.firecharge.use neutral @a ~ ~ ~ 1 1