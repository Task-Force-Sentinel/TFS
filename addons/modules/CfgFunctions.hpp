class CfgFunctions {
	
	class TFS_Modules {
		
		tag = "tfs_modules";
		
		class Modules {
			file = "z\tfs\addons\modules\functions";
			class initialize {};
			class initSettings {};
		};
		
	};
	
	class TFS_Functions {
		
		tag = "tfs";
		
		class Modules_Sound {
			file = "z\tfs\addons\modules\functions\sound";
			class moduleAmbientSound {};
			class moduleTriggerSound {};
		};
		
		class Modules_Speech {
			file = "z\tfs\addons\modules\functions\speech";
			class moduleGlobalSpeech {};
			class moduleGlobalSpeechMenu {};
			class moduleGlobalSpeechPlay {};
			class moduleTriggerSpeech {};
		};
		
	};
	
};
