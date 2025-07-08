execute as @a if score @s wp.hore_probe matches 1.. run function weapon:probe_pass


execute at @e[tag=railgun] run particle minecraft:end_rod ~ ~ ~ 0 0 0 0 10 force
execute as @a at @s run kill @e[type=minecraft:armor_stand,distance=80..,tag=railgun]
execute as @e[type=minecraft:armor_stand,tag=railgun] at @s run tp ^ ^ ^5
execute as @e[type=minecraft:armor_stand,tag=railgun] at @s unless block ~ ~ ~ air run kill @s