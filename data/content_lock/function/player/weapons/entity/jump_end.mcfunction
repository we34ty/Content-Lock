$execute at @n[nbt={UUID:$(UUID)}] run particle block{block_state:stone} ~ ~ ~ 2 0.2 2 1 20 force
playsound entity.player.attack.strong player @a ~ ~ ~ 1 0.7

data merge storage content_lock:weapon_stats {xz:1,y:1,2xz:2,2y:2}
function content_lock:player/weapons/entity/damage with storage content_lock:weapon_stats

$scoreboard players set @n[nbt={UUID:$(UUID)}] content_lock.weapons.cooldown 30
$execute as @n[nbt={UUID:$(UUID)}] run function lsp:attacking

function animated_java:weapons/remove/this