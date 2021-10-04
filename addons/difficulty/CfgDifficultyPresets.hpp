class CfgdifficultyPresets {
    defaultPreset = QGVAR(difficulty);
    
    class Custom;
    class GVAR(difficulty): Custom {
        displayname = PREFIX;
        
        description = "Custom TFS settings";
        optionDescription = "Custom TFS settings";
        
        levelAI = QGVAR(LevelAI);
        
        class Options {
            // Simulation
            reduceddamage = 0;
            // Reduced damage (0 = disabled, 1 = enabled)
            
            // Situational awareness
            groupindicators = 0;
            // group indicators (0 = never, 1 = limited distance, 2 = always)
            friendlyTags = 0;
            // Friendly name tags (0 = never, 1 = limited distance, 2 = always)
            enemyTags = 0;
            // Enemy name tags (0 = never, 1 = limited distance, 2 = always)
            detectedmines = 0;
            // Detected mines (0 = never, 1 = limited distance, 2 = always)
            commands = 0;
            // Commands (0 = never, 1 = fade out, 2 = always)
            waypoints = 0;
            // waypoints (0 = never, 1 = fade out, 2 = always)
            tacticalping = 0;
            // Tactical ping (0 = disabled, 1 = enabled)
            
            // Personal awareness
            weaponinfo = 2;
            // Weapon info (0 = never, 1 = fade out, 2 = always)
            stanceindicator = 2;
            // stance indicator (0 = never, 1 = fade out, 2 = always)
            staminaBar = 1;
            // Stamina bar (0 = disabled, 1 = enabled)
            weaponCrosshair = 0;
            // Weapon crosshair (0 = disabled, 1 = enabled)
            visionAid = 0;
            // Vision aid (0 = disabled, 1 = enabled)
            
            // View
            thirdPersonView = 1;
            // 3rd person view (0 = disabled, 1 = enabled)
            cameraShake = 0;
            // Camera shake (0 = disabled, 1 = enabled)
            
            // Multiplayer
            scoreTable = 0;
            // score table (0 = disabled, 1 = enabled)
            deathMessages = 0;
            // Killed by (0 = disabled, 1 = enabled)
            vonID = 0;
            // VON ID (0 = disabled, 1 = enabled)
            
            // Misc
            mapContent = 1;
            // Extended map content (0 = disabled, 1 = enabled) // before Arma 3 v1.68
            mapContentFriendly = 0;
            // Map friendlies (0 = disabled, 1 = enabled) // since Arma 3 v1.68
            mapContentEnemy = 0;
            // Map Enemies (0 = disabled, 1 = enabled) // since Arma 3 v1.68
            mapContentmines = 0;
            // Map mines (0 = disabled, 1 = enabled) // since Arma 3 v1.68
            autoreport = 0;
            // Automatic reporting (0 = disabled, 1 = enabled)
            multipleSaves = 0;
            // Multiple saves (0 = disabled, 1 = enabled)
        };
    };
};