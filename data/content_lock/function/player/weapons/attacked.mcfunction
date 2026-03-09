##Buffer the hit, so the attacks feel a bit more responsive, even if you miss the timing
scoreboard players set @s content_lock.weapons.buffer 20
##Don't attack if there is already an attack going on or you have no stamina
execute if score @s content_lock.weapons.cooldown matches 1.. run return 0
execute unless score @s lsp.stamina matches 1.. run return 0

scoreboard players set @s content_lock.weapons.buffer 0
tag @e remove content_lock.weapons.attacking
tag @s add content_lock.weapons.attacking

##Additional damage from jumping/running attacks
execute if entity @s[nbt={OnGround:false}] run tag @s add content_lock.weapons.add_jumping_damage
execute if entity @s[predicate=lsp:is_sprinting] run tag @s add content_lock.weapons.add_running_damage

##Macros for each weapon availible, where:
##name: category of weapon behaviors (hitboxes, timings, etc), which the weapon is going to use
##cooldown: min. time between attacks
##visible_timer: how long the weapon model is visible
##max_combo: maximum amount of hits, before the combo nr goes back to default
##combo_set: the default value of attack index, which is used after reaching max_combo
##sound: what sound should attacks play
##sound_pitch: modifies the sound pitch of the attack
##anims: category of animation which the weapon uses
##jumping_attack: the attack index which the weapon is going to assign to the jumping attacks (default is 31 for index '_jumping')
##running_attack: the attack index which the weapon is going to assign to the running attacks (default is 30 for index '_running')
execute if items entity @s weapon.mainhand *[custom_data~{"content_lock:weapon":{type:"sword"}}] run return run function content_lock:player/weapons/attacked_macro {name:"sword",cooldown:12,visible_timer:25,max_combo:2,combo_set:0,sound:entity.player.attack.strong,sound_pitch:0.7,anims:sword,jumping_attack:1,running_attack:30}
execute if items entity @s weapon.mainhand stone_sword run return run function content_lock:player/weapons/attacked_macro {name:"far_sword",cooldown:17,visible_timer:31,max_combo:3,combo_set:0,sound:entity.player.attack.strong,sound_pitch:0.5,anims:sword_far,jumping_attack:3,running_attack:30}
execute if items entity @s weapon.mainhand iron_sword run return run function content_lock:player/weapons/attacked_macro {name:"far_sword",cooldown:17,visible_timer:31,max_combo:3,combo_set:0,sound:entity.player.attack.strong,sound_pitch:0.5,anims:sword_far,jumping_attack:3,running_attack:30}
execute if items entity @s weapon.mainhand netherite_sword run return run function content_lock:player/weapons/attacked_macro {name:"far_sword",cooldown:17,visible_timer:31,max_combo:3,combo_set:0,sound:entity.player.attack.strong,sound_pitch:0.5,anims:sword_far,jumping_attack:3,running_attack:30}
execute if items entity @s weapon.mainhand copper_sword run return run function content_lock:player/weapons/attacked_macro {name:"fast_sword",cooldown:10,visible_timer:22,max_combo:2,combo_set:0,sound:entity.player.attack.strong,sound_pitch:0.8,anims:sword_fast,jumping_attack:1,running_attack:30}
execute if items entity @s weapon.mainhand golden_sword run return run function content_lock:player/weapons/attacked_macro {name:"fast_sword",cooldown:10,visible_timer:22,max_combo:2,combo_set:0,sound:entity.player.attack.strong,sound_pitch:0.8,anims:sword_fast,jumping_attack:1,running_attack:30}
execute if items entity @s weapon.mainhand diamond_sword run return run function content_lock:player/weapons/attacked_macro {name:"fast_sword",cooldown:10,visible_timer:22,max_combo:2,combo_set:0,sound:entity.player.attack.strong,sound_pitch:0.8,anims:sword_fast,jumping_attack:1,running_attack:30}

execute if items entity @s weapon.mainhand wooden_hoe run return run function content_lock:player/weapons/attacked_macro {name:"hoe",cooldown:10,visible_timer:24,max_combo:3,combo_set:1,sound:entity.player.attack.strong,sound_pitch:1,anims:hoe,jumping_attack:1,running_attack:1}

#execute if items entity @s weapon.mainhand #minecraft:pickaxes run return run function content_lock:player/weapons/types/pickaxe with storage content_lock:weapon_stats
#execute if items entity @s weapon.mainhand #minecraft:hoes run return run function content_lock:player/weapons/types/hoe with storage content_lock:weapon_stats
#execute if items entity @s weapon.mainhand #minecraft:axes run return run function content_lock:player/weapons/types/axe with storage content_lock:weapon_stats
#execute if items entity @s weapon.mainhand #minecraft:shovels run return run function content_lock:player/weapons/types/shovel with storage content_lock:weapon_stats

execute if items entity @s weapon.mainhand #content_lock:weapon run return run function content_lock:player/weapons/attacked_macro {name:"sword",cooldown:12,visible_timer:25,max_combo:2,combo_set:0,sound:entity.player.attack.strong,sound_pitch:0.7,anims:sword,jumping_attack:1,running_attack:30}