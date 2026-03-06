#summon a marker in case the matched wormhole isn't loaded in, so it's removed as soon as possible
$execute positioned $(x) $(y) $(z) run summon marker ~ ~ ~ {Tags:["content_lock.wormhole.remover"]}
$execute positioned $(x) $(y) $(z) run playsound content_lock:block.wormhole.close block @a ~ ~ ~ 1 1
playsound content_lock:block.wormhole.close block @a ~ ~ ~ 1 1