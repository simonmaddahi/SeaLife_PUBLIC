/*
    File: fn_wantedInfo.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Pulls back information about the wanted criminal.
*/

private _data = param [0,[],[[]]];
private _name = param [1,"",[""]];
private _id = param [2,"",[""]];

disableSerialization;
private _display = findDisplay 2400;
private _list = _display displayCtrl 1501;
private _info = _display displayCtrl 1101;
private _mylist = [];

if (isNil "_data") exitWith {hint localize "STR_Cop_wantedList_FailedToFetch";};
if !(_data isEqualType []) exitWith {hint localize "STR_Cop_wantedList_FailedToFetch";};
if (_data isEqualTo []) exitWith {hint localize "STR_Cop_wantedList_FailedToFetch";};

lbClear _list;

private _crimes = _data select 0;
private _time = _data select 1;

{
	_str = format ["[%1,""%2""]", _forEachIndex, _id];
    _list lbAdd format ["%1", _x];
    _list lbSetdata [(lbSize _list)-1, _str];
} forEach _crimes;

//ctrlSetText[2403,format [localize "STR_Wanted_Bounty",[(_data select 1)] call life_fnc_numberText]];
_info ctrlSetStructuredText parseText format ["Name: %1<br/>Zuletzt geändert: %2", _name, _time];