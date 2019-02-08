﻿_mode = [_this,0,0]call bis_fnc_param;
if(isNull (findDisplay 5523))exitWith {};
disableSerialization;
_list = ((findDisplay 5523) displayCtrl 1500);
if((lbCurSel _list) isEqualTo -1)exitWith {["Fahrzeugfehler", "Wähle bitte erst ein Fahrzeug aus!", true, "fast"] spawn ESG_fnc_notify;};
_veh = (esg_fuelkillveh select (lbCurSel _list));
if(isNull _veh)exitWith {};
if(_mode isEqualTo 0)then {
	if(_veh getVariable ["esg_fuelWarned", false])exitWith {["Fahrzeugfehler", "Das Fahrzeug wird schon gewarnt!", true, "fast"] spawn ESG_fnc_notify;};
	if(_veh getVariable ["esg_fuelKilled", false])exitWith {["Fahrzeugfehler", "Das Fahrzeug wird gerade außer Gefecht gesetzt!", true, "fast"] spawn ESG_fnc_notify;};
	[_veh]remoteExec["esg_fnc_warnVehicle", (driver _veh)];
	["EMP-System", "Das ausgewählte Fahrzeug wird nun von dem EMP-System gewarnt.", false, "fast"] spawn ESG_fnc_notify;
	_log = format["%1 (%2) hat %3(%4) Gewarnt.", player getVariable["realname", name player], getPlayerUID player, (driver _veh) getVariable["realname",name (driver _veh)], str(_veh)];
	["FUELKILLER_LOG", _log] remoteExecCall ["ESG_fnc_logging", 2];
} else {
	if(_veh getVariable ["esg_fuelWarned", false])exitWith {["Fahrzeugfehler", "Das Fahrzeug wird schon gewarnt!", true, "fast"] spawn ESG_fnc_notify;};
	if(_veh getVariable ["esg_fuelKilled", false])exitWith {["Fahrzeugfehler", "Das Fahrzeug wird gerade außer Gefecht gesetzt!", true, "fast"] spawn ESG_fnc_notify;};
	[_veh]remoteExec["esg_fnc_fuelKillVehicle", (driver _veh)];
	["EMP-System", "Fahrzeug wird außer Gefecht gesetzt. Dies kann bis zu 2 Minuten dauern.", false, "fast"] spawn ESG_fnc_notify;
	_log = format["%1 (%2) hat %3(%4) Ge-Fuelkilled.", player getVariable["realname", name player], getPlayerUID player, (driver _veh) getVariable["realname",name (driver _veh)], str(_veh)];
	["FUELKILLER_LOG", _log] remoteExecCall ["ESG_fnc_logging", 2];
};