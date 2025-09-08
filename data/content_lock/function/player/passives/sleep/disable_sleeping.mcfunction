data merge storage content_lock:saved_stats {playersSleepingPercentage:100}
execute store result storage content_lock:saved_stats playersSleepingPercentage int 1 run gamerule playersSleepingPercentage
gamerule playersSleepingPercentage 101
advancement grant @a only content_lock:adventure/lazy