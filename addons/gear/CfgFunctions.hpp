class CfgFunctions {

	class TFSRHS_Gear {

		tag = "TFSRHS_gear";

		class Gear {
			file = "\z\tfsrhs\addons\gear\functions";
			class initialize {};
			class initSettings {};
		};

		class Common {
			file = "\z\tfsrhs\addons\gear\functions\common";
			class initPlayer {};
			class removeAll {};
			class restore {};
			class set {};
			class store {};
		};

		class Load {
			file = "\z\tfsrhs\addons\gear\functions\load";
			class load {};
			class load_loadout {};
			class load_properties {};
		};

	};

};
