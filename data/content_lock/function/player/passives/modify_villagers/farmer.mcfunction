data merge entity @s {Xp:250,VillagerData:{level:5},Offers:{Recipes:[{buy:{id:"rotten_flesh"},sell:{id:"rotten_flesh"}},{buy:{id:"rotten_flesh"},sell:{id:"rotten_flesh"}},{buy:{id:"rotten_flesh"},sell:{id:"rotten_flesh"}},{buy:{id:"rotten_flesh"},sell:{id:"rotten_flesh"}},{buy:{id:"rotten_flesh"},sell:{id:"rotten_flesh"}},{buy:{id:"rotten_flesh"},sell:{id:"rotten_flesh"}}]}}

scoreboard players set @s content_lock.temp1 0
execute store result score @s content_lock.temp1 run function content_lock:check_random_chance {chance:4}
execute if score @s content_lock.temp1 matches 1 run function content_lock:player/passives/modify_villagers/trade_macro {slot:0,buy:{id:"wheat",count:9},buy2:{},sell:{id:"emerald",count:1},maxUses:3,demand:-20,priceMultiplier:0.4}
execute if score @s content_lock.temp1 matches 2 run function content_lock:player/passives/modify_villagers/trade_macro {slot:0,buy:{id:"potato",count:13},buy2:{},sell:{id:"emerald",count:1},maxUses:4,demand:-20,priceMultiplier:0.3}
execute if score @s content_lock.temp1 matches 3 run function content_lock:player/passives/modify_villagers/trade_macro {slot:0,buy:{id:"carrot",count:14},buy2:{},sell:{id:"emerald",count:1},maxUses:4,demand:-24,priceMultiplier:0.3}
execute if score @s content_lock.temp1 matches 4 run function content_lock:player/passives/modify_villagers/trade_macro {slot:0,buy:{id:"beetroot",count:6},buy2:{},sell:{id:"emerald",count:1},maxUses:5,demand:-30,priceMultiplier:0.2}

scoreboard players set @s content_lock.temp1 0
execute store result score @s content_lock.temp1 run function content_lock:check_random_chance {chance:2}
execute if score @s content_lock.temp1 matches 1 run function content_lock:player/passives/modify_villagers/trade_macro {slot:1,buy:{id:"pumpkin",count:2},buy2:{},sell:{id:"emerald",count:1},maxUses:3,demand:-23,priceMultiplier:0.5}
execute if score @s content_lock.temp1 matches 2 run function content_lock:player/passives/modify_villagers/trade_macro {slot:1,buy:{id:"melon",count:2},buy2:{},sell:{id:"emerald",count:1},maxUses:3,demand:-23,priceMultiplier:0.5}

scoreboard players set @s content_lock.temp1 0
execute store result score @s content_lock.temp1 run function content_lock:check_random_chance {chance:4}
execute if score @s content_lock.temp1 matches 1 run function content_lock:player/passives/modify_villagers/trade_macro {slot:2,buy:{id:"sweet_berries",count:9},buy2:{},sell:{id:"emerald",count:1},maxUses:2,demand:-20,priceMultiplier:0.2}
execute if score @s content_lock.temp1 matches 2 run function content_lock:player/passives/modify_villagers/trade_macro {slot:2,buy:{id:"glow_berries",count:6},buy2:{},sell:{id:"emerald",count:1},maxUses:4,demand:-28,priceMultiplier:0.2}
execute if score @s content_lock.temp1 matches 3 run function content_lock:player/passives/modify_villagers/trade_macro {slot:2,buy:{id:"apple",count:4},buy2:{},sell:{id:"emerald",count:1},maxUses:2,demand:-18,priceMultiplier:0.3}
execute if score @s content_lock.temp1 matches 4 run function content_lock:player/passives/modify_villagers/trade_macro {slot:2,buy:{id:"honey_bottle",count:1},buy2:{},sell:{id:"emerald",count:1},maxUses:4,demand:-40,priceMultiplier:1}

scoreboard players set @s content_lock.temp1 0
execute store result score @s content_lock.temp1 run function content_lock:check_random_chance {chance:5}
execute if score @s content_lock.temp1 matches 1 run function content_lock:player/passives/modify_villagers/trade_macro {slot:3,buy:{id:"emerald",count:3},buy2:{},sell:{id:"cocoa_beans",count:24},maxUses:20,demand:-26,priceMultiplier:0.3}
execute if score @s content_lock.temp1 matches 2 run function content_lock:player/passives/modify_villagers/trade_macro {slot:3,buy:{id:"emerald",count:2},buy2:{},sell:{id:"beetroot_seeds",count:14},maxUses:20,demand:-20,priceMultiplier:0.4}
execute if score @s content_lock.temp1 matches 3 run function content_lock:player/passives/modify_villagers/trade_macro {slot:3,buy:{id:"emerald",count:3},buy2:{},sell:{id:"carrot",count:44},maxUses:20,demand:-20,priceMultiplier:0.4}
execute if score @s content_lock.temp1 matches 4 run function content_lock:player/passives/modify_villagers/trade_macro {slot:3,buy:{id:"emerald",count:1},buy2:{},sell:{id:"potato",count:15},maxUses:20,demand:-28,priceMultiplier:0.2}
execute if score @s content_lock.temp1 matches 5 run function content_lock:player/passives/modify_villagers/trade_macro {slot:3,buy:{id:"emerald",count:4},buy2:{},sell:{id:"melon_seeds",count:23},maxUses:20,demand:-30,priceMultiplier:0.1}
execute if score @s content_lock.temp1 matches 6 run function content_lock:player/passives/modify_villagers/trade_macro {slot:3,buy:{id:"emerald",count:4},buy2:{},sell:{id:"pumpkin_seeds",count:23},maxUses:20,demand:-30,priceMultiplier:0.1}

scoreboard players set @s content_lock.temp1 0
execute store result score @s content_lock.temp1 run function content_lock:check_random_chance {chance:4}
execute if score @s content_lock.temp1 matches 1 run function content_lock:player/passives/modify_villagers/trade_macro {slot:4,buy:{id:"emerald",count:5},buy2:{},sell:{id:"pumpkin_pie",count:9},maxUses:30,demand:-30,priceMultiplier:0.2}
execute if score @s content_lock.temp1 matches 2 run function content_lock:player/passives/modify_villagers/trade_macro {slot:4,buy:{id:"emerald",count:4},buy2:{},sell:{id:"bread",count:36},maxUses:12,demand:-20,priceMultiplier:0.4}
execute if score @s content_lock.temp1 matches 3 run function content_lock:player/passives/modify_villagers/trade_macro {slot:4,buy:{id:"emerald",count:2},buy2:{},sell:{id:"cake",count:1},maxUses:6,demand:-20,priceMultiplier:0.5}
execute if score @s content_lock.temp1 matches 4 run function content_lock:player/passives/modify_villagers/trade_macro {slot:4,buy:{id:"emerald",count:8},buy2:{},sell:{id:"mushroom_stew",count:16,components:{max_stack_size:16}},maxUses:8,demand:-30,priceMultiplier:0.1}

scoreboard players set @s content_lock.temp1 0
execute store result score @s content_lock.temp1 run function content_lock:check_random_chance {chance:3}
execute if score @s content_lock.temp1 matches 1 run function content_lock:player/passives/modify_villagers/trade_macro {slot:5,buy:{id:"emerald",count:24},buy2:{},sell:{id:"enchanted_book",components:{stored_enchantments:{fortune:1},max_stack_size:64}},maxUses:2,demand:-18,priceMultiplier:0.3}
execute if score @s content_lock.temp1 matches 2 run function content_lock:player/passives/modify_villagers/trade_macro {slot:5,buy:{id:"emerald",count:10},buy2:{},sell:{id:"enchanted_book",components:{stored_enchantments:{silk_touch:1},max_stack_size:64}},maxUses:1,demand:-31,priceMultiplier:0.2}
execute if score @s content_lock.temp1 matches 3 run function content_lock:player/passives/modify_villagers/trade_macro {slot:5,buy:{id:"emerald",count:19},buy2:{},sell:{id:"enchanted_book",components:{stored_enchantments:{efficiency:1},max_stack_size:64}},maxUses:4,demand:-17,priceMultiplier:0.3}

tag @s add content_lock.villager_modified