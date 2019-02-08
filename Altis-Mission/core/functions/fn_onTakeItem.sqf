#include "..\..\script_macros.hpp"
/*
    File: fn_onTakeItem.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Blocks the unit from taking something they should not have.
*/
private ["_unit","_item","_restrictedClothing","_restrictedWeapons"];
_unit = [_this,0,objNull,[objNull]] call BIS_fnc_param;
_container = [_this,1,objNull,[objNull]] call BIS_fnc_param;
_item = [_this,2,"",[""]] call BIS_fnc_param;

if (isNull _unit || _item isEqualTo "") exitWith {}; //Bad thingies?

_itemtype = [_item] call BIS_fnc_itemType select 1;
if(_itemtype isEqualTo "Uniform") then {
	if(!(_unit isUniformAllowed _item))then {
		[_unit,_item]spawn {
			_action = [
				format ["Willst du die Uniform %1 anziehen?", getText(configFile >> "CfgWeapons" >> (_this select 1) >> "displayName")],
				 "Uniform anziehen?",
				 "Ja",
				 "Nein"
			] call BIS_fnc_guiMessage;
			if(_action)then{
				(_this select 0) forceAddUniform (_this select 1);
				(_this select 0) removeItem (_this select 1);
			};
		};
	};
};

if(playerside isEqualTo civilian) then {
	if (_item in ["U_C_Poloshirt_blue","U_C_Poloshirt_burgundy","U_C_Poloshirt_stripped","U_C_Poloshirt_tricolour","U_C_Poloshirt_salmon","U_C_Poloshirt_redwhite","U_C_Commoner1_1"]) then {
            [] call life_fnc_playerSkins;
    };
};