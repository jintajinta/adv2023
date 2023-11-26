settings {
    "lobby": {
        "team1Slots": 1,
        "team2Slots": 11
    },
    "gamemodes": {
        "assault": {
            "enabled": false,
            "tankPassiveHealthBonus": "alwaysEnabled"
        },
        "bountyHunter": {
            "enabled": false,
            "tankPassiveHealthBonus": "alwaysEnabled"
        },
        "ctf": {
            "enabled": false,
            "tankPassiveHealthBonus": "alwaysEnabled"
        },
        "control": {
            "enabled": false,
            "tankPassiveHealthBonus": "alwaysEnabled"
        },
        "ffa": {
            "enabled": false,
            "tankPassiveHealthBonus": "alwaysEnabled"
        },
        "escort": {
            "enabled": false,
            "tankPassiveHealthBonus": "alwaysEnabled"
        },
        "flashpoint": {
            "enabled": false,
            "tankPassiveHealthBonus": "alwaysEnabled"
        },
        "hybrid": {
            "enabled": false,
            "tankPassiveHealthBonus": "alwaysEnabled"
        },
        "practiceRange": {
            "enabled": false,
            "tankPassiveHealthBonus": "alwaysEnabled"
        },
        "push": {
            "enabled": false,
            "tankPassiveHealthBonus": "alwaysEnabled"
        },
        "skirmish": {
            "enabledMaps": [
                "workshopChamber"
            ],
            "tankPassiveHealthBonus": "alwaysEnabled"
        },
        "tdm": {
            "enabled": false,
            "tankPassiveHealthBonus": "alwaysEnabled"
        },
        "general": {
            "enableHeroSwitching": false,
            "gamemodeStartTrigger": "immediately",
            "heroLimit": "off",
            "respawnTime%": 0,
            "enableKillCam": false,
            "enableRandomHeroes": true
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

rule "生きている間はHPが減り続ける":
    while true:
        damage(getLivingPlayers(Team.1),null,1)
        wait(0.1)

        
