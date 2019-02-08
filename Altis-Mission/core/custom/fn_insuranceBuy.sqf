/*
	Author: Basti | John Collins
*/

private _params = param [3, false, [true]];
private _mode = _params select 0;

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

if (isNil "_vehicle") exitWith {["Fahrzeugfehler","Es ist kein Fahrzeug in der Nähe!", true, "fast"] spawn ESG_fnc_notify;};
if (isNull _vehicle) exitWith {};
if (!alive _vehicle) exitWith {["Fahrzeugfehler","Es ist kein Fahrzeug in der Nähe!", true, "fast"] spawn ESG_fnc_notify;};
if ((damage _vehicle) isEqualTo 1) exitWith {["Fahrzeugfehler","Es ist kein Fahrzeug in der Nähe!", true, "fast"] spawn ESG_fnc_notify;};
if (_vehicle getVariable ["insurance", true]) exitWith {["Fahrzeugfehler","Es ist kein Fahrzeug in der Nähe!", true, "fast"] spawn ESG_fnc_notify;};

private _info = _vehicle getVariable ["dbInfo",[]];

if (_info isEqualTo  []) exitWith {["Fahrzeugfehler","Es ist ein Fehler aufgetreten. Bitte melde dich im Support!", true, "fast"] spawn ESG_fnc_notify;};

private _side = switch (playerSide) do {
		case west: {"cop"};
		case independent: {"med"};
		case civilian: {"civ"};
		case east: {"med"};
		default {"civ"};
	};

private _price = getNumber (missionConfigFile >> "LifeCfgVehicles" >> (typeOf _vehicle) >> format ["price_%1", _side]);

disableSerialization;
private _ui = findDisplay 257364;
if (isNull _ui) then {
	createDialog "ZBG_Insurance";
	_ui = findDisplay 257364;
};

private _struc_info = _ui displayCtrl 1001;
private _struc_price = _ui displayCtrl 1002;

private _data = [typeOf _vehicle] call life_fnc_fetchVehInfo;

_struc_info ctrlSetStructuredText parseText format ["<t font='PuristaSemiBold'>Fahrzeugtyp: %1<br/>Sitzplätze: %2<br/>PS: %3<br/>Kaufpreis: %4$</t>", (_data select 3), (_data select 10), (_data select 11), _price];

_price = _price * 0.5;

_struc_price ctrlSetStructuredText parseText format ["<t font='PuristaBold' align='center'>Entgültiger Preis für die Versicherung: %1$</t>", _price];

if (_mode) then {
	if (life_atmbank < _price) exitWith {closeDialog 0; ["Zu wenig Geld","Du hast zu wenig Geld, um die Versichrung zu bezahlen!", true, "fast"] spawn ESG_fnc_notify;};
	life_atmbank = life_atmbank - _price;
	[0] call SOCK_fnc_updatePartial;
	[_vehicle, player, _info] remoteExecCall ["ESG_fnc_applyInsurance", 2];
	closeDialog 0;
};