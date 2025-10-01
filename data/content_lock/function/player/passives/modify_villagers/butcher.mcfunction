data merge entity @s {Xp:250,VillagerData:{level:5},Offers:{Recipes:[{buy:{id:"rotten_flesh"},sell:{id:"rotten_flesh"}},{buy:{id:"rotten_flesh"},sell:{id:"rotten_flesh"}},{buy:{id:"rotten_flesh"},sell:{id:"rotten_flesh"}},{buy:{id:"rotten_flesh"},sell:{id:"rotten_flesh"}},{buy:{id:"rotten_flesh"},sell:{id:"rotten_flesh"}},{buy:{id:"rotten_flesh"},sell:{id:"rotten_flesh"}}]}}

scoreboard players set @s content_lock.temp1 0
execute store result score @s content_lock.temp1 run function content_lock:check_random_chance {chance:5}
execute if score @s content_lock.temp1 matches 1 run function content_lock:player/passives/modify_villagers/trade_macro {slot:0,buy:{id:"chicken",count:2},buy2:{},sell:{id:"emerald",count:1},maxUses:3,demand:-20,priceMultiplier:1}
execute if score @s content_lock.temp1 matches 2 run function content_lock:player/passives/modify_villagers/trade_macro {slot:0,buy:{id:"beef",count:3},buy2:{},sell:{id:"emerald",count:2},maxUses:5,demand:-20,priceMultiplier:0.4}
execute if score @s content_lock.temp1 matches 3 run function content_lock:player/passives/modify_villagers/trade_macro {slot:0,buy:{id:"porkchop",count:3},buy2:{},sell:{id:"emerald",count:2},maxUses:5,demand:-24,priceMultiplier:0.4}
execute if score @s content_lock.temp1 matches 4 run function content_lock:player/passives/modify_villagers/trade_macro {slot:0,buy:{id:"mutton",count:4},buy2:{},sell:{id:"emerald",count:2},maxUses:6,demand:-30,priceMultiplier:0.2}
execute if score @s content_lock.temp1 matches 5 run function content_lock:player/passives/modify_villagers/trade_macro {slot:0,buy:{id:"rabbit"},buy2:{},sell:{id:"emerald",count:1},maxUses:6,demand:-40,priceMultiplier:1}

scoreboard players set @s content_lock.temp1 0
execute store result score @s content_lock.temp1 run function content_lock:check_random_chance {chance:3}
execute if score @s content_lock.temp1 matches 1 run function content_lock:player/passives/modify_villagers/trade_macro {slot:1,buy:{id:"coal",count:12},buy2:{},sell:{id:"emerald",count:1},maxUses:6,demand:-18,priceMultiplier:0.3}
execute if score @s content_lock.temp1 matches 2 run function content_lock:player/passives/modify_villagers/trade_macro {slot:1,buy:{id:"charcoal",count:8},buy2:{},sell:{id:"emerald",count:1},maxUses:8,demand:-22,priceMultiplier:0.3}
execute if score @s content_lock.temp1 matches 3 run function content_lock:player/passives/modify_villagers/trade_macro {slot:1,buy:{id:"dried_kelp_block",count:2},buy2:{},sell:{id:"emerald",count:1},maxUses:3,demand:-40,priceMultiplier:0.5}

scoreboard players set @s content_lock.temp1 0
execute store result score @s content_lock.temp1 run function content_lock:check_random_chance {chance:4}
execute if score @s content_lock.temp1 matches 1 run function content_lock:player/passives/modify_villagers/trade_macro {slot:2,buy:{id:"mushroom_stew",components:{custom_model_data:{strings:["content_lock:chicken_soup"]},"item_name":[{"translate":"content_lock:item.chicken_soup"}]}},buy2:{},sell:{id:"emerald",count:2},maxUses:2,demand:-34,priceMultiplier:1}
execute if score @s content_lock.temp1 matches 2 run function content_lock:player/passives/modify_villagers/trade_macro {slot:2,buy:{id:"mushroom_stew",components:{custom_model_data:{strings:["content_lock:leczo"]},"item_name":[{"translate":"content_lock:item.leczo"}]}},buy2:{},sell:{id:"emerald",count:3},maxUses:3,demand:-30,priceMultiplier:1}
execute if score @s content_lock.temp1 matches 3 run function content_lock:player/passives/modify_villagers/trade_macro {slot:2,buy:{id:"bread",components:{custom_model_data:{strings:["content_lock:pierogi"]},"item_name":[{"translate":"content_lock:item.pierogi",count:5}]}},buy2:{},sell:{id:"emerald",count:2},maxUses:2,demand:-20,priceMultiplier:0.6}
execute if score @s content_lock.temp1 matches 4 run function content_lock:player/passives/modify_villagers/trade_macro {slot:2,buy:{id:"rabbit_stew",components:{custom_model_data:{strings:["content_lock:spaghetti"]},"item_name":[{"translate":"content_lock:item.spaghetti"}]}},buy2:{},sell:{id:"emerald",count:2},maxUses:3,demand:-40,priceMultiplier:1}

scoreboard players set @s content_lock.temp1 0
execute store result score @s content_lock.temp1 run function content_lock:check_random_chance {chance:5}
execute if score @s content_lock.temp1 matches 1 run function content_lock:player/passives/modify_villagers/trade_macro {slot:3,buy:{id:"emerald",count:8},buy2:{},sell:{id:"cooked_chicken",count:20},maxUses:20,demand:-26,priceMultiplier:0.3}
execute if score @s content_lock.temp1 matches 2 run function content_lock:player/passives/modify_villagers/trade_macro {slot:3,buy:{id:"emerald",count:12},buy2:{},sell:{id:"cooked_beed",count:20},maxUses:20,demand:-20,priceMultiplier:0.4}
execute if score @s content_lock.temp1 matches 3 run function content_lock:player/passives/modify_villagers/trade_macro {slot:3,buy:{id:"emerald",count:12},buy2:{},sell:{id:"cooked_porkchop",count:20},maxUses:20,demand:-20,priceMultiplier:0.4}
execute if score @s content_lock.temp1 matches 4 run function content_lock:player/passives/modify_villagers/trade_macro {slot:3,buy:{id:"emerald",count:8},buy2:{},sell:{id:"cooked_mutton",count:20},maxUses:20,demand:-28,priceMultiplier:0.2}
execute if score @s content_lock.temp1 matches 5 run function content_lock:player/passives/modify_villagers/trade_macro {slot:3,buy:{id:"emerald",count:18},buy2:{},sell:{id:"cooked_rabbit",count:20},maxUses:20,demand:-30,priceMultiplier:0.1}

scoreboard players set @s content_lock.temp1 0
execute store result score @s content_lock.temp1 run function content_lock:check_random_chance {chance:5}
execute if score @s content_lock.temp1 matches 1 run function content_lock:player/passives/modify_villagers/trade_macro {slot:4,buy:{id:"emerald",count:1},buy2:{},sell:{id:"coal",count:12},maxUses:30,demand:-24,priceMultiplier:0.2}
execute if score @s content_lock.temp1 matches 2 run function content_lock:player/passives/modify_villagers/trade_macro {slot:4,buy:{id:"emerald",count:1},buy2:{},sell:{id:"charcoal",count:8},maxUses:30,demand:-30,priceMultiplier:0.2}
execute if score @s content_lock.temp1 matches 3 run function content_lock:player/passives/modify_villagers/trade_macro {slot:4,buy:{id:"emerald",count:6},buy2:{},sell:{id:"leather",count:3},maxUses:12,demand:-20,priceMultiplier:0.4}
execute if score @s content_lock.temp1 matches 4 run function content_lock:player/passives/modify_villagers/trade_macro {slot:4,buy:{id:"emerald",count:4},buy2:{},sell:{id:"spider_eye",count:1},maxUses:6,demand:-20,priceMultiplier:0.5}
execute if score @s content_lock.temp1 matches 5 run function content_lock:player/passives/modify_villagers/trade_macro {slot:4,buy:{id:"emerald",count:14},buy2:{},sell:{id:"rabbit_foot",count:1},maxUses:8,demand:-30,priceMultiplier:0.1}

scoreboard players set @s content_lock.temp1 0
execute store result score @s content_lock.temp1 run function content_lock:check_random_chance {chance:3}
execute if score @s content_lock.temp1 matches 1 run function content_lock:player/passives/modify_villagers/trade_macro {slot:5,buy:{id:"emerald",count:12},buy2:{},sell:{id:"enchanted_book",components:{stored_enchantments:{fire_aspect:1},max_stack_size:64}},maxUses:2,demand:-24,priceMultiplier:0.2}
execute if score @s content_lock.temp1 matches 2 run function content_lock:player/passives/modify_villagers/trade_macro {slot:5,buy:{id:"emerald",count:10},buy2:{},sell:{id:"enchanted_book",components:{stored_enchantments:{flame:1},max_stack_size:64}},maxUses:2,demand:-31,priceMultiplier:0.2}
execute if score @s content_lock.temp1 matches 3 run function content_lock:player/passives/modify_villagers/trade_macro {slot:5,buy:{id:"emerald",count:21},buy2:{},sell:{id:"enchanted_book",components:{stored_enchantments:{looting:1},max_stack_size:64}},maxUses:2,demand:-17,priceMultiplier:0.3}

tag @s add content_lock.villager_modified