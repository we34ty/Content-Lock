data merge entity @s {Xp:250,VillagerData:{level:5},Offers:{Recipes:[{buy:{id:"rotten_flesh"},sell:{id:"rotten_flesh"}},{buy:{id:"rotten_flesh"},sell:{id:"rotten_flesh"}},{buy:{id:"rotten_flesh"},sell:{id:"rotten_flesh"}},{buy:{id:"rotten_flesh"},sell:{id:"rotten_flesh"}},{buy:{id:"rotten_flesh"},sell:{id:"rotten_flesh"}},{buy:{id:"rotten_flesh"},sell:{id:"rotten_flesh"}}]}}

scoreboard players set @s content_lock.temp1 0
execute store result score @s content_lock.temp1 run function content_lock:check_random_chance {chance:4}
execute if score @s content_lock.temp1 matches 1 run function content_lock:player/passives/modify_villagers/trade_macro {slot:0,buy:{id:"cod",count:12},buy2:{},sell:{id:"emerald",count:1},maxUses:3,demand:-20,priceMultiplier:0.4}
execute if score @s content_lock.temp1 matches 2 run function content_lock:player/passives/modify_villagers/trade_macro {slot:0,buy:{id:"salmon",count:6},buy2:{},sell:{id:"emerald",count:1},maxUses:4,demand:-20,priceMultiplier:0.3}
execute if score @s content_lock.temp1 matches 3 run function content_lock:player/passives/modify_villagers/trade_macro {slot:0,buy:{id:"tropical_fish",count:3},buy2:{},sell:{id:"emerald",count:1},maxUses:5,demand:-24,priceMultiplier:0.3}
execute if score @s content_lock.temp1 matches 4 run function content_lock:player/passives/modify_villagers/trade_macro {slot:0,buy:{id:"pufferfish",count:3},buy2:{},sell:{id:"emerald",count:1},maxUses:4,demand:-30,priceMultiplier:0.3}

scoreboard players set @s content_lock.temp1 0
execute store result score @s content_lock.temp1 run function content_lock:check_random_chance {chance:2}
execute if score @s content_lock.temp1 matches 1 run function content_lock:player/passives/modify_villagers/trade_macro {slot:1,buy:{id:"cooked_cod",count:6},buy2:{},sell:{id:"emerald",count:1},maxUses:2,demand:-23,priceMultiplier:0.5}
execute if score @s content_lock.temp1 matches 2 run function content_lock:player/passives/modify_villagers/trade_macro {slot:1,buy:{id:"cooked_salmon",count:3},buy2:{},sell:{id:"emerald",count:1},maxUses:2,demand:-23,priceMultiplier:0.5}

scoreboard players set @s content_lock.temp1 0
execute store result score @s content_lock.temp1 run function content_lock:check_random_chance {chance:3}
execute if score @s content_lock.temp1 matches 1 run function content_lock:player/passives/modify_villagers/trade_macro {slot:2,buy:{id:"emerald",count:2},buy2:{},sell:{id:"cooked_cod",count:14},maxUses:2,demand:-20,priceMultiplier:0.5}
execute if score @s content_lock.temp1 matches 2 run function content_lock:player/passives/modify_villagers/trade_macro {slot:2,buy:{id:"emerald",count:3},buy2:{},sell:{id:"cooked_salmon",count:11},maxUses:4,demand:-28,priceMultiplier:0.3}
execute if score @s content_lock.temp1 matches 3 run function content_lock:player/passives/modify_villagers/trade_macro {slot:2,buy:{id:"emerald",count:3},buy2:{},sell:{id:"tropical_fish",count:28,components:{"item_name": [{"translate":"content_lock:item.sushi","fallback":"Sushi"}],"custom_model_data":{"strings": ["content_lock:sushi"]},"food": {"nutrition": 2,"saturation": 1},"consumable": {"consume_seconds": 0.6,"animation": "eat"}}},maxUses:5,demand:-32,priceMultiplier:0.3}

scoreboard players set @s content_lock.temp1 0
execute store result score @s content_lock.temp1 run function content_lock:check_random_chance {chance:4}
execute if score @s content_lock.temp1 matches 1 run function content_lock:player/passives/modify_villagers/trade_macro {slot:3,buy:{id:"emerald",count:1},buy2:{},sell:{id:"dried_kelp",count:12},maxUses:7,demand:-26,priceMultiplier:0.5}
execute if score @s content_lock.temp1 matches 2 run function content_lock:player/passives/modify_villagers/trade_macro {slot:3,buy:{id:"emerald",count:2},buy2:{},sell:{id:"dried_kelp_block",count:3},maxUses:8,demand:-20,priceMultiplier:0.5}
execute if score @s content_lock.temp1 matches 3 run function content_lock:player/passives/modify_villagers/trade_macro {slot:3,buy:{id:"emerald",count:3},buy2:{},sell:{id:"sea_pickle",count:26},maxUses:20,demand:-36,priceMultiplier:0.4}
execute if score @s content_lock.temp1 matches 4 run function content_lock:player/passives/modify_villagers/trade_macro {slot:3,buy:{id:"emerald",count:4},buy2:{},sell:{id:"turtle_scute",count:7},maxUses:5,demand:-28,priceMultiplier:0.2}

scoreboard players set @s content_lock.temp1 0
execute store result score @s content_lock.temp1 run function content_lock:check_random_chance {chance:4}
execute if score @s content_lock.temp1 matches 1 run function content_lock:player/passives/modify_villagers/trade_macro {slot:4,buy:{id:"emerald",count:7},buy2:{},sell:{id:"nautilus_shell",count:1},maxUses:2,demand:-30,priceMultiplier:0.5}
execute if score @s content_lock.temp1 matches 2 run function content_lock:player/passives/modify_villagers/trade_macro {slot:4,buy:{id:"emerald",count:21},buy2:{},sell:{id:"heart_of_the_sea",count:1},maxUses:1,demand:-20,priceMultiplier:1}
execute if score @s content_lock.temp1 matches 3 run function content_lock:player/passives/modify_villagers/trade_macro {slot:4,buy:{id:"emerald",count:2},buy2:{},sell:{id:"prismarine_crystals",count:12},maxUses:20,demand:-32,priceMultiplier:0.5}
execute if score @s content_lock.temp1 matches 4 run function content_lock:player/passives/modify_villagers/trade_macro {slot:4,buy:{id:"emerald",count:1},buy2:{},sell:{id:"prismarine_shard",count:16},maxUses:8,demand:-30,priceMultiplier:0.1}

scoreboard players set @s content_lock.temp1 0
execute store result score @s content_lock.temp1 run function content_lock:check_random_chance {chance:9}
execute if score @s content_lock.temp1 matches 1 run function content_lock:player/passives/modify_villagers/trade_macro {slot:5,buy:{id:"emerald",count:10},buy2:{},sell:{id:"enchanted_book",components:{stored_enchantments:{lure:1},max_stack_size:64}},maxUses:3,demand:-18,priceMultiplier:0.3}
execute if score @s content_lock.temp1 matches 2 run function content_lock:player/passives/modify_villagers/trade_macro {slot:5,buy:{id:"emerald",count:9},buy2:{},sell:{id:"enchanted_book",components:{stored_enchantments:{luck_of_the_sea:1},max_stack_size:64}},maxUses:1,demand:-22,priceMultiplier:0.3}
execute if score @s content_lock.temp1 matches 3 run function content_lock:player/passives/modify_villagers/trade_macro {slot:5,buy:{id:"emerald",count:19},buy2:{},sell:{id:"enchanted_book",components:{stored_enchantments:{depth_strider:1},max_stack_size:64}},maxUses:2,demand:-20,priceMultiplier:0.4}
execute if score @s content_lock.temp1 matches 4 run function content_lock:player/passives/modify_villagers/trade_macro {slot:5,buy:{id:"emerald",count:22},buy2:{},sell:{id:"enchanted_book",components:{stored_enchantments:{frost_walker:1},max_stack_size:64}},maxUses:1,demand:-17,priceMultiplier:0.5}
execute if score @s content_lock.temp1 matches 5 run function content_lock:player/passives/modify_villagers/trade_macro {slot:5,buy:{id:"emerald",count:17},buy2:{},sell:{id:"enchanted_book",components:{stored_enchantments:{respiration:1},max_stack_size:64}},maxUses:2,demand:-28,priceMultiplier:0.2}
execute if score @s content_lock.temp1 matches 6 run function content_lock:player/passives/modify_villagers/trade_macro {slot:5,buy:{id:"emerald",count:6},buy2:{},sell:{id:"enchanted_book",components:{stored_enchantments:{loyalty:1},max_stack_size:64}},maxUses:4,demand:-40,priceMultiplier:0.2}
execute if score @s content_lock.temp1 matches 7 run function content_lock:player/passives/modify_villagers/trade_macro {slot:5,buy:{id:"emerald",count:17},buy2:{},sell:{id:"enchanted_book",components:{stored_enchantments:{riptide:1},max_stack_size:64}},maxUses:1,demand:-31,priceMultiplier:0.3}
execute if score @s content_lock.temp1 matches 8 run function content_lock:player/passives/modify_villagers/trade_macro {slot:5,buy:{id:"emerald",count:22},buy2:{},sell:{id:"enchanted_book",components:{stored_enchantments:{impaling:1},max_stack_size:64}},maxUses:2,demand:-17,priceMultiplier:0.4}
execute if score @s content_lock.temp1 matches 9 run function content_lock:player/passives/modify_villagers/trade_macro {slot:5,buy:{id:"emerald",count:16},buy2:{},sell:{id:"enchanted_book",components:{stored_enchantments:{channeling:1},max_stack_size:64}},maxUses:1,demand:-40,priceMultiplier:0.5}


tag @s add content_lock.villager_modified