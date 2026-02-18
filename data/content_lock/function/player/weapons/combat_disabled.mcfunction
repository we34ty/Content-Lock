execute if items entity @s weapon.mainhand *[custom_data~{"content_lock.weapon":true}] run item modify entity @s weapon.mainhand content_lock:weapon_disable
execute if items entity @s weapon.mainhand *[custom_data~{"content_lock.glint_overriden":true}] run item modify entity @s weapon.mainhand content_lock:remove_glint_override

execute if items entity @s weapon.offhand #content_lock:weapon run function content_lock:player/weapons/enable

attribute @s attack_damage modifier remove content_lock.weapons.no_damage
execute if items entity @s weapon.mainhand #content_lock:weapon run attribute @s attack_damage modifier add content_lock.weapons.no_damage -1 add_multiplied_total