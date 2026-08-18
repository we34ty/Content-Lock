##Modify every weapon in player's hand to be a proper weapon
execute if items entity @s weapon.mainhand #content_lock:weapon[!custom_data~{"content_lock.weapon":true}] run item modify entity @s weapon.mainhand content_lock:weapon_enable
##Override the enchantment glint to be applied to weapon or not based on whether it had one before
execute if items entity @s weapon.mainhand #content_lock:weapon[!custom_data~{"content_lock.glint_overriden":true},enchantments={"content_lock:weapon":1},!enchantment_glint_override] run item modify entity @s weapon.mainhand content_lock:give_glint_override

##Disable weapon mode if there is a weapon in player's offhand
execute if items entity @s weapon.offhand #content_lock:weapon run function content_lock:player/weapons/disable

attribute @s attack_damage modifier remove content_lock.weapons.no_damage
