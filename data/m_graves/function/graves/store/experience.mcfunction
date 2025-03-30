## Store experience in 'm_graves:grave_storage' and clear
xp add @s -1
execute store result storage m_graves:grave_storage Xp int 7 run data get entity @s XpLevel
xp set @s 0
xp set @s 0 levels
