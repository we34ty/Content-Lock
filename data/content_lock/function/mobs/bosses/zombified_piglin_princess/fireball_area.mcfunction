execute if entity @s[tag=content_lock.zombified_piglin_princess.fireball.area.started] run tp @s ^ ^ ^1 ~ ~6
execute unless entity @s[tag=content_lock.zombified_piglin_princess.fireball.area.started] facing entity @e[tag=content_lock.im_a_target,limit=1,sort=nearest,type=#minecraft:boss_can_damage] eyes run rotate @s ~ ~
execute unless entity @s[tag=content_lock.zombified_piglin_princess.fireball.area.started] run tag @s add content_lock.zombified_piglin_princess.fireball.area.started

function content_lock:mobs/bosses/universal/damage_player_d {half_distance:0.75,distance:1.5,damage:8,damage_type:fireball}
function content_lock:mobs/bosses/universal/damage_player_d {half_distance:1.5,distance:3,damage:5,damage_type:fireball}
execute unless block ^ ^ ^1 #walkable run rotate @s ~ -45
#execute rotated ~ 0 positioned ~ ~0.5 ~ unless block ^ ^ ^1 #walkable facing entity @e[tag=content_lock.im_a_target,limit=1,sort=nearest,type=#minecraft:boss_can_damage] eyes run rotate @s ~ ~
particle flame ~ ~ ~ 0.2 0.2 0.2 0.1 8 force

