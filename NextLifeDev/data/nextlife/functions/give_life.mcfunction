scoreboard players set @p LifeStoneHeld 0
scoreboard players set @p ReviveCoreUses 0

scoreboard players add @p Lives 1 

execute at @p as @p run playsound entity.player.levelup master @a ~ ~ ~ 0.5 2

execute at @p as @p run fill ~-10 ~-10 ~-10 ~10 ~10 ~10 air replace minecraft:player_head{SkullOwner:{Id:[I;771314312,-1101969201,-1187191810,-948173234],Properties:{textures:[{Value:"eyJ0ZXh0dXJlcyI6eyJTS0lOIjp7InVybCI6Imh0dHA6Ly90ZXh0dXJlcy5taW5lY3JhZnQubmV0L3RleHR1cmUvNjg5MWY1YzIzYTU0MzY0MzI0NGJjNjEwMjA0ZTQ3NWFhZjczMWRkYTVjOTZiMjY4ZGM1ZDkyMmVhODMyN2E4YyJ9fX0="}]}}}
tellraw @p {"text":"", "extra": [{"color": "#00FF00", "text": "You Gained An Extra Life!"}]}
