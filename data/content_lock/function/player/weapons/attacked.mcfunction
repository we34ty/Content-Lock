scoreboard players set @s content_lock.weapons.buffer 20
execute if score @s content_lock.weapons.cooldown matches 1.. run return 0
execute unless score @s lsp.stamina matches 1.. run return 0

scoreboard players set @s content_lock.weapons.buffer 0
tag @e remove content_lock.weapons.attacking
tag @s add content_lock.weapons.attacking

execute if entity @s[nbt={OnGround:false}] run attribute @s attack_damage modifier add content_lock.weapons.crit 0.5 add_multiplied_total
execute if entity @s[predicate=lsp:is_sprinting] run attribute @s attack_damage modifier add content_lock.weapons.running 0.1 add_multiplied_total

execute if items entity @s weapon.mainhand wooden_sword run return run function content_lock:player/weapons/attacked_macro {name:"sword",cooldown:12,visible_timer:25,max_combo:2,sound:entity.player.attack.strong,sound_pitch:0.7,anims:sword}
execute if items entity @s weapon.mainhand stone_sword run return run function content_lock:player/weapons/attacked_macro {name:"far_sword",cooldown:17,visible_timer:31,max_combo:3,sound:entity.player.attack.strong,sound_pitch:0.5,anims:sword_far}
execute if items entity @s weapon.mainhand iron_sword run return run function content_lock:player/weapons/attacked_macro {name:"far_sword",cooldown:17,visible_timer:31,max_combo:3,sound:entity.player.attack.strong,sound_pitch:0.5,anims:sword_far}
execute if items entity @s weapon.mainhand netherite_sword run return run function content_lock:player/weapons/attacked_macro {name:"far_sword",cooldown:17,visible_timer:31,max_combo:3,sound:entity.player.attack.strong,sound_pitch:0.5,anims:sword_far}
execute if items entity @s weapon.mainhand copper_sword run return run function content_lock:player/weapons/attacked_macro {name:"fast_sword",cooldown:10,visible_timer:22,max_combo:2,sound:entity.player.attack.strong,sound_pitch:0.8,anims:sword_fast}
execute if items entity @s weapon.mainhand golden_sword run return run function content_lock:player/weapons/attacked_macro {name:"fast_sword",cooldown:10,visible_timer:22,max_combo:2,sound:entity.player.attack.strong,sound_pitch:0.8,anims:sword_fast}
execute if items entity @s weapon.mainhand diamond_sword run return run function content_lock:player/weapons/attacked_macro {name:"fast_sword",cooldown:10,visible_timer:22,max_combo:2,sound:entity.player.attack.strong,sound_pitch:0.8,anims:sword_fast}
execute if items entity @s weapon.mainhand #minecraft:swords run return run function content_lock:player/weapons/types/sword with storage content_lock:weapon_stats
execute if items entity @s weapon.mainhand #minecraft:pickaxes run return run function content_lock:player/weapons/types/pickaxe with storage content_lock:weapon_stats
execute if items entity @s weapon.mainhand #minecraft:hoes run return run function content_lock:player/weapons/types/hoe with storage content_lock:weapon_stats
execute if items entity @s weapon.mainhand #minecraft:axes run return run function content_lock:player/weapons/types/axe with storage content_lock:weapon_stats
execute if items entity @s weapon.mainhand #minecraft:shovels run return run function content_lock:player/weapons/types/shovel with storage content_lock:weapon_stats