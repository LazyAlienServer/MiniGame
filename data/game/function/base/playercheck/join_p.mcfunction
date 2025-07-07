tellraw @a {color:green,text:"有新的旅行伙伴加入！"}
#execute store result score #list pc_last run scoreboard players get #list pc_latest
execute store result score $last list run scoreboard players get $latest list