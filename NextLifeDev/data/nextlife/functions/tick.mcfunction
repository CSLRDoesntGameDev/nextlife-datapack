# tellraw @a {"text": "Datapack Tick!", "color": "#00FF00"}


scoreboard players set @a MinimumSurvivorLives 3

execute at @a if score @p Deaths > @p SavedDeaths run scoreboard players remove @p Lives 1

execute at @a if score @p Deaths > @p SavedDeaths run particle explosion ~ ~ ~ 
execute at @a if score @p Deaths > @p SavedDeaths run playsound entity.husk.death master @a[distance=25] ~ ~ ~ 1.0
execute at @a if score @p Deaths > @p SavedDeaths run playsound entity.husk.death master @p ~ ~ ~ 1.0

execute at @a if score @p DragonKills matches 1 run setblock 0 100 0 dragon_egg
execute at @e[type=ender_dragon] as @a if score @p DragonKills matches 1 run summon item ~ ~ ~ {Item:{id:"elytra",Count:1}}

execute at @a if score @p DragonKills matches 1 run particle minecraft:end_rod 0 100 0 0 0 0 5 100 normal

# execute as @a run scoreboard players get servertotal DragonKills
execute at @a if score @p DragonKills matches 1 run tellraw @a {"text": "", "extra": [{ "selector": "@p"}, {"text": " Killed The Ender Dragon!"}]}

execute at @a if score @p DragonKills matches 1 run scoreboard players add servertotal DragonKills 1


execute at @a if score @p DragonKills matches 1 run scoreboard players set @p DragonKills 0

execute at @a if score @p Deaths > @p SavedDeaths run tellraw @a {"text": "", "extra": [ { "text": "" }, {"color": "#FF0000", "selector": "@p"}, {"text": " Met Their Fate And Lost a life! ("}, {"score": {"name":"@p", "objective": "Lives"} }, {"text": " Remaining!)"} ]}
execute at @a if score @p Deaths > @p SavedDeaths run scoreboard players add @p SavedDeaths 1

execute at @a if score @p Kills > @p SavedKills run tellraw @a {"text": "", "extra": [ { "text": "" }, {"color": "#00FF00", "selector": "@p"}, {"text": " Killed A Player And Gained a life! ("}, {"score": {"name":"@p", "objective": "Lives"} }, {"text": " Remaining!)"} ]}
execute at @a if score @p Kills > @p SavedKills run scoreboard players add @p Lives 1


execute at @a if score @p Kills > @p SavedKills run scoreboard players add @p SavedKills 1


execute at @a run execute at @p run title @p actionbar {"color":"#32CD32", "text": "*** You Have ", "extra": [{"text": ""}, {"color":"#32CD32", "score": {"name":"@p", "objective": "Lives"} }, {"color":"#32CD32", "text": " Lives ***"}]}
execute at @a run execute at @p[scores={Lives=1}] run title @p actionbar {"color":"#32CD32", "text": "*** You Have ", "extra": [{"text": ""}, {"color":"#32CD32", "score": {"name":"@p", "objective": "Lives"} }, {"color":"#32CD32", "text": " Life ***"}]}
execute at @a run execute at @p[scores={Lives=0}] run title @p actionbar {"color":"#AAAAAA", "text": "*** You Have No More Lives! ***"}


execute at @a["scores"={Lives=0}, gamemode=survival] run playsound entity.warden.death master @p ~ ~ ~ 1.0

execute at @a["scores"={Lives=0}, gamemode=survival] run title @p subtitle {"text": "You Can Still Be Revived!"}
execute at @a["scores"={Lives=0}, gamemode=survival] run title @p title {"color": "#ff0000", "text": "You Ran Out of Lives!"}


execute at @a["scores"={Lives=0}, team=reapers, gamemode=survival] run team leave @p
execute at @a["scores"={Lives=0}, team=!dead, gamemode=survival] run team join dead @p

execute at @a["scores"={Lives=0}] run gamemode spectator @p

execute at @a["scores"={Lives=-1}] run gamemode spectator @p



execute at @a[team=survivors] run execute if score @p Lives < @p MinimumSurvivorLives if score @p Lives > @p 0 run playsound block.end_portal.spawn master @p ~ ~ ~
execute at @a[team=survivors] run execute if score @p Lives < @p MinimumSurvivorLives if score @p Lives > @p 0 run execute at @p[team=survivors] run title @p title {"color": "#ff0000", "text": "You Became a Reaper!"}

execute at @a[team=survivors] run execute if score @p Lives < @p MinimumSurvivorLives run execute at @p[team=survivors] run team leave @p

execute at @a[team=!reapers] run execute if score @p Lives < @p MinimumSurvivorLives if score @p Lives > servertotal Lives run execute at @p[team=survivors] run team leave @p
execute at @a[team=!reapers] run execute if score @p Lives < @p MinimumSurvivorLives if score @p Lives > servertotal Lives run team join reapers @p


execute at @a run execute if score @p[team=!survivors] Lives >= @p MinimumSurvivorLives run team leave @p
execute at @a run execute if score @p[team=!survivors] Lives >= @p MinimumSurvivorLives run team join survivors @p


execute at @a[gamemode=spectator, team=reapers] run gamemode survival @p

execute at @a[ nbt=!{SelectedItem:{id:"minecraft:player_head", tag:{CustomModelData:4001}}}, nbt={SelectedItem:{id:"minecraft:player_head"}}] run scoreboard players set @p LifeStoneHeld 0
execute at @a[ nbt={SelectedItem:{id:"minecraft:player_head", tag:{CustomModelData:4001}}}] run scoreboard players set @p LifeStoneHeld 1

execute at @a[ nbt=!{SelectedItem:{id:"minecraft:player_head", tag:{CustomModelData:4000}}}, nbt={SelectedItem:{id:"minecraft:player_head"}}] run scoreboard players set @p ReviveCoreheld 0
execute at @a[ nbt={SelectedItem:{id:"minecraft:player_head", tag:{CustomModelData:4000}}}] run scoreboard players set @p ReviveCoreheld 1

execute at @a if score @p ReviveCoreheld matches 1 if score @p ReviveCoreUses matches 1.. run playsound block.anvil.use master @a ~ ~ ~ 1.0 1

execute at @a if score @p ReviveCoreheld matches 1 if score @p ReviveCoreUses matches 1.. run playsound entity.player.levelup master @a ~ ~ ~ 1.0 0.2
execute as @a if score @p ReviveCoreheld matches 1 if score @p ReviveCoreUses matches 1.. run function nextlife:revive_conversation 

execute as @a if score @p LifeStoneHeld matches 1 if score @p ReviveCoreUses matches 1.. as @p run function nextlife:give_life 


execute at @a[team=dead, gamemode = spectator] if block ~ ~3 ~ minecraft:player_head{SkullOwner:{Id:[I;-1945405539,-886094796,-1929299202,2082029364],Properties:{textures:[{Value:"eyJ0ZXh0dXJlcyI6eyJTS0lOIjp7InVybCI6Imh0dHA6Ly90ZXh0dXJlcy5taW5lY3JhZnQubmV0L3RleHR1cmUvZTZlZmM4NmRiOTIyMTdjNWEzODk2NzJiMjgyNDI3NWU3YTIwNmQ3ZWMwZjJjN2U0Y2E0ODNjNmUxN2M5ZjZkNSJ9fX0="}]}}} run function nextlife:revive
execute at @a[team=dead, gamemode = spectator] if block ~ ~2 ~ minecraft:player_head{SkullOwner:{Id:[I;-1945405539,-886094796,-1929299202,2082029364],Properties:{textures:[{Value:"eyJ0ZXh0dXJlcyI6eyJTS0lOIjp7InVybCI6Imh0dHA6Ly90ZXh0dXJlcy5taW5lY3JhZnQubmV0L3RleHR1cmUvZTZlZmM4NmRiOTIyMTdjNWEzODk2NzJiMjgyNDI3NWU3YTIwNmQ3ZWMwZjJjN2U0Y2E0ODNjNmUxN2M5ZjZkNSJ9fX0="}]}}} run function nextlife:revive
execute at @a[team=dead, gamemode = spectator] if block ~ ~1 ~ minecraft:player_head{SkullOwner:{Id:[I;-1945405539,-886094796,-1929299202,2082029364],Properties:{textures:[{Value:"eyJ0ZXh0dXJlcyI6eyJTS0lOIjp7InVybCI6Imh0dHA6Ly90ZXh0dXJlcy5taW5lY3JhZnQubmV0L3RleHR1cmUvZTZlZmM4NmRiOTIyMTdjNWEzODk2NzJiMjgyNDI3NWU3YTIwNmQ3ZWMwZjJjN2U0Y2E0ODNjNmUxN2M5ZjZkNSJ9fX0="}]}}} run function nextlife:revive
