params ["_logic"];
private _units = [];
switch (_logic getVariable ["TFSunits", -1]) do {
    case (-1): {
        _units append allunits;
    };
    case (0): {
        {
            _units append crew vehicle _x;
        } forEach synchronizedObjects _logic;
    };
    case (1): {
        {
            _units append units _x;
        } forEach synchronizedObjects _logic;
    };
    case (2): {
        {
            private _side = side _x;
            _units append (allunits select {
                _side == side _x
            });
        } forEach synchronizedObjects _logic;
    };
};
_units arrayintersect _units