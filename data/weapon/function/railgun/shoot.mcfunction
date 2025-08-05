scoreboard players set $strength player_motion.api.launch -10000
execute at @s run function player_motion:api/launch_looking

#execute at @s anchored eyes run summon minecraft:snowball ^ ^ ^1 {Tags:["mot","railgun"]}

execute at @s run summon minecraft:armor_stand ~ ~ ~ {NoGravity:true,Marker:true,Tags:["railgun","mot"],Invisible:true}
