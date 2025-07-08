#poz1
execute as @a store result score @s x1 run data get entity @s Pos[0] 10000
execute as @a store result score @s y1 run data get entity @s Pos[1] 10000
execute as @a store result score @s z1 run data get entity @s Pos[2] 10000

#Poz2 (also the motion used)
execute as @a at @s run summon minecraft:item_display ^ ^ ^5 {Tags:["motion"]}
execute as @a at @s store result score @s x2 run data get entity @e[limit=1,tag=motion,sort=nearest,distance=4.99..5.01,type=minecraft:item_display] Pos[0] 10000
execute as @a at @s store result score @s y2 run data get entity @e[limit=1,tag=motion,sort=nearest,distance=4.99..5.01,type=minecraft:item_display] Pos[1] 10000
execute as @a at @s store result score @s z2 run data get entity @e[limit=1,tag=motion,sort=nearest,distance=4.99..5.01,type=minecraft:item_display] Pos[2] 10000
execute as @a run scoreboard players operation @s x2 -= @s x1
execute as @a run scoreboard players operation @s y2 -= @s y1
execute as @a run scoreboard players operation @s z2 -= @s z1
kill @e[type=minecraft:item_display,tag=motion]

