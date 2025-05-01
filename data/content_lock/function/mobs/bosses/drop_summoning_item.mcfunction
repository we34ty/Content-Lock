execute if entity @s[tag=content_lock.drop_summon_on_despawn,tag=content_lock.enchanted_witch] run summon item ~ ~ ~ {Item:{id:"pink_dye",components:{custom_data:{"content_lock.enchanted_witch_summon":true},item_model:"minecraft:ominous_bottle",item_name:'{"translate":"content_lock:item.boss_summon.enchanted_witch"}',consumable:{consume_seconds:42342534,animation:"drink"},rarity:"uncommon",max_stack_size:1,enchantment_glint_override:true}}}
execute if entity @s[tag=content_lock.drop_summon_on_despawn,tag=content_lock.death_rider_horse] if entity @e[tag=content_lock.death_rider] run summon item ~ ~ ~ {Item:{id:"pink_dye",components:{custom_data:{"content_lock.death_rider_summon":true},item_model:"minecraft:ominous_bottle",item_name:'{"translate":"content_lock:item.boss_summon.death_rider"}',consumable:{consume_seconds:42342534,animation:"drink"},rarity:"uncommon",max_stack_size:1}}}
execute if entity @s[tag=content_lock.drop_summon_on_despawn,tag=content_lock.iron_guardian] run summon item ~ ~ ~ {Item:{id:"pink_dye",components:{custom_data:{"content_lock.iron_guardian_summon":true},item_model:"minecraft:furnace",item_name:'{"translate":"content_lock:item.boss_summon.iron_guardian"}',consumable:{consume_seconds:42342534,animation:"drink"},rarity:"uncommon",max_stack_size:1,enchantment_glint_override:true}}}




particle soul_fire_flame ~ ~ ~ 0 0 0 1 200 normal
playsound block.conduit.deactivate hostile @a ~ ~ ~ 10 0.5

execute as @a[scores={content_lock.time_since_death=0},distance=..40] run tag @s add content_lock.do_not_gain_corruption