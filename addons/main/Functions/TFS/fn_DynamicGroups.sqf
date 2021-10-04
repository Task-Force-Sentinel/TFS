// not documented: postinit

if (isServer) then {
    ["initialize"] call BIS_fnc_dynamicgroups;
} else {
    ["initializeplayer", [player]] call BIS_fnc_dynamicgroups;
};