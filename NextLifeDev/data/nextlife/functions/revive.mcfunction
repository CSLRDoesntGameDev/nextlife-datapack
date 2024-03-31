
playsound entity.warden.angry master @a ~ ~ ~ 1.0 
playsound minecraft:entity.enderman.stare master @a ~ ~ ~ 1.0 2.0
playsound minecraft:entity.wither.death master @a ~ ~ ~ 1.0 2.0
playsound block.beacon.activate master @a ~ ~ ~ 0.5 1.5

gamemode survival @p


particle minecraft:soul_fire_flame ~ ~ ~ 0 0 0 1 100 force

fill ~-10 ~-10 ~-10 ~10 ~10 ~10 air replace minecraft:player_head{SkullOwner:{Id:[I;-1945405539,-886094796,-1929299202,2082029364],Properties:{textures:[{Value:"eyJ0ZXh0dXJlcyI6eyJTS0lOIjp7InVybCI6Imh0dHA6Ly90ZXh0dXJlcy5taW5lY3JhZnQubmV0L3RleHR1cmUvZTZlZmM4NmRiOTIyMTdjNWEzODk2NzJiMjgyNDI3NWU3YTIwNmQ3ZWMwZjJjN2U0Y2E0ODNjNmUxN2M5ZjZkNSJ9fX0="}]}}}
particle minecraft:explosion ~ ~ ~ 0 0 0 1 1 force


team leave @p
scoreboard players set @p Lives 2
tellraw @a {"text":"", "extra": [ {"text":""}, { "color": "#FFAA00", "selector": "@p"}, {"color": "#FFAA00", "text":" Has Just Been Revived!"}]}

title @p title {"color": "#FFAA00", "text":" You Have Been Revived!"}

tp @p ~ ~10 ~
effect give @p glowing 10 255 true
effect give @p slow_falling 5 2 true