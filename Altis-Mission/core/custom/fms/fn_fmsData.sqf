/*
	Author: Natic
	
	Description: Check it for yourself :)
*/


disableSerialization;
_display = findDisplay 39400;
_tree = _display displayCtrl 1500;
_namectrl = _display displayCtrl 1002;
_kurzctrl = _display displayCtrl 1005;
_gebietctrL = _display displayCtrl 1101;
_countctrl = _display displayCtrl 1010;
_data = _tree tvData (_this select 0);
_str = _data;
if ((_data isEqualTo "") || (_data isEqualTo "space")) then {
  _str = "default";
};
_s = switch (playerSide) do {case west: {"cop"}; case independent: {"medic"}; case east: {"arc"};};

_name = getText(missionConfigFile >> "CfgFMS" >> _s >> _str >> "name");
_kurz = getText(missionConfigFile >> "CfgFMS" >> _s >> _str >> "kurz");
_gebiet = getText(missionConfigFile >> "CfgFMS" >> _s >> _str >> "gebiet");
_count = {(((_x getVariable ["fms",[0,"pups"]]) select 1) isEqualTo _str && (side _x isEqualTo playerside))}count (units(group player));
_namectrl ctrlSetText format ["%1",_name];
_kurzctrl ctrlSetText format ["%1",_kurz];
_gebietctrL ctrlSetText format ["%1",_gebiet];
lbClear _countctrl;
{
	if(_count isEqualTo 0) exitWith {
		_countctrl lbadd format["%1", "Keine Einheit"];
		_countctrl lbSetData[(lbSize _countctrl) - 1, "space"];
	};
	if(!((_x getVariable ["fms",[]]) isEqualTo []) && (side _x isEqualTo playerside) && {(((_x getVariable ["fms", []]) select 1) isEqualTo _str)}) then {
		_countctrl lbadd format["%1 (%2)", _x getVariable["realname",name player], _x getVariable ["rankaus","Polizist"]];
		_countctrl lbSetData[(lbSize _countctrl) - 1, "space"];
	};
	nil;
}count (units(group player));
