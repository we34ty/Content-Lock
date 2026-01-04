playsound entity.lightning_bolt.thunder player @a ~ ~ ~ 1 1.4

function content_lock:player/items/spells/spell_cast_macro {durability:550}

execute positioned ~ ~1 ~ run summon area_effect_cloud ^ ^ ^1 {Tags:["content_lock.witchs_book_projectile"],custom_particle:{type:"block",block_state:"air"},Duration:0}
$execute as @e[tag=content_lock.witchs_book_projectile,limit=1,sort=nearest] at @s run function content_lock:player/items/spells/witchs_book/witchs_book_projectile {half_range:$(half_range),range:$(range),UUID:$(UUID),damage:$(damage)}
