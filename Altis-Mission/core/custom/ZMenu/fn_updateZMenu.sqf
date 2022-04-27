 /*
	Author: Natic
	
	Description: Check it for yourself :)
*/

#include "..\..\..\script_macros.hpp"
_mode = [_this, 0, [0]]call Bis_fnc_param;
switch(_mode) do {
	case 0: {
		disableSerialization;
		_display = findDisplay 2001;
		//(_display displayCtrl 8888) ctrlSetText (profilenamespace getVariable ['esg_tablethintergrund','texture\tablet\bg_3.paa']);
		_mStat = _display displayCtrl 2015;
		_L = _display displayCtrl 2022;
		lbClear _L;
		{
			if (!isNull _x && alive _x && player distance _x < 10 && _x != player) then {
				_L lbAdd format ["%1 - %2",_x getVariable ["realname",name _x], side _x];
				_L lbSetData [(lbSize _L)-1,str(_x)];
			};
		} forEach playableUnits;
		_mstatus ctrlSetStructuredText parseText format ["<img size='1.3' image='icons\ico_bank.paa'/> <t size='0.8px'>$%1</t><br/><img size='1.2' image='icons\ico_money.paa'/> <t size='0.8'>$%2</t>",[life_atmbank] call life_fnc_numberText,[life_cash] call life_fnc_numberText];
	};
	
	case 1: {
		disableSerialization;
		_display = findDisplay 8521;
		//(_display displayCtrl 8888) ctrlSetText (profilenamespace getVariable ['esg_tablethintergrund','texture\tablet\bg_3.paa']);
		_title = _display displayCtrl 1109;
		_L = _display displayCtrl 1112;
		_LInv = _display displayCtrl 1111;
		lbClear _L;
		{
			if (!isNull _x && alive _x && player distance _x < 10 && _x != player) then {
				_L lbAdd format ["%1 - %2",_x getVariable ["realname",name _x], side _x];
				_L lbSetData [(lbSize _L)-1,str(_x)];
			};
		} forEach playableUnits;
		lbClear _LInv;
		{
			if (ITEM_VALUE(configName _x) > 0) then {
				_LInv lbAdd format ["%2 [x%1]",ITEM_VALUE(configName _x),localize (getText(_x >> "displayName"))];
				_LInv lbSetData [(lbSize _LInv)-1,configName _x];
				_icon = M_CONFIG(getText,"VirtualItems",configName _x,"icon");
				if (!(_icon isEqualTo "")) then {
					_LInv lbSetPicture [(lbSize _LInv)-1,_icon];
				};
			};
		} forEach ("true" configClasses (missionConfigFile >> "VirtualItems"));
		_title ctrlSetStructuredText parseText format["<t font='PuristaBold' align='left'>%1</t><t font='PuristaBold' align='center'>Tragelast: %2</t><t font='PuristaBold' align='right'>Max. Tragelast: %3</t>", player getVariable ["realname", name player], life_carryweight, life_maxWeight];
	};
	
	case 2: {
		disableSerialization;
		_display = findDisplay 5772;
		_LHat = _display displayCtrl 1111;
		_LBraucht = _display displayCtrl 1112;
		_side = switch (playerSide) do {case west:{"cop"}; case civilian:{"civ"}; case independent:{"med"}; case east:{"arc"};};
		lbClear _LHat;
		lbClear _LBraucht;
		{
			_displayName = getText(_x >> "displayName");

			if (LICENSE_VALUE(configName _x,_side)) then {
				_LHat lbAdd format ["%1", _displayName];
				_LHat lbSetColor [(lbSize _LHat) - 1, [0, 1, 0, 0.8]];
			} else {
				_LBraucht lbAdd format ["%1 - %2$", _displayName, [getNumber(_x >> "price")]call life_fnc_numberText];
				_LBraucht lbSetColor [(lbSize _LBraucht) - 1, [1, 0, 0, 0.8]];
			};
		} forEach (format ["getText(_x >> 'side') isEqualTo '%1'",_side] configClasses (missionConfigFile >> "Licenses"));
	};
};
