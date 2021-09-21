class CfgFunctions {
	
	class TFSRHS_Modules {
		
		tag = "tfsrhs_modules";
		
		class Modules {
			file = "z\tfsrhs\addons\modules\functions";
			class initialize {};
			class initSettings {};
		};
		
	};
	
	class TFSRHS_Functions {
		
		tag = "tfsrhs";
		
		class Modules_Sound {
			file = "z\tfsrhs\addons\modules\functions\sound";
			class moduleAmbientSound {};
			class moduleTriggerSound {};
		};
		
		class Modules_Speech {
			file = "z\tfsrhs\addons\modules\functions\speech";
			class moduleGlobalSpeech {};
			class moduleGlobalSpeechMenu {};
			class moduleGlobalSpeechPlay {};
			class moduleTriggerSpeech {};
		};
		
	};
	
};
