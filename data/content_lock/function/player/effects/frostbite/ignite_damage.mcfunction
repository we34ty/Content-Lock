$damage @s $(damage) content_lock:ignition by @n from @n
execute unless entity @s[tag=content_lock.ignited] run function content_lock:player/effects/frostbite/apply {amount:-6000}
