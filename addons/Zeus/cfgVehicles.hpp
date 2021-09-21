class CfgVehicles {
    class Module_F;
    class ModuleEmpty_F;

    class ModuleCurator_F: Module_F {
		class Attributes
		{
            class TFSRHS_Config_Zeus {
                property = QUOTE(TFSRHS_Config_Zeus);
                control = "Checkbox";
				typeName = "BOOL";
                displayName = "TFSRHS Fundamentals: Config Zeus:";
                tooltip = "Enable to allow this Zeus to have placed units use TFSRHS AI Difficulty Settings (Settings - Addon Options)";
                expression = "if (_value isequalto true) then {[_this] call TFSRHS_fnc_ConfigZeus;}";
                condition = "logicModule";
                defaultValue = "(true)";
			};
		};
	};


};
