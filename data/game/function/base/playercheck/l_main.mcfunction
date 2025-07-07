#scoreboard objectives add pc_latest dummy
#scoreboard objectives add pc_last dummy
scoreboard objectives add list dummy

#设置#last的分数使其可以和其他分数比较
execute store result score #last list run scoreboard players get #latest list


#玩家motion
#scoreboard objectives add gamemode dummy