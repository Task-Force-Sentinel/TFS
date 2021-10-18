if (isDedicated) exitWith {};

if (hasInterface) then {

    _playerUID = getPlayerUID player;

    switch (true) do {
        case (_playerUID in Ranks_CORPORAL)   : { player setRank "CORPORAL"; };
        case (_playerUID in Ranks_SERGEANT)   : { player setRank "SERGEANT"; };
        case (_playerUID in Ranks_LIEUTENANT) : { player setRank "LIEUTENANT"; };
        case (_playerUID in Ranks_CAPTAIN)    : { player setRank "CAPTAIN"; };
        case (_playerUID in Ranks_MAJOR)      : { player setRank "MAJOR"; };
        case (_playerUID in Ranks_COLONEL)    : { player setRank "COLONEL"; };
        default { player setRank "PRIVATE"; };
    };

};


