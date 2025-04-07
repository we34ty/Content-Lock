
execute if score @s y_level_check < @p y_level_check facing entity @p feet rotated ~ -65 run tp @s ^ ^ ^1 ~ ~
execute if score @s y_level_check > @p y_level_check facing entity @p feet rotated ~ 65 run tp @s ^ ^ ^1 ~ ~
execute if score @s y_level_check = @p y_level_check facing entity @p feet rotated ~ 0 run tp @s ^ ^ ^1 ~ ~