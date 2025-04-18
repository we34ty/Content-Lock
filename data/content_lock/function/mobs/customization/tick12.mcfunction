execute if entity @s[tag=content_lock.buffed_by_minor_buff,type=#hostile] run function content_lock:mobs/customization/active/remove_minor_buffs
execute if entity @s[tag=content_lock.customized,type=!#entities,tag=content_lock.can_be_raised_from_ground] run function content_lock:mobs/customization/active/raising_from_ground
execute if entity @s[tag=content_lock.customized,type=!#entities,tag=content_lock.can_charge_jump] run function content_lock:mobs/customization/active/charging_jump
execute if entity @s[tag=content_lock.customized,type=creeper,tag=content_lock.can_dash_at_player,tag=!content_lock.dashed_already] run function content_lock:mobs/customization/active/check_for_dash_at_player
execute if entity @s[tag=content_lock.customized,type=!#entities,type=!creeper,tag=content_lock.can_dash_at_player] run function content_lock:mobs/customization/active/check_for_dash_at_player_spider
execute if entity @s[tag=content_lock.customized,type=!#entities,tag=content_lock.can_throw_cobweb] run function content_lock:mobs/customization/active/throw_cobweb
execute if entity @s[tag=content_lock.customized,type=!#entities,tag=content_lock.cannot_be_put_in_boat] run function content_lock:mobs/customization/active/go_out_of_boat
execute if entity @s[tag=content_lock.customized,type=!#entities,tag=content_lock.buffs_mobs_around_minor] run function content_lock:mobs/customization/active/buffs_mobs_around
execute if entity @s[tag=content_lock.customized,type=!#entities,tag=content_lock.can_cast_fireball] run function content_lock:mobs/customization/active/check_if_can_cast_fireball
execute if entity @s[tag=content_lock.customized,type=!#entities,tag=content_lock.attacks_on_sight] run function content_lock:mobs/customization/active/check_for_attacking_on_sight
execute if entity @s[tag=content_lock.customized,type=!#entities,tag=content_lock.gain_speed_with_rider] run function content_lock:mobs/customization/active/gain_speed_with_rider

#execute if entity @s[tag=content_lock.customized,type=enderman,tag=cannot_be_put_in_boat] run function content_lock:mobs/customization/active/go_out_of_boat
