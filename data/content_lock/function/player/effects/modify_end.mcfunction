$data merge storage content_lock:saved_stats {name:"$(name)",value:"$(value)"}
function content_lock:player/effects/modify_end_macro with storage content_lock:saved_stats
#$say $(name) and $(value)