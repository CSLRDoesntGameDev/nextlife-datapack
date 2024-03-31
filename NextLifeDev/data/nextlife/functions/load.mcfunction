# This runs on /reload
gamerule showDeathMessages false

scoreboard objectives add ReviveCoreUses minecraft.used:player_head
scoreboard objectives add ReviveCoreheld dummy

scoreboard objectives add LifeStoneHeld dummy

scoreboard objectives add Deaths deathCount

scoreboard objectives add Kills playerKillCount

scoreboard objectives add DragonKills minecraft.killed:minecraft.ender_dragon

scoreboard objectives add MinimumSurvivorLives dummy

scoreboard objectives add SavedKills dummy
scoreboard objectives add SavedDragonKills dummy

scoreboard players set servertotal Lives 0

scoreboard objectives add SavedDeaths dummy
scoreboard objectives add Lives dummy

scoreboard players add @a Deaths 0
scoreboard players add @a Kills 0

scoreboard players add @a SavedKills 0
scoreboard players add @a SavedDeaths 0
scoreboard players add @a Lives 0

scoreboard players add @a ReviveCoreUses 0
scoreboard players add @a ReviveCoreHeld 0

scoreboard players add @a LifeStoneHeld 0

scoreboard players add @a DragonKills 0
scoreboard players add @a SavedDragonKills 0

team add dead
team add reapers
team add survivors

team modify dead color gray
team modify reapers color red
team modify survivors color reset

team modify reapers friendlyFire false
team modify dead seeFriendlyInvisibles true
team modify survivors prefix {"color":"#00F040", "text": "[SURVIVOR] "}
team modify reapers prefix {"color":"#FF5555", "text": "[REAPER] "}
team modify dead prefix {"color":"#AAAAAA", "text": "[DEAD] "}


tellraw @a {"text": "Datapack Reloaded!", "color": "#00FF00"}


# tellraw @a {"text":"Click Me!", "clickEvent": {"action": "run_command", "value": "/scoreboard players add CSLR DragonKills 1"} }
