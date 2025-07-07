#execute store result score #list pc_latest run list
execute store result score $latest list run list

#execute if score #list pc_latest < #list pc_last run function game:base/playercheck/leave_p
#execute if score #list pc_latest > #list pc_last run function game:base/playercheck/join_p
execute if score $latest list < $last list run function game:base/playercheck/leave_p
execute if score $latest list > $last list run function game:base/playercheck/join_p