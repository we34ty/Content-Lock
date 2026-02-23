$data remove storage content_lock:uuids UUIDs[$(Id)]
$data modify storage content_lock:uuids UUIDs insert $(Id) value {Id:$(Id),data:$(data)}