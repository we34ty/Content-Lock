execute if items entity @s weapon.mainhand #content_lock:weapon[!custom_data~{"content_lock.weapon":true}] run item modify entity @s weapon.mainhand content_lock:weapon_enable
execute if items entity @s weapon.mainhand #content_lock:weapon[!custom_data~{"content_lock.glint_overriden":true},enchantments={"content_lock:weapon":1},!enchantment_glint_override] run item modify entity @s weapon.mainhand content_lock:give_glint_override

execute if items entity @s weapon.offhand #content_lock:weapon run function content_lock:player/weapons/disable

attribute @s attack_damage modifier remove content_lock.weapons.no_damage
