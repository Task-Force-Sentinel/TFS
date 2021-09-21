class CfgFunctions {
	
	class TFSRHS_Fatigue {
		
		tag = "tfsrhs_fatigue";
		
		class Recline {
			file = "z\tfsrhs\addons\fatigue\functions";
			class initialize {};
			class initSettings {};
		};
		
	};
	
	class TFSRHS_Fatigue_ACE {
		
		tag = "ace_advanced_fatigue";
		
		class ace_advanced_fatigue {
			file = "z\tfsrhs\addons\fatigue\functions\ace_advanced_fatigue";
			class handleEffects {};
		};
		
	};
	
};
