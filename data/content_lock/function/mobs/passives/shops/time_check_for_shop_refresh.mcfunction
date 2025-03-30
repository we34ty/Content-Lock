execute store result score L content_lock.current_time run time query daytime
execute if score L content_lock.current_time matches 0 run function content_lock:mobs/passives/shops/refresh_shops
