team join blue @r[team=!blue,team=!red]
team join red @r[team=!blue,team=!red]
tellraw @a [{color:aqua,bold:true,text:"[DEBUG] "},{color:green,bold:false,text:"autoteam执行成功"}]
execute if entity @a[team=!red,team=!blue] run function game:base/assign_team/autoteam