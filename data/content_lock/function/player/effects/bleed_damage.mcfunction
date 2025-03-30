particle block_crumble{block_state:red_concrete} ~ ~1 ~ 0.2 0.5 0.2 1 30 normal
tag @e remove content_lock.attacker
execute on attacker run tag @s add content_lock.attacker
$damage @s $(damage) content_lock:bleed by @e[tag=attacker,limit=1,sort=nearest]
$execute unless entity @e[tag=attacker] run damage @s $(damage) content_lock:bleed by @s
tag @e remove content_lock.attacker
playsound item.bucket.empty hostile @a ~ ~ ~ 1 1.2
playsound entity.player.attack.crit hostile @a ~ ~ ~ 1 1.5
playsound block.conduit.deactivate hostile @a ~ ~ ~ 0.2 2