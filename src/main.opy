settings {
    "lobby": {
        "team1Slots": 1,
        "team2Slots": 11
    },
    "gamemodes": {
        "skirmish": {
            "enabledMaps": [
                "workshopChamber"
            ]
        },
        "general": {
            "enableHeroSwitching": false,
            "gamemodeStartTrigger": "immediately",
            "heroLimit": "off",
            "enableKillCam": false,
            "enableRandomHeroes": true,
            "respawnTime%": 0,
            "tankPassiveHealthBonus": "alwaysEnabled"
        }
    },
    "heroes": {
        "team1": {
            "mccree": {
                "enableAbility1": false,
                "enableAbility2": false,
                "enableInfiniteAmmo": true,
                "enableSecondaryFire": false,
                "enableUlt": false
            }
        },
        "team2": {
            "mccree": {
                "enableAbility1": false,
                "health%": 10,
                "enableAbility2": false,
                "enablePrimaryFire": false,
                "enableHeadshotsOnly": true,
                "enableSecondaryFire": false,
                "enableUlt": false
            }
        },
        "allTeams": {
            "enabledHeroes": [
                "mccree"
            ]
        }
    }
}

#Player variables

playervar score 0
playervar maxScore 1


rule "生きている間はHPが減り続ける":
    while true:
        damage(getLivingPlayers(Team.1), null, 8)
        wait(0.1)


rule "マッチ開始時にBOT追加":
    createDummy(Hero.MCCREE, Team.2, 1, vect(random.randint(-15, 15), 0, random.randint(-15, 15)), vect(0, 0, 0))
    createDummy(Hero.MCCREE, Team.2, 2, vect(random.randint(-15, 15), 0, random.randint(-15, 15)), vect(0, 0, 0))
    createDummy(Hero.MCCREE, Team.2, 3, vect(random.randint(-15, 15), 0, random.randint(-15, 15)), vect(0, 0, 0))
    createDummy(Hero.MCCREE, Team.2, 4, vect(random.randint(-15, 15), 0, random.randint(-15, 15)), vect(0, 0, 0))
    createDummy(Hero.MCCREE, Team.2, 5, vect(random.randint(-15, 15), 0, random.randint(-15, 15)), vect(0, 0, 0))


rule "botが死んだときの処理":
    @Event playerDied
    @Condition eventPlayer.isDummy() == true
    
    eventPlayer.teleport(vect(random.randint(-15, 15), 0, random.randint(-15, 15)))
    eventPlayer.resurrect()
    eventPlayer.setHealth(22.5)
    heal(getLivingPlayers(Team.1), null, 50)


rule "キルをとった時の処理":
    @Event playerDealtFinalBlow
    @Condition eventPlayer.isDummy() == false
    
    eventPlayer.score += 1
    if eventPlayer.score > eventPlayer.maxScore:
        eventPlayer.maxScore = eventPlayer.score


rule "プレイヤーが死んだときの処理":
    @Event playerDied
    @Condition eventPlayer.isDummy() == false
    
    eventPlayer.score = 0


rule "HUD":
    @Event eachPlayer
    
    hudText(eventPlayer, "", "スコア:{0}".format(eventPlayer.maxScore), null, HudPosition.RIGHT, 0, Color.WHITE, Color.WHITE, Color.WHITE, HudReeval.VISIBILITY_AND_STRING, SpecVisibility.DEFAULT)


