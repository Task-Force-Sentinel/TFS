class ACE_Head {
	
	class TFSRHS_Glasses_Action_Blindfold_PutOn {
		displayName = "$STR_TFSRHS_Glasses_Action_Blindfold_PutOn";
		condition = "[_player, _target] call TFSRHS_glasses_fnc_blindfold_canPutOn";
		statement = "[_player, _target] call TFSRHS_glasses_fnc_blindfold_doPutOn";
		exceptions[] = {"isNotInside", "isNotSitting"};
		icon = "";
		distance = 2.0;
		showDisabled = 0;
	};
	
	class TFSRHS_Glasses_Action_Blindfold_Remove {
		displayName = "$STR_TFSRHS_Glasses_Action_Blindfold_Remove";
		condition = "[_player, _target] call TFSRHS_glasses_fnc_blindfold_canRemove";
		statement = "[_player, _target] call TFSRHS_glasses_fnc_blindfold_doRemove";
		exceptions[] = {"isNotInside", "isNotSitting"};
		icon = "";
		distance = 2.0;
		showDisabled = 0;
	};
	
};
