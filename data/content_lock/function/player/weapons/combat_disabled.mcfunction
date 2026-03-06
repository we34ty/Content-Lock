##Remove weapon components from all weapons
execute if items entity @s weapon.mainhand *[custom_data~{"content_lock.weapon":true}] run item modify entity @s weapon.mainhand content_lock:weapon_disable
execute if items entity @s weapon.mainhand *[custom_data~{"content_lock.glint_overriden":true}] run item modify entity @s weapon.mainhand content_lock:remove_glint_override

##Enable the weapon mode if the player has a weapon in their offhand
execute if score L content_lock.options.player.custom_weapon_animations matches 1 if items entity @s weapon.offhand #content_lock:weapon run function content_lock:player/weapons/enable

##Attribute, which removes damage for all weapons in non-weapon mode
attribute @s attack_damage modifier remove content_lock.weapons.no_damage
execute if score L content_lock.options.player.custom_weapon_animations matches 1 if items entity @s weapon.mainhand #content_lock:weapon run attribute @s attack_damage modifier add content_lock.weapons.no_damage -1 add_multiplied_total
execute if score L content_lock.options.player.custom_weapon_animations matches 0 if items entity @s weapon.mainhand #content_lock:weapon run attribute @s attack_damage modifier remove content_lock.weapons.no_damage