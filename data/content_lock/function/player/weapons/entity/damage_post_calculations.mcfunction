$execute positioned ~-$(xz_length) ~-$(y_length) ~-$(xz_length) positioned ~$(xz) ~$(y) ~$(xz) as @e[type=!#entities,dx=$(xz_length),dz=$(xz_length),dy=$(y_length),nbt=!{UUID:$(UUID)}] positioned ~$(xz_length) ~$(y_length) ~$(xz_length) positioned ~-$(2xz) ~-$(2y) ~-$(2xz) if entity @s[dx=$(xz_length),dz=$(xz_length),dy=$(y_length)] at @s run damage @s $(damage) $(damage_type) by @n[nbt={UUID:$(UUID)}] from @n[nbt={UUID:$(UUID)}]

execute at @s run summon marker ~ ~ ~ {Tags:["content_lock_weapon_hitbox"]}
#$execute positioned ~-$(xz_length) ~-$(y_length) ~-$(xz_length) positioned ~$(xz) ~$(y) ~$(xz) facing entity @n[tag=content_lock_weapon_hitbox] feet positioned ~ ~ ~ run particle dust{color:16711680,scale:1} ~ ~ ~ 0 0 0 1 1 force
#$execute positioned ~-$(xz_length) ~-$(y_length) ~-$(xz_length) positioned ~$(xz) ~$(y) ~$(xz) positioned ~$(xz_length) ~ ~ facing entity @n[tag=content_lock_weapon_hitbox] feet positioned ~ ~ ~ run particle dust{color:16711680,scale:1} ~ ~ ~ 0 0 0 1 1 force
#$execute positioned ~-$(xz_length) ~-$(y_length) ~-$(xz_length) positioned ~$(xz) ~$(y) ~$(xz) positioned ~ ~$(y_length) ~ facing entity @n[tag=content_lock_weapon_hitbox] feet positioned ~ ~ ~ run particle dust{color:16711680,scale:1} ~ ~ ~ 0 0 0 1 1 force
#$execute positioned ~-$(xz_length) ~-$(y_length) ~-$(xz_length) positioned ~$(xz) ~$(y) ~$(xz) positioned ~ ~ ~$(xz_length) facing entity @n[tag=content_lock_weapon_hitbox] feet positioned ~ ~ ~ run particle dust{color:16711680,scale:1} ~ ~ ~ 0 0 0 1 1 force
#$execute positioned ~-$(xz_length) ~-$(y_length) ~-$(xz_length) positioned ~$(xz) ~$(y) ~$(xz) positioned ~$(xz_length) ~$(y_length) ~ facing entity @n[tag=content_lock_weapon_hitbox] feet positioned ~ ~ ~ run particle dust{color:16711680,scale:1} ~ ~ ~ 0 0 0 1 1 force
#$execute positioned ~-$(xz_length) ~-$(y_length) ~-$(xz_length) positioned ~$(xz) ~$(y) ~$(xz) positioned ~ ~$(y_length) ~$(xz_length) facing entity @n[tag=content_lock_weapon_hitbox] feet positioned ~ ~ ~ run particle dust{color:16711680,scale:1} ~ ~ ~ 0 0 0 1 1 force
#$execute positioned ~-$(xz_length) ~-$(y_length) ~-$(xz_length) positioned ~$(xz) ~$(y) ~$(xz) positioned ~$(xz_length) ~ ~$(xz_length) facing entity @n[tag=content_lock_weapon_hitbox] feet positioned ~ ~ ~ run particle dust{color:16711680,scale:1} ~ ~ ~ 0 0 0 1 1 force
#$execute positioned ~-$(xz_length) ~-$(y_length) ~-$(xz_length) positioned ~$(xz) ~$(y) ~$(xz) positioned ~$(xz_length) ~$(y_length) ~$(xz_length) facing entity @n[tag=content_lock_weapon_hitbox] feet positioned ~ ~ ~ run particle dust{color:16711680,scale:1} ~ ~ ~ 0 0 0 1 1 force

#$execute positioned ~-$(xz) ~-$(y) ~-$(xz) facing entity @n[tag=content_lock_weapon_hitbox] feet positioned ~ ~ ~ run particle dust{color:65293,scale:1} ~ ~ ~ 0 0 0 1 1 force
#$execute positioned ~-$(xz) ~-$(y) ~-$(xz) positioned ~$(xz_length) ~ ~ facing entity @n[tag=content_lock_weapon_hitbox] feet positioned ~ ~ ~ run particle dust{color:65293,scale:1} ~ ~ ~ 0 0 0 1 1 force
#$execute positioned ~-$(xz) ~-$(y) ~-$(xz) positioned ~ ~$(y_length) ~ facing entity @n[tag=content_lock_weapon_hitbox] feet positioned ~ ~ ~ run particle dust{color:65293,scale:1} ~ ~ ~ 0 0 0 1 1 force
#$execute positioned ~-$(xz) ~-$(y) ~-$(xz) positioned ~ ~ ~$(xz_length) facing entity @n[tag=content_lock_weapon_hitbox] feet positioned ~ ~ ~ run particle dust{color:65293,scale:1} ~ ~ ~ 0 0 0 1 1 force
#$execute positioned ~-$(xz) ~-$(y) ~-$(xz) positioned ~$(xz_length) ~$(y_length) ~ facing entity @n[tag=content_lock_weapon_hitbox] feet positioned ~ ~ ~ run particle dust{color:65293,scale:1} ~ ~ ~ 0 0 0 1 1 force
#$execute positioned ~-$(xz) ~-$(y) ~-$(xz) positioned ~ ~$(y_length) ~$(xz_length) facing entity @n[tag=content_lock_weapon_hitbox] feet positioned ~ ~ ~ run particle dust{color:65293,scale:1} ~ ~ ~ 0 0 0 1 1 force
#$execute positioned ~-$(xz) ~-$(y) ~-$(xz) positioned ~$(xz_length) ~ ~$(xz_length) facing entity @n[tag=content_lock_weapon_hitbox] feet positioned ~ ~ ~ run particle dust{color:65293,scale:1} ~ ~ ~ 0 0 0 1 1 force
#$execute positioned ~-$(xz) ~-$(y) ~-$(xz) positioned ~$(xz_length) ~$(y_length) ~$(xz_length) facing entity @n[tag=content_lock_weapon_hitbox] feet positioned ~ ~ ~ run particle dust{color:65293,scale:1} ~ ~ ~ 0 0 0 1 1 force

$execute positioned ~-$(xz) ~-$(y) ~-$(xz) facing entity @n[tag=content_lock_weapon_hitbox] feet positioned ~ ~ ~ run particle dust{color:2665700,scale:1} ~ ~ ~ 0 0 0 1 1 force
$execute positioned ~-$(xz) ~-$(y) ~-$(xz) positioned ~$(2xz) ~ ~ facing entity @n[tag=content_lock_weapon_hitbox] feet positioned ~ ~ ~ run particle dust{color:2665700,scale:1} ~ ~ ~ 0 0 0 1 1 force
$execute positioned ~-$(xz) ~-$(y) ~-$(xz) positioned ~ ~$(2y) ~ facing entity @n[tag=content_lock_weapon_hitbox] feet positioned ~ ~ ~ run particle dust{color:2665700,scale:1} ~ ~ ~ 0 0 0 1 1 force
$execute positioned ~-$(xz) ~-$(y) ~-$(xz) positioned ~ ~ ~$(2xz) facing entity @n[tag=content_lock_weapon_hitbox] feet positioned ~ ~ ~ run particle dust{color:2665700,scale:1} ~ ~ ~ 0 0 0 1 1 force
$execute positioned ~-$(xz) ~-$(y) ~-$(xz) positioned ~$(2xz) ~$(2y) ~ facing entity @n[tag=content_lock_weapon_hitbox] feet positioned ~ ~ ~ run particle dust{color:2665700,scale:1} ~ ~ ~ 0 0 0 1 1 force
$execute positioned ~-$(xz) ~-$(y) ~-$(xz) positioned ~ ~$(2y) ~$(2xz) facing entity @n[tag=content_lock_weapon_hitbox] feet positioned ~ ~ ~ run particle dust{color:2665700,scale:1} ~ ~ ~ 0 0 0 1 1 force
$execute positioned ~-$(xz) ~-$(y) ~-$(xz) positioned ~$(2xz) ~ ~$(2xz) facing entity @n[tag=content_lock_weapon_hitbox] feet positioned ~ ~ ~ run particle dust{color:2665700,scale:1} ~ ~ ~ 0 0 0 1 1 force
$execute positioned ~-$(xz) ~-$(y) ~-$(xz) positioned ~$(2xz) ~$(2y) ~$(2xz) facing entity @n[tag=content_lock_weapon_hitbox] feet positioned ~ ~ ~ run particle dust{color:2665700,scale:1} ~ ~ ~ 0 0 0 1 1 force


kill @n[tag=content_lock_weapon_hitbox]