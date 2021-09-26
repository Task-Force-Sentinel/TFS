class TFS_ModuleMedical: Module_F
{
	scope = 2;
	displayName = "Medical Facility";
	icon = "\z\tfs\addons\media\images\icons\Medical Area.paa";
	category = "Task Force Sentinel";
	function = "TFS_fnc_moduleMedicalFacility";
	functionPriority = 4;
	isGlobal = 1;
	isTriggerActivated = 0;
	isDisposable = 0;
	is3DEN = 0;
	class Attributes: AttributesBase
	{
		class ModuleDescription: ModuleDescription{};
	};
	class ModuleDescription: ModuleDescription
	{
		description[] = {
			"Sync this module to a building/object to create an Emergency Medical Facility within that location.",
			"The module will heal/revive anyone that enters the object area.",
			"This module is designed to be used with @ACE.",
			"This Module can be synced to multiple objects or multiple modules can be used."
		};
			position = 0; // Position is taken into effect
			direction = 0; // Direction is taken into effect
			optional = 1; // Synced entity is optional
			duplicate = 1; // Multiple entities of this type can be synced
	};
};