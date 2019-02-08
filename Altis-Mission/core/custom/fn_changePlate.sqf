/*
	Author: Basti | John Collins
*/


private _params = param [3, [], [[]]];
private _mode = 0;
private _tag = "SL";
if !(_params isEqualTo []) then {
    _mode = _params select 0;
    if !(_mode isEqualTo 1) then {
        _tag = _params select 1;
    };
};

if !(playerSide isEqualTo civilian) exitWith {["Behördenfahrzeug","Du arbeitest für eine Behörde und kannst somit dein Kennzeichen nicht ändern!", true, "fast"] spawn ESG_fnc_notify;};

private "_vehicle";

if (vehicle player isEqualTo player) then {
	private _nearVehicles = nearestObjects[player, ["Car","Air","Ship"], 30];
    if !(_nearVehicles isEqualTo []) then {
        {
            if (!isNil "_vehicle") exitWith {}; //Kill the loop.
            _vehData = _x getVariable ["vehicle_info_owners",[]];
            if !(_vehData isEqualTo []) then {
                _vehOwner = ((_vehData select 0) select 0);
                if ((getPlayerUID player) isEqualTo _vehOwner) exitWith {
                    _vehicle = _x;
                };
            };
        } forEach _nearVehicles;
    };
} else {
    _vehicle = vehicle player;
};

if (isNil "_vehicle") exitWith {["Fahrzeugfehler","Kein Fahrzeug in der Nähe gefunden!", true, "fast"] spawn ESG_fnc_notify;};
if (isNull _vehicle) exitWith {};
if (!alive _vehicle) exitWith {["Fahrzeugfehler","Kein Fahrzeug in der Nähe gefunden!", true, "fast"] spawn ESG_fnc_notify;};
if ((damage _vehicle) isEqualTo 1) exitWith {["Fahrzeugfehler","Kein Fahrzeug in der Nähe gefunden!", true, "fast"] spawn ESG_fnc_notify;};
if !(_vehicle getVariable ["allowPlate", true]) exitWith {["Fahrzeugfehler","Du kannst dein Kennzeichen nur einmalig ändern!", true, "fast"] spawn ESG_fnc_notify;};

_plate = getPlateNumber _vehicle;
_plate = _plate splitString "-";
_plate = _plate select 1;

disableSerialization;
private _display = findDisplay 471578;
if (_display isEqualTo displayNull) then {createDialog "ZBG_Plates"; _display = findDisplay 471578;};
private _tagctrl = _display displayCtrl 1101;
private _numctrl = _display displayCtrl 1400;
private _text = ctrlText _numctrl;


if (_mode isEqualTo 0) then {
    zb_tem_tag = _tag;
	_tagctrl ctrlSetStructuredText parseText format ["<t font='PuristaMedium' align='center'>Dein ausgewähltes Kennzeichen: %1 - %2</t>", zb_tem_tag, _plate];
	_numctrl ctrlSetText format ["%1", _plate];
} else {
    if (zb_tem_tag isEqualTo "") then {zb_tem_tag = "SL"};
	if (_text isEqualTo "" || {!([_text] call TON_fnc_isnumber)} || {count _text > 6}) exitWith {["Falsche Daten","Fülle bitte das Feld mit korrekten Daten aus! Es sind nur Zahlen erlaubt! Max. 6 Zahlen!", true, "fast"] spawn ESG_fnc_notify;};
	if (_text isEqualTo _plate) exitWith {["Falsche Daten","Fülle bitte das Feld mit korrekten Daten aus! Bitte gebe ein neues Kennzeichen ein!", true, "fast"] spawn ESG_fnc_notify;};
	[_vehicle, format ["%1-%2", zb_tem_tag, _text], player] remoteExecCall ["ESG_fnc_changeDBPlate", 2];
	closeDialog 0;
    zb_tem_tag = nil;
};