class CfgFunctions {

	class TFSRHS_Glasses {

		tag = "TFSRHS_glasses";

		class Glasses {
			file = "\z\tfsrhs\addons\glasses\functions";
			class initialize {};
			class initSettings {};
		};

		class Blindfold {
			file = "\z\tfsrhs\addons\glasses\functions\blindfold";
			class blindfold_canPutOn {};
			class blindfold_canRemove {};
			class blindfold_doPutOn {};
			class blindfold_doRemove {};
		};

	};

};
