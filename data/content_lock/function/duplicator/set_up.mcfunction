execute unless block ~ ~ ~ #air as @p unless entity @s[gamemode=creative] run give @s zombie_spawn_egg[item_name={translate:"content_lock:item.duplicator",italic:false},entity_data={id:"marker",Tags:["content_lock.duplicator"]},item_model="content_lock:duplicator"] 1
execute unless block ~ ~ ~ #air run return run kill @s

setblock ~ ~ ~ barrel[facing=up]{CustomName:{"translate":"content_lock:item.duplicator","italic":false}}
summon item_display ~ ~1.1 ~ {item:{components: {"minecraft:item_model": "content_lock:duplicator"}, count: 1, id: "minecraft:stone"},transformation: {left_rotation: [0.0f, 0.0f, 0.0f, 1.0f], right_rotation: [0.0f, 0.0f, 0.0f, 1.0f], scale: [1.01f, 1.01f, 1.01f], translation: [0.0f, 0.0f, 0.0f]},Tags:["content_lock.duplicator.display"]}
tag @s add content_lock.duplicator.spawned