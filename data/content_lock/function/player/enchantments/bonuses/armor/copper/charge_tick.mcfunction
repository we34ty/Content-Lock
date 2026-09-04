## Ticks down the timer for anyone with copper armor charges and manages some functions

execute if score @s content_lock.enchantment.bonus.armor.copper.charges matches 251.. run scoreboard players set @s content_lock.enchantment.bonus.armor.copper.charges 250

## If the player has more charges than they did last tick, run the gained_charges function to reset the timer and do some vfx
execute unless score @s content_lock.enchantment.bonus.armor.copper.charges <= @s content_lock.enchantment.bonus.armor.copper.charges_old at @s run function content_lock:player/enchantments/bonuses/armor/copper/gained_charges

## If player took damage at max stacks, create a lightning attack
execute if entity @s[tag=content_lock.enchantment.bonus.armor.copper.send_lightning] at @s run function content_lock:player/enchantments/bonuses/armor/copper/send_lightning

## If player has at least 50 charges, update their stats based on the number of pieces and charges they have
execute if score @s content_lock.enchantment.bonus.armor.copper.charges matches 50.. run function content_lock:player/enchantments/bonuses/armor/copper/update_stats

## Remove copper armor charges if the timer has run out, otherwise tick down the timer
execute if score @s content_lock.enchantment.bonus.armor.copper.timer matches 0 at @s run playsound content_lock:item.enchantment.lightstruck.end player @s ~ ~ ~ 0.1 1.6
execute if score @s content_lock.enchantment.bonus.armor.copper.timer matches 0 run scoreboard players remove @s content_lock.enchantment.bonus.armor.copper.charges 2
execute if score @s content_lock.enchantment.bonus.armor.copper.timer matches 1.. run scoreboard players remove @s content_lock.enchantment.bonus.armor.copper.timer 1

## Update the old charges score to the current charges so we can check next tick if the player gained more charges
scoreboard players operation @s content_lock.enchantment.bonus.armor.copper.charges_old = @s content_lock.enchantment.bonus.armor.copper.charges