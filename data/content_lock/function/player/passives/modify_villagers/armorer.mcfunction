data merge entity @s {Xp:250,VillagerData:{level:5},Offers:{Recipes:[{buy:{id:"rotten_flesh"},sell:{id:"rotten_flesh"}},{buy:{id:"rotten_flesh"},sell:{id:"rotten_flesh"}},{buy:{id:"rotten_flesh"},sell:{id:"rotten_flesh"}},{buy:{id:"rotten_flesh"},sell:{id:"rotten_flesh"}},{buy:{id:"rotten_flesh"},sell:{id:"rotten_flesh"}},{buy:{id:"rotten_flesh"},sell:{id:"rotten_flesh"}}]}}

scoreboard players set @s content_lock.temp1 0
execute store result score @s content_lock.temp1 run function content_lock:check_random_chance {chance:4}
execute if score @s content_lock.temp1 matches 1 run function content_lock:player/passives/modify_villagers/trade_macro {slot:0,buy:{id:"leather_boots"},buy2:{},sell:{id:"emerald",count:2},maxUses:1,demand:-100,priceMultiplier:0}
execute if score @s content_lock.temp1 matches 2 run function content_lock:player/passives/modify_villagers/trade_macro {slot:0,buy:{id:"leather_leggings"},buy2:{},sell:{id:"emerald",count:4},maxUses:1,demand:-100,priceMultiplier:0}
execute if score @s content_lock.temp1 matches 3 run function content_lock:player/passives/modify_villagers/trade_macro {slot:0,buy:{id:"leather_chestplate"},buy2:{},sell:{id:"emerald",count:4},maxUses:1,demand:-100,priceMultiplier:0}
execute if score @s content_lock.temp1 matches 4 run function content_lock:player/passives/modify_villagers/trade_macro {slot:0,buy:{id:"leather_helmet"},buy2:{},sell:{id:"emerald",count:3},maxUses:1,demand:-100,priceMultiplier:0}

scoreboard players set @s content_lock.temp1 0
execute store result score @s content_lock.temp1 run function content_lock:check_random_chance {chance:4}
execute if score @s content_lock.temp1 matches 1 run function content_lock:player/passives/modify_villagers/trade_macro {slot:1,buy:{id:"chainmail_boots"},buy2:{},sell:{id:"emerald",count:3},maxUses:2,demand:-100,priceMultiplier:0}
execute if score @s content_lock.temp1 matches 2 run function content_lock:player/passives/modify_villagers/trade_macro {slot:1,buy:{id:"chainmail_leggings"},buy2:{},sell:{id:"emerald",count:5},maxUses:2,demand:-100,priceMultiplier:0}
execute if score @s content_lock.temp1 matches 3 run function content_lock:player/passives/modify_villagers/trade_macro {slot:1,buy:{id:"chainmail_chestplate"},buy2:{},sell:{id:"emerald",count:5},maxUses:2,demand:-100,priceMultiplier:0}
execute if score @s content_lock.temp1 matches 4 run function content_lock:player/passives/modify_villagers/trade_macro {slot:1,buy:{id:"chainmail_helmet"},buy2:{},sell:{id:"emerald",count:4},maxUses:2,demand:-100,priceMultiplier:0}

scoreboard players set @s content_lock.temp1 0
execute store result score @s content_lock.temp1 run function content_lock:check_random_chance {chance:4}
execute if score @s content_lock.temp1 matches 1 run function content_lock:player/passives/modify_villagers/trade_macro {slot:2,buy:{id:"iron_boots"},buy2:{},sell:{id:"emerald",count:4},maxUses:3,demand:-100,priceMultiplier:0}
execute if score @s content_lock.temp1 matches 2 run function content_lock:player/passives/modify_villagers/trade_macro {slot:2,buy:{id:"iron_leggings"},buy2:{},sell:{id:"emerald",count:6},maxUses:3,demand:-100,priceMultiplier:0}
execute if score @s content_lock.temp1 matches 3 run function content_lock:player/passives/modify_villagers/trade_macro {slot:2,buy:{id:"iron_chestplate"},buy2:{},sell:{id:"emerald",count:6},maxUses:3,demand:-100,priceMultiplier:0}
execute if score @s content_lock.temp1 matches 4 run function content_lock:player/passives/modify_villagers/trade_macro {slot:2,buy:{id:"iron_helmet"},buy2:{},sell:{id:"emerald",count:5},maxUses:3,demand:-100,priceMultiplier:0}

scoreboard players set @s content_lock.temp1 0
execute store result score @s content_lock.temp1 run function content_lock:check_random_chance {chance:4}
execute if score @s content_lock.temp1 matches 1 run function content_lock:player/passives/modify_villagers/trade_macro {slot:3,buy:{id:"golden_boots"},buy2:{},sell:{id:"emerald",count:4},maxUses:3,demand:-100,priceMultiplier:0}
execute if score @s content_lock.temp1 matches 2 run function content_lock:player/passives/modify_villagers/trade_macro {slot:3,buy:{id:"golden_leggings"},buy2:{},sell:{id:"emerald",count:6},maxUses:3,demand:-100,priceMultiplier:0}
execute if score @s content_lock.temp1 matches 3 run function content_lock:player/passives/modify_villagers/trade_macro {slot:3,buy:{id:"golden_chestplate"},buy2:{},sell:{id:"emerald",count:6},maxUses:3,demand:-100,priceMultiplier:0}
execute if score @s content_lock.temp1 matches 4 run function content_lock:player/passives/modify_villagers/trade_macro {slot:3,buy:{id:"golden_helmet"},buy2:{},sell:{id:"emerald",count:5},maxUses:3,demand:-100,priceMultiplier:0}

scoreboard players set @s content_lock.temp1 0
execute store result score @s content_lock.temp1 run function content_lock:check_random_chance {chance:5}
execute if score @s content_lock.temp1 matches 1 run function content_lock:player/passives/modify_villagers/trade_macro {slot:4,buy:{id:"emerald",count:15},buy2:{},sell:{id:"enchanted_book",components:{stored_enchantments:{projectile_protection:1},max_stack_size:64}},maxUses:2,demand:-26,priceMultiplier:0.2}
execute if score @s content_lock.temp1 matches 2 run function content_lock:player/passives/modify_villagers/trade_macro {slot:4,buy:{id:"emerald",count:12},buy2:{},sell:{id:"enchanted_book",components:{stored_enchantments:{blast_protection:1},max_stack_size:64}},maxUses:2,demand:-31,priceMultiplier:0.2}
execute if score @s content_lock.temp1 matches 3 run function content_lock:player/passives/modify_villagers/trade_macro {slot:4,buy:{id:"emerald",count:21},buy2:{},sell:{id:"enchanted_book",components:{stored_enchantments:{fire_protection:1},max_stack_size:64}},maxUses:2,demand:-25,priceMultiplier:0.2}
execute if score @s content_lock.temp1 matches 4 run function content_lock:player/passives/modify_villagers/trade_macro {slot:4,buy:{id:"emerald",count:13},buy2:{},sell:{id:"enchanted_book",components:{stored_enchantments:{thorns:1},max_stack_size:64}},maxUses:2,demand:-40,priceMultiplier:0.2}
execute if score @s content_lock.temp1 matches 5 run function content_lock:player/passives/modify_villagers/trade_macro {slot:4,buy:{id:"emerald",count:24},buy2:{},sell:{id:"enchanted_book",components:{stored_enchantments:{mending:1},max_stack_size:64}},maxUses:2,demand:-20,priceMultiplier:0.2}

scoreboard players set @s content_lock.temp1 0
execute store result score @s content_lock.temp1 run function content_lock:check_random_chance {chance:3}
execute if score @s content_lock.temp1 matches 1 run function content_lock:player/passives/modify_villagers/trade_macro {slot:5,buy:{id:"emerald",count:7},buy2:{},sell:{id:"enchanted_book",components:{stored_enchantments:{"content_lock:armor_level":1},max_stack_size:64,item_model:"minecraft:writable_book"}},maxUses:3,demand:-40,priceMultiplier:0.1}
execute if score @s content_lock.temp1 matches 2 run function content_lock:player/passives/modify_villagers/trade_macro {slot:5,buy:{id:"emerald",count:12},buy2:{},sell:{id:"enchanted_book",components:{stored_enchantments:{"content_lock:armor_level":2},max_stack_size:64,item_model:"minecraft:writable_book"}},maxUses:2,demand:-30,priceMultiplier:0.2}
execute if score @s content_lock.temp1 matches 3 run function content_lock:player/passives/modify_villagers/trade_macro {slot:5,buy:{id:"emerald",count:21},buy2:{},sell:{id:"enchanted_book",components:{stored_enchantments:{"content_lock:armor_level":3},max_stack_size:64,item_model:"minecraft:writable_book"}},maxUses:1,demand:-20,priceMultiplier:0.3}


tag @s add content_lock.villager_modified