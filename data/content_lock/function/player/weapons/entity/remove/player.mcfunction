$data merge storage content_lock:saved_stats {UUID:0, name: $(name),record:name,value:$(name)}
data modify storage content_lock:saved_stats UUID set from entity @s UUID

function content_lock:player/weapons/entity/remove/player_modifier {type: "physical"}
function content_lock:player/weapons/entity/remove/player_modifier {type: "fire"}
function content_lock:player/weapons/entity/remove/player_modifier {type: "frost"}
function content_lock:player/weapons/entity/remove/player_modifier {type: "magic"}
function content_lock:player/weapons/entity/remove/player_modifier {type: "wither"}
function content_lock:player/weapons/entity/remove/player_modifier {type: "ender"}

function content_lock:player/weapons/entity/remove/player_status_modifier {type: "bleed"}
function content_lock:player/weapons/entity/remove/player_status_modifier {type: "poison"}
function content_lock:player/weapons/entity/remove/player_status_modifier {type: "corruption"}
function content_lock:player/weapons/entity/remove/player_status_modifier {type: "wither"}
function content_lock:player/weapons/entity/remove/player_status_modifier {type: "frostbite"}