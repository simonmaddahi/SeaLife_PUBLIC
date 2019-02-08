/*
    File: fn_levelCheck.sqf
    Author: BoGuu

    Description:
    xx
*/

if !(params [["_itemConfig", [], [[],""]]]) exitWith {};

scopeName "main";

private _return = false;

if (_itemConfig isEqualTo []) exitWith {diag_log "An empty array was passed to fn_levelCheck.sqf"; _return};

if (_itemConfig isEqualType []) then {
    private _lastElement = _itemConfig select (count _itemConfig - 1);
    if (_lastElement isEqualType "") then {
        _itemConfig = _lastElement;
    } else {
        true breakOut "main";
    };
};

if (_itemConfig isEqualTo "") exitWith {true};
private _evaluation = call compile _itemConfig;
if((["license_civ",_itemConfig]call bis_fnc_instring) && (playerSide in [west,independent,east])) exitWith {true};
if((["license_cop",_itemConfig]call bis_fnc_instring) && (playerSide in [independent,east])) exitWith {true};

if (_evaluation isEqualType true) then {
    if (_evaluation) then {
        _return = true;
    };
} else {
    _return = true;
};

_return;
