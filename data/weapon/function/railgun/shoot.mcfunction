scoreboard players set $strength player_motion.api.launch -10000
execute at @s run function player_motion:api/launch_looking

#execute at @s anchored eyes run summon minecraft:snowball ^ ^ ^1 {Tags:["mot","railgun"]}

execute at @s run summon minecraft:armor_stand ~ ~ ~ {NoGravity:true,Marker:true,Tags:["railgun"],Invisible:true}
#execute anchored eyes run tp @n[type=minecraft:armor_stand,tag=railgun] ^ ^ ^1
execute as @e[type=minecraft:armor_stand] at @s run tp @p
execute as @s at @s anchored eyes run tp @n[type=minecraft:armor_stand,tag=railgun] ^ ^ ^1