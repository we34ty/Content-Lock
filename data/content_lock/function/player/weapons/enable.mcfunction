tag @s add content_lock.weapons.enabled

execute if items entity @s weapon.mainhand * run summon armor_stand ~ ~ ~ {Tags:["content_lock.weapon.temp_holder"],Invisible:1b,NoGravity:1b,Marker:1b,equipment:{mainhand:{id:"dirt"}}}
data modify entity @n[tag=content_lock.weapon.temp_holder] equipment.mainhand merge from entity @s SelectedItem
item replace entity @s weapon.mainhand from entity @s weapon.offhand content_lock:weapon_enable
execute unless entity @n[tag=content_lock.weapon.temp_holder,distance=..1] run item replace entity @s weapon.offhand with air
execute if entity @n[tag=content_lock.weapon.temp_holder,distance=..1] run item replace entity @s weapon.offhand from entity @n[tag=content_lock.weapon.temp_holder] weapon.mainhand
kill @e[tag=content_lock.weapon.temp_holder]