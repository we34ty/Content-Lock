execute if score L content_lock.timer1 matches 16 if entity @s[tag=!content_lock.customized] run function content_lock:mobs/customization/new_mob

execute if score L content_lock.timer1 matches 12 run function content_lock:mobs/customization/tick12
execute if score L content_lock.timer1 matches 2 if entity @s[type=creeper,tag=content_lock.can_dash_at_player,tag=!content_lock.dashed_already] run function content_lock:mobs/customization/active/check_for_dash_at_player
execute if entity @s[type=phantom,tag=content_lock.flying_at_low_attitude] run function content_lock:mobs/customization/active/flying_at_low_attitude
execute if entity @s[type=silverfish,tag=content_lock.can_multiply_silverfish] run function content_lock:mobs/customization/active/chance_to_give_infested
execute if entity @s[type=bat,tag=content_lock.can_blind_player] run function content_lock:mobs/customization/active/follow_player_to_blind
execute if entity @s[type=!#entities,tag=content_lock.can_be_controlled_with_carrot] if entity @r[distance=0..3] run function content_lock:mobs/customization/active/check_for_carrot_on_a_stick
execute if entity @s[type=#minecraft:arrows,tag=content_lock.can_ricoshet] run function content_lock:mobs/customization/active/check_for_ricoshet
execute if entity @s[type=#content_lock:minecarts_no_furrnace] if entity @e[type=furnace_minecart,distance=..4] run function content_lock:mobs/customization/active/minecart_follow_furnace_minecart
execute if entity @s[tag=content_lock.living_armor_sounds] run function content_lock:mobs/customization/active/living_armor_sounds
execute if entity @s[tag=content_lock.limited_attack_range,tag=!content_lock.limited_attack_range.reduced] run function content_lock:mobs/customization/active/melee_range_reduction
execute if entity @s[tag=content_lock.limited_attack_range.reduced] at @s run function content_lock:mobs/customization/active/melee_range_unreduction

#execute if score L content_lock.timer1 matches 12 if entity @s[tag=content_lock.customized,type=enderman,tag=cannot_be_put_in_boat] run function content_lock:mobs/customization/active/go_out_of_boat
