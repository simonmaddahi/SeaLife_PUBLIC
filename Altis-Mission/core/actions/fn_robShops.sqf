private["_robber", "_shop", "_kassa", "_ui", "_progress", "_pgText", "_cP", "_rip", "_pos"];
_shop = [_this, 0, ObjNull, [ObjNull]] call BIS_fnc_param;
_robber = [_this, 1, ObjNull, [ObjNull]] call BIS_fnc_param;
_action = [_this, 2] call BIS_fnc_param; //Action name
_kassa = 100;
_rip = false;
if (side _robber != civilian) exitWith {
    ["Aktion abgebrochen","Du bist im Dienst und kannst die Bank nicht ausrauben!", true, "fast"] spawn ESG_fnc_notify;
};
if (_robber distance _shop > 5) exitWith {
    ["Aktion abgebrochen","Du musst in einen Radius von 5m bleiben!", true, "fast"] spawn ESG_fnc_notify;
};
if (_rip) exitWith {
    ["Aktion abgebrochen","Es ist bereits ein Raub im Gange!", true, "fast"] spawn ESG_fnc_notify;
};
if (vehicle player != _robber) exitWith {
    ["Aktion abgebrochen","Steig vorher aus deinem Fahrzeug aus!", true, "fast"] spawn ESG_fnc_notify;
};
if !(alive _robber) exitWith {};
if ((currentWeapon _robber isEqualTo "") || (currentWeapon _robber in ["Binocular", "Rangefinder"])) exitWith {
    ["Aktion abgebrochen","Ohne eine Waffe kannst du die Bank nicht ausrauben!", true, "fast"] spawn ESG_fnc_notify;
};
_cops = (west countSide playableUnits);
if (_cops < 3) exitWith {
    ["Aktion abgebrochen","Es sind nicht genügend Polizisten im Dienst!", true, "fast"] spawn ESG_fnc_notify;
};
if (_kassa isEqualTo 0) exitWith {
    ["Aktion abgebrochen","Es ist kein Geld in der Kasse!", true, "fast"] spawn ESG_fnc_notify;
};
_rip = true;
_kassa = 20000 + round(random 10000);
_shop removeAction _action;
_chance = random(100);
[1, format["!!ALARM!! %1 braucht Hilfe! Tankstelle: %2 wird gerade ausgeraubt!", _shop getVariable ["realname", name _shop], _shop getVariable ["name_shop",_shop]]] remoteExec ["life_fnc_broadcast", west];
[_shop, "AmovPercMstpSsurWnonDnon"] remoteExecCall ["life_fnc_animSync", -2];
disableSerialization;
5 cutRsc["life_progress", "PLAIN"];
_ui = uiNameSpace getVariable "life_progress";
_progress = _ui displayCtrl 38201;
_pgText = _ui displayCtrl 38202;
_pgText ctrlSetText format["Kassierer holt das Geld (10m) (1%1)...", "%"];
_progress progressSetPosition 0.01;
_cP = 0.01;
if (_rip) then {
    while {true} do {
        uiSleep 3.5;
        _cP = _cP + 0.01;
        _progress progressSetPosition _cP;
        _pgText ctrlSetText format["Kassierer holt das Geld (10m) (%1%2)...", round(_cP * 100), "%"];
        _Pos = position player; // by ehno: get player pos
        _marker = createMarker["Marker200", _Pos]; //by ehno: Place a Maker on the map
        "Marker200" setMarkerColor "ColorRed";
        "Marker200" setMarkerText "Tankstellenraub";
        "Marker200" setMarkerType "mil_warning";
        if (_cP >= 1) exitWith {};
        if (_robber distance _shop > 10.5) exitWith {};
        if !(alive _robber) exitWith {};
        if (player getVariable["esg_bewusstlos", false]) exitWith {};
    };
    if !(alive _robber) exitWith {
        _rip = false;
    };
    if (player getVariable["esg_bewusstlos", false]) exitWith {
        deleteMarker "Marker200";
        [_shop, ""] remoteExecCall["life_fnc_animSync", -2];
        ["Aktion abgebrochen","Du musst in einen Radius von 10m bleiben! Der Tresor wurde nun verriegelt!", true, "fast"] spawn ESG_fnc_notify;
        5 cutText["", "PLAIN"];
        _rip = false;
    };
    if (_robber distance _shop > 10.5) exitWith {
        deleteMarker "Marker200";
        [_shop, ""] remoteExecCall["life_fnc_animSync", -2];
        ["Aktion abgebrochen","Du musst in einen Radius von 10m bleiben! Der Tresor wurde nun verriegelt!", true, "fast"] spawn ESG_fnc_notify;
        5 cutText["", "PLAIN"];
        _rip = false;
    };
    5 cutText["", "PLAIN"];
    titleText[format["Du hast $%1 erbeutet! Fliehe lieber bevor die Cops herkommen!", [_kassa] call life_fnc_numberText], "PLAIN"];
    deleteMarker "Marker200"; // by ehno delete maker
    life_cash = life_cash + _kassa;
    _rip = false;
    life_use_atm = false;
    uiSleep(30 + random(180));
    life_use_atm = true;
    if !(alive _robber) exitWith {};
};
uiSleep 300;
_action = _shop addAction["Tankstelle ausrauben", life_fnc_robShops];
[_shop, ""] remoteExecCall["life_fnc_animSync", -2];
