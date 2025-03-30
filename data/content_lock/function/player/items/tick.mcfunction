execute if score @r content_lock.reset_spell matches 1 as @a[scores={content_lock.reset_spell=1..}] run function content_lock:player/items/spells/reset_spell
execute if score @r content_lock.reset_spell matches 2.. run scoreboard players remove @a[scores={content_lock.reset_spell=1..}] content_lock.reset_spell 1

execute if entity @r[tag=content_lock.blocking_with_sword,tag=content_lock.blocking_with_sword_disable] as @a[tag=content_lock.blocking_with_sword,tag=content_lock.blocking_with_sword_disable] run function content_lock:player/items/block_with_sword_stop
execute if entity @r[tag=content_lock.blocking_with_sword,tag=!content_lock.blocking_with_sword_disable] as @a[tag=content_lock.blocking_with_sword,tag=!content_lock.blocking_with_sword_disable] run tag @s add content_lock.blocking_with_sword_disable

execute if entity @r[scores={content_lock.shovel_charge=1..}] as @a[scores={content_lock.shovel_charge=1..}] run function content_lock:player/items/charge_shovel_check