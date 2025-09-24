scoreboard players set @s content_lock.temp1 0
execute if items entity @s armor.feet *[enchantments~[{enchantments:"minecraft:binding_curse"}]] run scoreboard players add @s content_lock.temp1 1
execute if items entity @s armor.legs *[enchantments~[{enchantments:"minecraft:binding_curse"}]] run scoreboard players add @s content_lock.temp1 1
execute if items entity @s armor.chest *[enchantments~[{enchantments:"minecraft:binding_curse"}]] run scoreboard players add @s content_lock.temp1 1
execute if items entity @s armor.head *[enchantments~[{enchantments:"minecraft:binding_curse"}]] run scoreboard players add @s content_lock.temp1 1

execute if score @s content_lock.temp1 matches 1 run attribute @s attack_damage modifier add lsp.no_dmg 0.5 add_multiplied_total
execute if score @s content_lock.temp1 matches 2 run attribute @s attack_damage modifier add lsp.no_dmg 0.75 add_multiplied_total
execute if score @s content_lock.temp1 matches 3 run attribute @s attack_damage modifier add lsp.no_dmg 1 add_multiplied_total
execute if score @s content_lock.temp1 matches 4 run attribute @s attack_damage modifier add lsp.no_dmg 1.25 add_multiplied_total

attribute @s attack_speed modifier add lsp.no_atkspd -0.25 add_multiplied_total
attribute @s armor modifier add lsp.bonus_armor 0.5 add_multiplied_total
