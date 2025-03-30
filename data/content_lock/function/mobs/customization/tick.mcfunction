execute if score L content_lock.timer1 matches 16 if entity @s[tag=!content_lock.customized] run function content_lock:mobs/customization/new_mob

execute if score L content_lock.timer1 matches 12 if entity @s[tag=content_lock.buffed_by_minor_buff,type=#hostile] run function content_lock:mobs/customization/active/remove_minor_buffs
execute if score L content_lock.timer1 matches 12 if entity @s[tag=content_lock.customized,type=#undead,tag=content_lock.can_be_raised_from_ground] run function content_lock:mobs/customization/active/raising_from_ground
execute if score L content_lock.timer1 matches 12 if entity @s[tag=content_lock.customized,type=#undead,tag=content_lock.can_charge_jump] run function content_lock:mobs/customization/active/charging_jump
execute if score L content_lock.timer1 matches 12 if entity @s[tag=content_lock.customized,type=creeper,tag=content_lock.can_dash_at_player] run function content_lock:mobs/customization/active/check_for_dash_at_player
execute if score L content_lock.timer1 matches 12 if entity @s[tag=content_lock.customized,type=spider,tag=content_lock.can_dash_at_player] run function content_lock:mobs/customization/active/check_for_dash_at_player_spider
execute if score L content_lock.timer1 matches 12 if entity @s[tag=content_lock.customized,type=cave_spider,tag=content_lock.can_dash_at_player] run function content_lock:mobs/customization/active/check_for_dash_at_player_spider
execute if score L content_lock.timer1 matches 12 if entity @s[tag=content_lock.customized,type=zombie,tag=content_lock.can_dash_at_player] run function content_lock:mobs/customization/active/check_for_dash_at_player_spider
execute if score L content_lock.timer1 matches 12 if entity @s[tag=content_lock.customized,type=spider,tag=content_lock.can_throw_cobweb] run function content_lock:mobs/customization/active/throw_cobweb
execute if score L content_lock.timer1 matches 12 if entity @s[tag=content_lock.customized,type=cave_spider,tag=content_lock.can_throw_cobweb] run function content_lock:mobs/customization/active/throw_cobweb
execute if score L content_lock.timer1 matches 12 if entity @s[tag=content_lock.customized,type=enderman,tag=content_lock.cannot_be_put_in_boat] run function content_lock:mobs/customization/active/go_out_of_boat
execute if entity @s[tag=content_lock.customized,type=phantom,tag=content_lock.flying_at_low_attitude] run function content_lock:mobs/customization/active/flying_at_low_attitude
execute if entity @s[tag=content_lock.customized,type=silverfish,tag=content_lock.can_multiply_silverfish] run function content_lock:mobs/customization/active/chance_to_give_infested
execute if entity @s[tag=content_lock.customized,type=bat,tag=content_lock.can_blind_player] run function content_lock:mobs/customization/active/follow_player_to_blind
execute if score L content_lock.timer1 matches 12 if entity @s[tag=content_lock.customized,type=witch,tag=content_lock.buffs_mobs_around_minor] run function content_lock:mobs/customization/active/buffs_mobs_around
execute if score L content_lock.timer1 matches 12 if entity @s[tag=content_lock.customized,type=piglin,tag=content_lock.can_cast_fireball] run function content_lock:mobs/customization/active/check_if_can_cast_fireball
execute if score L content_lock.timer1 matches 12 if entity @s[tag=content_lock.customized,type=piglin_brute,tag=content_lock.can_cast_fireball] run function content_lock:mobs/customization/active/check_if_can_cast_fireball
execute if score L content_lock.timer1 matches 12 if entity @s[tag=content_lock.customized,type=witch,tag=content_lock.can_cast_fireball] run function content_lock:mobs/customization/active/check_if_can_cast_fireball
execute if score L content_lock.timer1 matches 12 if entity @s[tag=content_lock.customized,type=zombie,tag=content_lock.can_cast_fireball] run function content_lock:mobs/customization/active/check_if_can_cast_fireball
execute if entity @e[tag=content_lock.enemy_fireball,type=area_effect_cloud,limit=1,sort=random] as @e[tag=content_lock.enemy_fireball,type=area_effect_cloud] run function content_lock:mobs/customization/active/flying_fireball

#execute if score L content_lock.timer1 matches 12 if entity @s[tag=content_lock.customized,type=enderman,tag=cannot_be_put_in_boat] run function content_lock:mobs/customization/active/go_out_of_boat
