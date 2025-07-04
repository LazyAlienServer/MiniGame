

#reset
execute as @a[nbt=!{active_effects:[{id:"minecraft:glowing"}]}] run item replace entity @s armor.head with air

#destroy banner
execute as @a[tag=red_flag_on] at @s run fill ~1 ~1 ~1 ~-1 ~-1 ~-1 air replace red_banner destroy

execute as @a[tag=blue_flag_on] at @s run fill ~1 ~1 ~1 ~-1 ~-1 ~-1 air replace blue_banner destroy


#pick up
#execute as @e[type=armor_stand,tag=red_flag] at @s run item replace entity @s armor.head with red_banner
execute as @e[type=armor_stand,tag=red_flag] at @s run tag @a[team=!red,distance=..1,scores={death_cooldown=..0}] add red_flag_on
execute as @e[type=armor_stand,tag=red_flag] at @s if entity @a[distance=..1,tag=red_flag_on,scores={death_cooldown=..0}] run kill @s
execute as @a[tag=red_flag_on] run item replace entity @s armor.head with red_banner

execute as @e[type=armor_stand,tag=blue_flag] at @s run tag @a[team=!blue,distance=..1,scores={death_cooldown=..0}] add blue_flag_on
execute as @e[type=armor_stand,tag=blue_flag] at @s if entity @a[distance=..1,tag=blue_flag_on,scores={death_cooldown=..0}] run kill @s
execute as @a[tag=blue_flag_on] run item replace entity @s armor.head with blue_banner


#set banner
execute as @e[type=armor_stand,tag=red_flag,nbt={OnGround:true}] at @s run setblock ~ ~ ~ red_banner

execute as @e[type=armor_stand,tag=blue_flag,nbt={OnGround:true}] at @s run setblock ~ ~ ~ blue_banner

#unsured (do not delete)
effect give @a[tag=red_flag_on] minecraft:glowing 1 1 true

effect give @a[tag=blue_flag_on] minecraft:glowing 1 1 true


#drop
execute as @a[scores={death=1..},tag=red_flag_on] at @s run summon armor_stand ~ ~ ~ {Tags:["red_flag"],Invisible:true}
execute as @a[scores={death=1..}] at @s run tag @s remove red_flag_on

execute as @a[scores={death=1..},tag=blue_flag_on] at @s run summon armor_stand ~ ~ ~ {Tags:["blue_flag"],Invisible:true}
execute as @a[scores={death=1..}] at @s run tag @s remove blue_flag_on

execute as @a[scores={death=1..}] at @s run scoreboard players set @s death_cooldown 20
scoreboard players set @a death 0
scoreboard players remove @a[scores={death_cooldown=1..}] death_cooldown 1


#visiual
execute as @e[type=armor_stand,tag=red_flag] at @s align xyz run particle end_rod ~0.5 ~ ~0.5 0.0 0.0 0.0 0.05 1
execute as @e[type=armor_stand,tag=red_flag,nbt={OnGround:false}] at @s run item replace entity @s armor.head with red_banner
execute as @e[type=armor_stand,tag=red_flag,nbt={OnGround:true}] at @s run item replace entity @s armor.head with air

execute as @e[type=armor_stand,tag=blue_flag] at @s align xyz run particle end_rod ~0.5 ~ ~0.5 0.0 0.0 0.0 0.05 1
execute as @e[type=armor_stand,tag=blue_flag,nbt={OnGround:false}] at @s run item replace entity @s armor.head with blue_banner
execute as @e[type=armor_stand,tag=blue_flag,nbt={OnGround:true}] at @s run item replace entity @s armor.head with air

#hited
execute as @a[scores={hit=1..}] run scoreboard players set @s hit_cooldown 20
execute as @a[scores={hit=1..}] run scoreboard players set @s hit 0
scoreboard players remove @a[scores={hit_cooldown=1..}] hit_cooldown 1
execute as @a[scores={hit_cooldown=..0}] run scoreboard players set @s hit_cooldown 0

#bring home
execute as @a[team=red,scores={hit_cooldown=..1}] at @s if entity @e[distance=..1,tag=red_flag] run scoreboard players add @s[scores={bring_home=..100}] bring_home 3
execute as @a[team=red] at @s if entity @e[distance=..1,tag=red_home] run scoreboard players add @s hit_cooldown 2
execute as @a[team=red,scores={bring_home=100..}] at @s run tp @e[distance=..1,tag=red_flag,type=armor_stand] @e[tag=red_home,limit=1,type=armor_stand]
execute as @a[team=red,scores={bring_home=100..}] at @s run fill ~1 ~1 ~1 ~-1 ~-1 ~-1 air replace red_banner destroy

execute as @a[team=blue,scores={hit_cooldown=..1}] at @s if entity @e[distance=..1,tag=blue_flag] run scoreboard players add @s[scores={bring_home=..100}] bring_home 3
execute as @a[team=blue] at @s if entity @e[distance=..1,tag=blue_home] run scoreboard players add @s hit_cooldown 2
execute as @a[team=blue,scores={bring_home=100..}] at @s run tp @e[distance=..1,tag=blue_flag,type=armor_stand] @e[tag=blue_home,limit=1,type=armor_stand]
execute as @a[team=blue,scores={bring_home=100..}] at @s run fill ~1 ~1 ~1 ~-1 ~-1 ~-1 air replace blue_banner destroy



#bring home actionbar display
execute as @a[scores={bring_home=1..10}] run title @s actionbar [{text:"正在运送回家，请勿受伤或离开：",color:gold},{text:"[",color:green},{text:"::"},{text:"::::::::::::::::::",color:gray},{text:"]",color:green}]
execute as @a[scores={bring_home=11..20}] run title @s actionbar [{text:"正在运送回家，请勿受伤或离开：",color:gold},{text:"[",color:green},{text:"::::"},{text:"::::::::::::::::",color:gray},{text:"]",color:green}]
execute as @a[scores={bring_home=21..30}] run title @s actionbar [{text:"正在运送回家，请勿受伤或离开：",color:gold},{text:"[",color:green},{text:"::::::"},{text:"::::::::::::::",color:gray},{text:"]",color:green}]
execute as @a[scores={bring_home=31..40}] run title @s actionbar [{text:"正在运送回家，请勿受伤或离开：",color:gold},{text:"[",color:green},{text:"::::::::"},{text:"::::::::::::",color:gray},{text:"]",color:green}]
execute as @a[scores={bring_home=41..50}] run title @s actionbar [{text:"正在运送回家，请勿受伤或离开：",color:gold},{text:"[",color:green},{text:"::::::::::"},{text:"::::::::::",color:gray},{text:"]",color:green}]
execute as @a[scores={bring_home=51..60}] run title @s actionbar [{text:"正在运送回家，请勿受伤或离开：",color:gold},{text:"[",color:green},{text:"::::::::::::"},{text:"::::::::",color:gray},{text:"]",color:green}]
execute as @a[scores={bring_home=61..70}] run title @s actionbar [{text:"正在运送回家，请勿受伤或离开：",color:gold},{text:"[",color:green},{text:"::::::::::::::"},{text:"::::::",color:gray},{text:"]",color:green}]
execute as @a[scores={bring_home=71..80}] run title @s actionbar [{text:"正在运送回家，请勿受伤或离开：",color:gold},{text:"[",color:green},{text:"::::::::::::::::"},{text:"::::",color:gray},{text:"]",color:green}]
execute as @a[scores={bring_home=81..90}] run title @s actionbar [{text:"正在运送回家，请勿受伤或离开：",color:gold},{text:"[",color:green},{text:"::::::::::::::::::"},{text:"::",color:gray},{text:"]",color:green}]
execute as @a[scores={bring_home=91..99}] run title @s actionbar [{text:"正在运送回家，请勿受伤或离开：",color:gold},{text:"[",color:green},{text:"::::::::::::::::::::"},{text:"",color:gray},{text:"]",color:green}]
execute as @a[scores={bring_home=100}] run title @s actionbar [{text:"成功",color:green}]
playsound block.note_block.bit player @a[scores={bring_home=1}]
playsound block.note_block.bit player @a[scores={bring_home=10}]
playsound block.note_block.bit player @a[scores={bring_home=20}]
playsound block.note_block.bit player @a[scores={bring_home=30}]
playsound block.note_block.bit player @a[scores={bring_home=40}]
playsound block.note_block.bit player @a[scores={bring_home=50}]
playsound block.note_block.bit player @a[scores={bring_home=60}]
playsound block.note_block.bit player @a[scores={bring_home=70}]
playsound block.note_block.bit player @a[scores={bring_home=80}]
playsound block.note_block.bit player @a[scores={bring_home=90}]
playsound block.note_block.bit player @a[scores={bring_home=100}]

#bring home post processing
execute as @a[team=red,scores={bring_home=100..}] run scoreboard players set @s bring_home 0
execute as @a[team=blue,scores={bring_home=100..}] run scoreboard players set @s bring_home 0

execute as @a[scores={bring_home=1..}] run scoreboard players remove @s bring_home 2
execute as @a[scores={bring_home=..-1}] run scoreboard players set @s bring_home 0


#TEST FEATURE
kill @e[type=item]