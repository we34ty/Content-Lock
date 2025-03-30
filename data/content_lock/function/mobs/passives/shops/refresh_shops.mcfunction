execute store result score L content_lock.temp1 run function content_lock:check_random_chance {chance:10}
execute if score L content_lock.temp1 matches 1 run function content_lock:mobs/passives/shops/offers/1
execute if score L content_lock.temp1 matches 2 run function content_lock:mobs/passives/shops/offers/2
execute if score L content_lock.temp1 matches 3 run function content_lock:mobs/passives/shops/offers/3
execute if score L content_lock.temp1 matches 4 run function content_lock:mobs/passives/shops/offers/4
execute if score L content_lock.temp1 matches 5 run function content_lock:mobs/passives/shops/offers/5
execute if score L content_lock.temp1 matches 6 run function content_lock:mobs/passives/shops/offers/6
execute if score L content_lock.temp1 matches 7 run function content_lock:mobs/passives/shops/offers/7
execute if score L content_lock.temp1 matches 8 run function content_lock:mobs/passives/shops/offers/8
execute if score L content_lock.temp1 matches 9 run function content_lock:mobs/passives/shops/offers/9
execute if score L content_lock.temp1 matches 10 run function content_lock:mobs/passives/shops/offers/10



