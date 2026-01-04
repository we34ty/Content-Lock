#execute store result score @s content_lock.temp1 run clear @s *[custom_data~{"content_lock.magical_dust":true}] 0
#execute if score @s content_lock.temp1 matches 0 run title @s times 2 8 3
#execute if score @s content_lock.temp1 matches 0 run title @s actionbar [{"translate": "content_lock:notifications.magic_powder.not_enough","color": "dark_red"}]
#execute if score @s content_lock.temp1 matches 0 run playsound block.note_block.banjo voice @s ~ ~ ~ 0.4 0.1
#execute if score @s content_lock.temp1 matches 0 run return 0
execute if items entity @s weapon.mainhand *[enchantments~[{enchantments:"content_lock:spell_cooldown"}]] run function content_lock:player/items/spells/check_cooldown

execute if items entity @s weapon.mainhand *[custom_data~{"content_lock.undead_book":true}] run function content_lock:player/items/spells/undead_book/undead_book_arguments
execute if items entity @s weapon.mainhand *[custom_data~{"content_lock.witchs_book":true}] run function content_lock:player/items/spells/witchs_book/witchs_book_arguments
execute if items entity @s weapon.mainhand *[custom_data~{"content_lock.fireball_spellbook":true}] run function content_lock:player/items/spells/fireball_spellbook/fireball_spellbook_arguments