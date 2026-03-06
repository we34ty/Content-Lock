##kept in separate file to prevent the load function from not working if the minecart improvements are not enabled
gamerule max_minecart_speed 32
execute in minecraft:the_nether run gamerule max_minecart_speed 64
execute in minecraft:the_end run gamerule max_minecart_speed 128
execute in minecraft:overworld run gamerule max_minecart_speed 32
