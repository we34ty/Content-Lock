execute if entity @s[tag=content_lock.buffed_by_minor_buff,type=#hostile] run function content_lock:mobs/customization/active/buff_around/remove
execute if entity @s[tag=content_lock.can_be_raised_from_ground] run function content_lock:mobs/customization/active/raising_from_ground/check
execute if entity @s[tag=content_lock.can_charge_jump] run function content_lock:mobs/customization/active/charged_jump/charge
execute if entity @s[type=creeper,tag=content_lock.can_dash_at_player,tag=!content_lock.dashed_already] run function content_lock:mobs/customization/active/dash_at_player/check
execute if entity @s[type=!creeper,tag=content_lock.can_dash_at_player] run function content_lock:mobs/customization/active/dash_at_player/check_spider
execute if entity @s[tag=content_lock.can_throw_cobweb] run function content_lock:mobs/customization/active/throw_cobweb/check
execute if entity @s[tag=content_lock.cannot_be_put_in_boat] run function content_lock:mobs/customization/active/go_out_of_boat
execute if entity @s[tag=content_lock.buffs_mobs_around_minor] run function content_lock:mobs/customization/active/buff_around/tick
execute if entity @s[tag=content_lock.can_cast_fireball] run function content_lock:mobs/customization/active/cast_fireball/check
execute if entity @s[tag=content_lock.attacks_on_sight] run function content_lock:mobs/customization/active/attacking_on_sight/check
execute if entity @s[tag=content_lock.gain_speed_with_rider] run function content_lock:mobs/customization/active/gain_speed_with_rider
execute if entity @s[tag=content_lock.can_heal_with_food] run function content_lock:mobs/customization/active/heal_with_food/check

#execute if entity @s[tag=content_lock.customized,type=enderman,tag=cannot_be_put_in_boat] run function content_lock:mobs/customization/active/go_out_of_boat
