xp add @s 1 levels
clear @s structure_void
advancement revoke @s from content_lock:checks/1_level_from_gold
advancement revoke @s from content_lock:checks/1_level_from_iron
advancement grant @s only content_lock:progression/craft_level_1
playsound minecraft:entity.experience_orb.pickup ambient @s ~ ~ ~ 1 1
