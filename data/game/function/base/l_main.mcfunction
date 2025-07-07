#flag
tellraw @a {"text":"loaded"}

team add red
team add blue
team modify red color red
team modify blue color blue

scoreboard objectives add death deathCount
scoreboard objectives add death_cooldown dummy
scoreboard players set @a death_cooldown 0
scoreboard objectives add bring_home dummy
scoreboard objectives add hit_cooldown dummy
scoreboard players set @a hit_cooldown 0
scoreboard objectives add health health
scoreboard objectives add hit minecraft.custom:minecraft.damage_taken
scoreboard players set @a bring_home 0

scoreboard objectives add list dummy

#设置$last的分数使其可以和其他分数比较
execute store result score $last list run scoreboard players get $latest list


#玩家motion
#scoreboard objectives add gamemode dummy
