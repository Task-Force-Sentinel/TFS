// by ALIAS
//
// Tutorial: https://www.youtube.com/user/aliascartoons

/*
nul = [delay_thunder_1,delay_thunder_2,delay_thunder_3,raindrops,storm_debris,local_fog,screen_effect,puddles,storm clouds] execVM QPATHTOF(Scripts\AL\Thunder\alias_thunderbolt.sqf);

=========== Types of thunder
delay_thunder_1 - sound, light, lightning bolt - to enable this use values higher than 0, a random delay based on that value will be generated between this type of thunders
delay_thunder_2 - sound and/or(random) light - to enable this use values higher than 0, a random delay based on that value will be generated between this type of thunders
delay_thunder_3 - sound only - to enable this use values higher than 0, a random delay based on that value will be generated between this type of thunders

raindrops		- insert true if you want raindrops, false if you don't
storm_debris	- insert true if you want debris in the air, false if you don't
local_fog		- insert true if you want (particles) fog around player, be advise AI won't be affected by this fog (to avoid heavy load on server) what you can do is to tweak spot/view range for AI in your mission
screen_effect	- string:
					"drops" - will project bubbles on the screen
					"blur" - will blur the screen in both first and third person
					"none" - no screen effect
puddles			- boolean, if true puddles will be created around players
storm clouds	- boolean, if true clouds will be generated



You can disable any effect on the fly making its related publicVariable false:
for
thunder_1 -		alias_thunder_1 = false;	publicVariable "alias_thunder_1";
thunder_2 - 	alias_thunder_2 = false;	publicVariable "alias_thunder_2";
thunder_3 -		alias_thunder_3 = false;	publicVariable "alias_thunder_3";

raindrops		- alias_rain_drops = false; publicVariable "alias_rain_drops";
storm_debris	- alias_wind_debris = false; publicVariable "alias_wind_debris";
local_fog		- alias_local_fog = false; publicVariable "alias_local_fog";

dayscreeneffect - make this false you don't want the screen flicker during daytime
				see alias_thunderbolt.sqf line 25
*/
//////////////// Example
nul = [-1,20,-1,true,true,true,"blur",false,true] execVM QPATHTOF(Scripts\AL\Thunder\alias_thunderbolt.sqf);
