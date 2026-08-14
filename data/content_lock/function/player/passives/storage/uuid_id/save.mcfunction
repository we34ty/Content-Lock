##Takes arguments of:
##Id: between 1 and 4096, which should be assigned from the scoreboard stored on L called "content_lock.UUID_id"
##data: can store anything, which includes classes and arrays
##If an Id was already taken by another object, using this function will overwrite it's data

$data remove storage content_lock:uuids UUIDs[$(Id)]
$data modify storage content_lock:uuids UUIDs insert $(Id) value {Id:$(Id),data:$(data)}