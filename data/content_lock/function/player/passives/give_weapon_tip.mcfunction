advancement grant @s only content_lock:checks/weapon_tip
schedule function content_lock:player/passives/remove_weapon_tip 2t
tellraw @s [{translate:"content_lock:advancement.weapon_tip.title1",fallback:"Press ",color:"green"},{keybind:"key.swapOffhand", color:"yellow"},{translate:"content_lock:advancement.weapon_tip.title2",fallback:" to toggle weapon mode",color:"green"}]