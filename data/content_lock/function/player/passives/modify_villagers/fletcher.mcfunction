data merge entity @s {Xp:250,VillagerData:{level:5},Offers:{Recipes:[{buy:{id:"rotten_flesh"},sell:{id:"rotten_flesh"}},{buy:{id:"rotten_flesh"},sell:{id:"rotten_flesh"}},{buy:{id:"rotten_flesh"},sell:{id:"rotten_flesh"}},{buy:{id:"rotten_flesh"},sell:{id:"rotten_flesh"}},{buy:{id:"rotten_flesh"},sell:{id:"rotten_flesh"}},{buy:{id:"rotten_flesh"},sell:{id:"rotten_flesh"}}]}}

scoreboard players set @s content_lock.temp1 0
execute store result score @s content_lock.temp1 run function content_lock:check_random_chance {chance:4}
execute if score @s content_lock.temp1 matches 1 run function content_lock:player/passives/modify_villagers/trade_macro {slot:0,buy:{id:"feather",count:18},buy2:{},sell:{id:"emerald",count:1},maxUses:4,demand:-20,priceMultiplier:0.3}
execute if score @s content_lock.temp1 matches 2 run function content_lock:player/passives/modify_villagers/trade_macro {slot:0,buy:{id:"string",count:22},buy2:{},sell:{id:"emerald",count:1},maxUses:4,demand:-24,priceMultiplier:0.3}
execute if score @s content_lock.temp1 matches 3 run function content_lock:player/passives/modify_villagers/trade_macro {slot:0,buy:{id:"flint",count:16},buy2:{},sell:{id:"emerald",count:1},maxUses:3,demand:-18,priceMultiplier:0.4}
execute if score @s content_lock.temp1 matches 4 run function content_lock:player/passives/modify_villagers/trade_macro {slot:0,buy:{id:"stick",count:32},buy2:{},sell:{id:"emerald",count:1},maxUses:5,demand:-28,priceMultiplier:0.2}

scoreboard players set @s content_lock.temp1 0
execute store result score @s content_lock.temp1 run function content_lock:check_random_chance {chance:4}
execute if score @s content_lock.temp1 matches 1 run function content_lock:player/passives/modify_villagers/trade_macro {slot:1,buy:{id:"gravel",count:24},buy2:{id:"emerald",count:1},sell:{id:"flint",count:24},maxUses:3,demand:-22,priceMultiplier:0.4}
execute if score @s content_lock.temp1 matches 2 run function content_lock:player/passives/modify_villagers/trade_macro {slot:1,buy:{id:"egg",count:11},buy2:{id:"emerald",count:1},sell:{id:"feather",count:24},maxUses:3,demand:-26,priceMultiplier:0.3}
execute if score @s content_lock.temp1 matches 3 run function content_lock:player/passives/modify_villagers/trade_macro {slot:1,buy:{id:"brown_egg",count:11},buy2:{id:"emerald",count:1},sell:{id:"feather",count:21},maxUses:3,demand:-26,priceMultiplier:0.3}
execute if score @s content_lock.temp1 matches 4 run function content_lock:player/passives/modify_villagers/trade_macro {slot:1,buy:{id:"blue_egg",count:11},buy2:{id:"emerald",count:1},sell:{id:"feather",count:26},maxUses:4,demand:-26,priceMultiplier:0.3}

scoreboard players set @s content_lock.temp1 0
execute store result score @s content_lock.temp1 run function content_lock:check_random_chance {chance:2}
execute if score @s content_lock.temp1 matches 1 run function content_lock:player/passives/modify_villagers/trade_macro {slot:2,buy:{id:"emerald",count:2},buy2:{},sell:{id:"arrow",count:32},maxUses:20,demand:-24,priceMultiplier:0.3}
execute if score @s content_lock.temp1 matches 2 run function content_lock:player/passives/modify_villagers/trade_macro {slot:2,buy:{id:"emerald",count:4},buy2:{},sell:{id:"spectral_arrow",count:32},maxUses:12,demand:-28,priceMultiplier:0.2}

scoreboard players set @s content_lock.temp1 0
execute store result score @s content_lock.temp1 run function content_lock:check_random_chance {chance:3}
execute if score @s content_lock.temp1 matches 1 run function content_lock:player/passives/modify_villagers/trade_macro {slot:3,buy:{id:"emerald",count:2},buy2:{},sell:{id:"string",count:48},maxUses:18,demand:-26,priceMultiplier:0.2}
execute if score @s content_lock.temp1 matches 2 run function content_lock:player/passives/modify_villagers/trade_macro {slot:3,buy:{id:"emerald",count:1},buy2:{},sell:{id:"stick",count:36},maxUses:24,demand:-30,priceMultiplier:0.2}
execute if score @s content_lock.temp1 matches 3 run function content_lock:player/passives/modify_villagers/trade_macro {slot:3,buy:{id:"emerald",count:1},buy2:{},sell:{id:"flint",count:18},maxUses:10,demand:-20,priceMultiplier:0.4}

scoreboard players set @s content_lock.temp1 0
execute store result score @s content_lock.temp1 run function content_lock:check_random_chance {chance:6}
execute if score @s content_lock.temp1 matches 1 run function content_lock:player/passives/modify_villagers/trade_macro {slot:4,buy:{id:"emerald",count:6},buy2:{},sell:{id:"tipped_arrow",count:16,components:{potion_contents:{potion:"poison"}}},maxUses:8,demand:-24,priceMultiplier:0.3}
execute if score @s content_lock.temp1 matches 2 run function content_lock:player/passives/modify_villagers/trade_macro {slot:4,buy:{id:"emerald",count:4},buy2:{},sell:{id:"tipped_arrow",count:16,components:{potion_contents:{potion:"slowness"}}},maxUses:10,demand:-28,priceMultiplier:0.2}
execute if score @s content_lock.temp1 matches 3 run function content_lock:player/passives/modify_villagers/trade_macro {slot:4,buy:{id:"emerald",count:3},buy2:{},sell:{id:"tipped_arrow",count:16,components:{potion_contents:{potion:"weakness"}}},maxUses:10,demand:-26,priceMultiplier:0.2}
execute if score @s content_lock.temp1 matches 4 run function content_lock:player/passives/modify_villagers/trade_macro {slot:4,buy:{id:"emerald",count:7},buy2:{},sell:{id:"tipped_arrow",count:16,components:{potion_contents:{potion:"harming"}}},maxUses:6,demand:-22,priceMultiplier:0.4}
execute if score @s content_lock.temp1 matches 5 run function content_lock:player/passives/modify_villagers/trade_macro {slot:4,buy:{id:"emerald",count:2},buy2:{},sell:{id:"tipped_arrow",count:16,components:{potion_contents:{potion:"swiftness"}}},maxUses:12,demand:-25,priceMultiplier:0.3}
execute if score @s content_lock.temp1 matches 6 run function content_lock:player/passives/modify_villagers/trade_macro {slot:4,buy:{id:"emerald",count:5},buy2:{},sell:{id:"tipped_arrow",count:16,components:{potion_contents:{potion:"healing"}}},maxUses:6,demand:-20,priceMultiplier:0.4}

scoreboard players set @s content_lock.temp1 0
execute store result score @s content_lock.temp1 run function content_lock:check_random_chance {chance:5}
execute if score @s content_lock.temp1 matches 1 run function content_lock:player/passives/modify_villagers/trade_macro {slot:5,buy:{id:"emerald",count:10},buy2:{},sell:{id:"enchanted_book",components:{stored_enchantments:{quick_charge:1},max_stack_size:64}},maxUses:3,demand:-18,priceMultiplier:0.3}
execute if score @s content_lock.temp1 matches 2 run function content_lock:player/passives/modify_villagers/trade_macro {slot:5,buy:{id:"emerald",count:11},buy2:{},sell:{id:"enchanted_book",components:{stored_enchantments:{power:1},max_stack_size:64}},maxUses:3,demand:-22,priceMultiplier:0.3}
execute if score @s content_lock.temp1 matches 3 run function content_lock:player/passives/modify_villagers/trade_macro {slot:5,buy:{id:"emerald",count:16},buy2:{},sell:{id:"enchanted_book",components:{stored_enchantments:{unbreaking:1},max_stack_size:64}},maxUses:1,demand:-20,priceMultiplier:0.4}
execute if score @s content_lock.temp1 matches 4 run function content_lock:player/passives/modify_villagers/trade_macro {slot:5,buy:{id:"emerald",count:8},buy2:{},sell:{id:"enchanted_book",components:{stored_enchantments:{piercing:1},max_stack_size:64}},maxUses:3,demand:-24,priceMultiplier:0.2}
execute if score @s content_lock.temp1 matches 5 run function content_lock:player/passives/modify_villagers/trade_macro {slot:5,buy:{id:"emerald",count:7},buy2:{},sell:{id:"enchanted_book",components:{stored_enchantments:{punch:1},max_stack_size:64}},maxUses:1,demand:-28,priceMultiplier:0.2}

tag @s add content_lock.villager_modified