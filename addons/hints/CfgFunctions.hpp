class CfgFunctions {
	
	class TFSRHS_Hints {
		
		tag = "tfsrhs_hints";
		
		class Hints {
			file = "\z\tfsrhs\addons\hints\functions";
			class cleanup {};
			class initialize {};
			class initSettings {};
		};
		
	};

	class TFSRHS_Hints_Functions {
		
		tag = "tfsrhs";
		
		class Hints {
			file = "\z\tfsrhs\addons\hints\functions";
			class hint {};
			class hintGlobal {};
		};
		
	};
	
	class TFSRHS_Hints_ACE {
		
		tag = "ace_common";
		
		class ace_common {
			file = "\z\tfsrhs\addons\hints\functions\ace_common";
			class displayIcon {};
			class displayIconEx { file = "\z\ace\addons\common\functions\fnc_displayIcon.sqf"; };
			class displayText {};
			class displayTextEx { file = "\z\ace\addons\common\functions\fnc_displayText.sqf"; };
			class displayTextPicture {};
			class displayTextPictureEx { file = "\z\ace\addons\common\functions\fnc_displayTextPicture.sqf"; };
			class displayTextStructured {};
			class displayTextStructuredEx { file = "\z\ace\addons\common\functions\fnc_displayTextStructured.sqf"; };
			class stringToColoredText {};
		};
		
	};
	
	class TFSRHS_Hints_CBA {
		
		tag = "cba";
		
		class cba_ui {
			file = "z\tfsrhs\addons\hints\functions\cba_ui";
			class notify {};
			class notifyEx { recompile = 1; file = "\x\cba\addons\ui\fnc_notify.sqf"; };
		};
		
	};
	
};
