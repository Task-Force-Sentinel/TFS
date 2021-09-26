class CfgFunctions {
	
	class TFS_Hints {
		
		tag = "tfs_hints";
		
		class Hints {
			file = "\z\tfs\addons\hints\functions";
			class cleanup {};
			class initialize {};
			class initSettings {};
		};
		
	};

	class TFS_Hints_Functions {
		
		tag = "tfs";
		
		class Hints {
			file = "\z\tfs\addons\hints\functions";
			class hint {};
			class hintGlobal {};
		};
		
	};
	
	class TFS_Hints_ACE {
		
		tag = "ace_common";
		
		class ace_common {
			file = "\z\tfs\addons\hints\functions\ace_common";
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
	
	class TFS_Hints_CBA {
		
		tag = "cba";
		
		class cba_ui {
			file = "z\tfs\addons\hints\functions\cba_ui";
			class notify {};
			class notifyEx { recompile = 1; file = "\x\cba\addons\ui\fnc_notify.sqf"; };
		};
		
	};
	
};
