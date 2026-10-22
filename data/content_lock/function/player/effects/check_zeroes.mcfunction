$execute unless score @s content_lock.poison_stacks matches 1.. run function content_lock:player/effects/modify_end {name:"$(poison)",value:"$(poison_amount)"}
$execute unless score @s content_lock.wither_stacks matches 1.. run function content_lock:player/effects/modify_end {name:"$(wither)",value:"$(wither_amount)"}
$execute unless score @s content_lock.corruption_meter matches 1.. run function content_lock:player/effects/modify_end {name:"$(corruption)",value:"$(corruption_amount)"}
$execute unless score @s content_lock.frostbite_stacks matches 1.. run function content_lock:player/effects/modify_end {name:"$(frost)",value:"$(frost_amount)"}
$execute unless score @s content_lock.bleed_stacks matches 1.. run function content_lock:player/effects/modify_end {name:"$(bleed)",value:"$(bleed_amount)"}

$execute if score @s content_lock.poison_stacks matches 1.. run function content_lock:player/effects/modify_end {name:"$(poison)",value:"$(poison_amount)"}
$execute if score @s content_lock.wither_stacks matches 1.. run function content_lock:player/effects/modify_end {name:"$(wither)",value:"$(wither_amount)"}
$execute if score @s content_lock.corruption_meter matches 1.. run function content_lock:player/effects/modify_end {name:"$(corruption)",value:"$(corruption_amount)"}
$execute if score @s content_lock.frostbite_stacks matches 1.. run function content_lock:player/effects/modify_end {name:"$(frost)",value:"$(frost_amount)"}
$execute if score @s content_lock.bleed_stacks matches 1.. run function content_lock:player/effects/modify_end {name:"$(bleed)",value:"$(bleed_amount)"}
