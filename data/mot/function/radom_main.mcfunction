
#generate random value
#but in fact, this value only influence tag:"one_random_mot" which is NOT compatible with greater than one entitys at once
execute as @a run execute as @s store result score @s rad_x run random value -1000..1000
execute as @a run execute as @s store result score @s rad_y run random value -1000..1000
execute as @a run execute as @s store result score @s rad_z run random value -1000..1000
#你当然可以自己改数值

#operation
execute as @a run scoreboard players operation @s rad_x += @s x2
execute as @a run scoreboard players operation @s rad_y += @s y2
execute as @a run scoreboard players operation @s rad_z += @s z2
