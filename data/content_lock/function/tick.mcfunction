##1 second timer for various functions that need to run every tick or every few ticks
scoreboard players add L content_lock.timer1 1
##timerCheck is used to stop player from repeating full inventory check multiple times in the same tick
execute if score L content_lock.timer1 matches 21.. run scoreboard players set @a content_lock.timerCheck 0
execute if score L content_lock.timer1 matches 21.. run scoreboard players set L content_lock.timer1 1