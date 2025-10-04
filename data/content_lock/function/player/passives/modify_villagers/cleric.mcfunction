data merge entity @s {Xp:250,VillagerData:{level:5},Offers:{Recipes:[{buy:{id:"rotten_flesh"},sell:{id:"rotten_flesh"}},{buy:{id:"rotten_flesh"},sell:{id:"rotten_flesh"}},{buy:{id:"rotten_flesh"},sell:{id:"rotten_flesh"}},{buy:{id:"rotten_flesh"},sell:{id:"rotten_flesh"}},{buy:{id:"rotten_flesh"},sell:{id:"rotten_flesh"}},{buy:{id:"rotten_flesh"},sell:{id:"rotten_flesh"}},{buy:{id:"rotten_flesh"},sell:{id:"rotten_flesh"}}]}}

scoreboard players set @s content_lock.temp1 0
execute store result score @s content_lock.temp1 run function content_lock:check_random_chance {chance:6}
execute if score @s content_lock.temp1 matches 1 run function content_lock:player/passives/modify_villagers/trade_macro {slot:0,buy:{id:"rotten_flesh",count:14},buy2:{},sell:{id:"emerald",count:1},maxUses:1,demand:-34,priceMultiplier:0.3}
execute if score @s content_lock.temp1 matches 2 run function content_lock:player/passives/modify_villagers/trade_macro {slot:0,buy:{id:"rotten_flesh",count:19},buy2:{},sell:{id:"emerald",count:1},maxUses:2,demand:-26,priceMultiplier:0.3}
execute if score @s content_lock.temp1 matches 3 run function content_lock:player/passives/modify_villagers/trade_macro {slot:0,buy:{id:"rotten_flesh",count:25},buy2:{},sell:{id:"emerald",count:1},maxUses:3,demand:-20,priceMultiplier:0.3}
execute if score @s content_lock.temp1 matches 4 run function content_lock:player/passives/modify_villagers/trade_macro {slot:0,buy:{id:"bone",count:17},buy2:{},sell:{id:"emerald",count:1},maxUses:1,demand:-34,priceMultiplier:0.1}
execute if score @s content_lock.temp1 matches 5 run function content_lock:player/passives/modify_villagers/trade_macro {slot:0,buy:{id:"bone",count:24},buy2:{},sell:{id:"emerald",count:1},maxUses:2,demand:-26,priceMultiplier:0.1}
execute if score @s content_lock.temp1 matches 6 run function content_lock:player/passives/modify_villagers/trade_macro {slot:0,buy:{id:"bone",count:28},buy2:{},sell:{id:"emerald",count:1},maxUses:3,demand:-20,priceMultiplier:0.1}

scoreboard players set @s content_lock.temp1 0
execute store result score @s content_lock.temp1 run function content_lock:check_random_chance {chance:4}
execute if score @s content_lock.temp1 matches 1 run function content_lock:player/passives/modify_villagers/trade_macro {slot:1,buy:{id:"redstone",count:16},buy2:{},sell:{id:"emerald",count:1},maxUses:2,demand:-30,priceMultiplier:0.2}
execute if score @s content_lock.temp1 matches 2 run function content_lock:player/passives/modify_villagers/trade_macro {slot:1,buy:{id:"lapis_lazuli",count:10},buy2:{},sell:{id:"emerald",count:1},maxUses:2,demand:-30,priceMultiplier:0.2}
execute if score @s content_lock.temp1 matches 3 run function content_lock:player/passives/modify_villagers/trade_macro {slot:1,buy:{id:"amethyst_shard",count:11},buy2:{},sell:{id:"emerald",count:1},maxUses:2,demand:-30,priceMultiplier:0.2}
execute if score @s content_lock.temp1 matches 4 run function content_lock:player/passives/modify_villagers/trade_macro {slot:1,buy:{id:"glowstone_dust",count:14},buy2:{},sell:{id:"emerald",count:1},maxUses:2,demand:-30,priceMultiplier:0.2}

scoreboard players set @s content_lock.temp1 0
execute store result score @s content_lock.temp1 run function content_lock:check_random_chance {chance:4}
execute if score @s content_lock.temp1 matches 1 run function content_lock:player/passives/modify_villagers/trade_macro {slot:2,buy:{id:"nether_wart",count:10},buy2:{},sell:{id:"emerald",count:1},maxUses:3,demand:-22,priceMultiplier:0.3}
execute if score @s content_lock.temp1 matches 2 run function content_lock:player/passives/modify_villagers/trade_macro {slot:2,buy:{id:"glass_bottle",count:12},buy2:{},sell:{id:"emerald",count:1},maxUses:2,demand:-24,priceMultiplier:0.2}
execute if score @s content_lock.temp1 matches 3 run function content_lock:player/passives/modify_villagers/trade_macro {slot:2,buy:{id:"splash_potion"},buy2:{},sell:{id:"emerald",count:1},maxUses:3,demand:-100,priceMultiplier:0}
execute if score @s content_lock.temp1 matches 4 run function content_lock:player/passives/modify_villagers/trade_macro {slot:2,buy:{id:"fermented_spider_eye",count:2},buy2:{},sell:{id:"emerald",count:1},maxUses:3,demand:-30,priceMultiplier:0.4}

scoreboard players set @s content_lock.temp1 0
execute store result score @s content_lock.temp1 run function content_lock:check_random_chance {chance:4}
execute if score @s content_lock.temp1 matches 1 run function content_lock:player/passives/modify_villagers/trade_macro {slot:3,buy:{id:"turtle_scute",count:3},buy2:{},sell:{id:"emerald",count:2},maxUses:3,demand:-32,priceMultiplier:0.3}
execute if score @s content_lock.temp1 matches 2 run function content_lock:player/passives/modify_villagers/trade_macro {slot:3,buy:{id:"rabbit_foot",count:2},buy2:{},sell:{id:"emerald",count:1},maxUses:1,demand:-40,priceMultiplier:0.5}
execute if score @s content_lock.temp1 matches 3 run function content_lock:player/passives/modify_villagers/trade_macro {slot:3,buy:{id:"glistering_melon_slice",count:9},buy2:{},sell:{id:"emerald",count:2},maxUses:2,demand:-24,priceMultiplier:0.4}
execute if score @s content_lock.temp1 matches 4 run function content_lock:player/passives/modify_villagers/trade_macro {slot:3,buy:{id:"golden_carrot",count:9},buy2:{},sell:{id:"emerald",count:2},maxUses:2,demand:-23,priceMultiplier:0.4}

scoreboard players set @s content_lock.temp1 0
execute store result score @s content_lock.temp1 run function content_lock:check_random_chance {chance:5}
execute if score @s content_lock.temp1 matches 1 run function content_lock:player/passives/modify_villagers/trade_macro {slot:4,buy:{id:"emerald",count:1},buy2:{},sell:{id:"nether_wart",count:12},maxUses:20,demand:-26,priceMultiplier:1}
execute if score @s content_lock.temp1 matches 2 run function content_lock:player/passives/modify_villagers/trade_macro {slot:4,buy:{id:"emerald",count:1},buy2:{},sell:{id:"bone",count:24},maxUses:20,demand:-34,priceMultiplier:1}
execute if score @s content_lock.temp1 matches 3 run function content_lock:player/passives/modify_villagers/trade_macro {slot:4,buy:{id:"emerald",count:2},buy2:{},sell:{id:"gunpowder",count:16},maxUses:6,demand:-22,priceMultiplier:0.5}
execute if score @s content_lock.temp1 matches 4 run function content_lock:player/passives/modify_villagers/trade_macro {slot:4,buy:{id:"emerald",count:1},buy2:{},sell:{id:"lapis_lazuli",count:12},maxUses:8,demand:-31,priceMultiplier:1}
execute if score @s content_lock.temp1 matches 5 run function content_lock:player/passives/modify_villagers/trade_macro {slot:4,buy:{id:"emerald",count:1},buy2:{},sell:{id:"amethyst_shard",count:14},maxUses:8,demand:-31,priceMultiplier:1}

scoreboard players set @s content_lock.temp1 0
execute store result score @s content_lock.temp1 run function content_lock:check_random_chance {chance:3}
execute if score @s content_lock.temp1 matches 1 run function content_lock:player/passives/modify_villagers/trade_macro {slot:5,buy:{id:"emerald",count:16},buy2:{id:"enchanted_book",components:{stored_enchantments:{"content_lock:armor_level":1,"content_lock:weapon_level":1},max_stack_size:64,item_model:"minecraft:writable_book"}},sell:{id:"experience_bottle"},maxUses:4,demand:-30,priceMultiplier:0.3}
execute if score @s content_lock.temp1 matches 2 run function content_lock:player/passives/modify_villagers/trade_macro {slot:5,buy:{id:"emerald",count:20},buy2:{id:"enchanted_book",components:{stored_enchantments:{"content_lock:armor_level":1,"content_lock:weapon_level":1},max_stack_size:64,item_model:"minecraft:writable_book"}},sell:{id:"experience_bottle"},maxUses:4,demand:-30,priceMultiplier:0.3}
execute if score @s content_lock.temp1 matches 3 run function content_lock:player/passives/modify_villagers/trade_macro {slot:5,buy:{id:"emerald",count:24},buy2:{id:"enchanted_book",components:{stored_enchantments:{"content_lock:armor_level":1,"content_lock:weapon_level":1},max_stack_size:64,item_model:"minecraft:writable_book"}},sell:{id:"experience_bottle"},maxUses:4,demand:-30,priceMultiplier:0.3}

scoreboard players set @s content_lock.temp1 0
execute store result score @s content_lock.temp1 run function content_lock:check_random_chance {chance:5}
execute if score @s content_lock.temp1 matches 1 run function content_lock:player/passives/modify_villagers/trade_macro {slot:6,buy:{id:"emerald",count:8},buy2:{id:"apple",count:4},sell:{id:"potion",components:{potion_contents:{potion:"healing"},max_stack_size:16}},maxUses:3,demand:-20,priceMultiplier:0.3}
execute if score @s content_lock.temp1 matches 2 run function content_lock:player/passives/modify_villagers/trade_macro {slot:6,buy:{id:"emerald",count:3},buy2:{id:"spider_eye",count:1},sell:{id:"potion",components:{potion_contents:{potion:"invisibility"},max_stack_size:16}},maxUses:3,demand:-35,priceMultiplier:0.3}
execute if score @s content_lock.temp1 matches 3 run function content_lock:player/passives/modify_villagers/trade_macro {slot:6,buy:{id:"emerald",count:5},buy2:{id:"gold_nugget",count:3},sell:{id:"potion",components:{potion_contents:{potion:"regeneration"},max_stack_size:16}},maxUses:3,demand:-30,priceMultiplier:0.3}
execute if score @s content_lock.temp1 matches 4 run function content_lock:player/passives/modify_villagers/trade_macro {slot:6,buy:{id:"emerald",count:14},buy2:{id:"raw_iron",count:6},sell:{id:"potion",components:{potion_contents:{potion:"strength"},max_stack_size:16}},maxUses:3,demand:-22,priceMultiplier:0.3}
execute if score @s content_lock.temp1 matches 5 run function content_lock:player/passives/modify_villagers/trade_macro {slot:6,buy:{id:"emerald",count:18},buy2:{id:"magma_block",count:1},sell:{id:"potion",components:{potion_contents:{potion:"fire_resistance"},max_stack_size:16}},maxUses:3,demand:-18,priceMultiplier:0.3}

tag @s add content_lock.villager_modified