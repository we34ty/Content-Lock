##Loads data from the projectile array to specified storage, based on given projectile Id

$data modify storage $(storage) {} merge from storage content_lock:uuids UUIDs[$(Id)].data