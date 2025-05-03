scoreboard players remove @s content_lock.combo_timer 1
scoreboard players set @s[scores={content_lock.combo_timer=0}] content_lock.combo_counter 0
attribute @s[scores={content_lock.combo_timer=0}] attack_damage modifier remove content_lock.combo
execute if entity @s[scores={content_lock.combo_timer=0}] at @s run playsound block.beacon.deactivate master @s ~ ~ ~ 0.2 2