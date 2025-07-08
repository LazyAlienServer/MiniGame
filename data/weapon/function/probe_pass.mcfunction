scoreboard players set @s wp.hore_probe 0

#check weapon
execute if items entity @s weapon.* minecraft:goat_horn[use_cooldown={seconds:3,cooldown_group:"railgun"}] run function weapon:railgun/shoot