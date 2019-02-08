#include "..\..\script_macros.hpp"
/*
    File: fn_gangUpgrade.sqf
    Author: Bryan "Tonic" Boardwine
	Edit: Natic
*/
private ["_maxMembers","_slotUpgrade","_upgradePrice", "_upgrade_employers"];
_upgrade_employers = getNumber(missionConfigFile >> "CFGcompany" >> "employers" >> "employers_upgrade");
_maxMembers = getNumber(missionConfigFile >> "CFGcompanyt" >> "employers" >> "max_employers");
_slotUpgrade = _maxMembers + _upgrade_employers;
_upgradePrice = round(_slotUpgrade * ((LIFE_SETTINGS(getNumber,"company_upgradeBase"))) / ((LIFE_SETTINGS(getNumber,"company_upgradeMultiplier"))));

_action = [
    format [(localize "STR_GNOTF_MaxMemberMSG")+ "<br/><br/>" +(localize "STR_GNOTF_CurrentMax")+ "<br/>" +(localize "STR_GNOTF_UpgradeMax")+ "<br/>" +(localize "STR_GNOTF_Price")+ " <t color='#8cff9b'>$%3</t>",_maxMembers,_slotUpgrade,[_upgradePrice] call life_fnc_numberText],
    localize "STR_Gang_UpgradeMax",
    localize "STR_Global_Buy",
    localize "STR_Global_Cancel"
] call BIS_fnc_guiMessage;

if (_action) then {
    if (BANK < _upgradePrice) exitWith {
        hint parseText format [
            (localize "STR_GNOTF_NotEoughMoney_2")+ "<br/><br/>" +(localize "STR_GNOTF_Current")+ " <t color='#8cff9b'>$%1</t><br/>" +(localize "STR_GNOTF_Lacking")+ " <t color='#FF0000'>$%2</t>",
            [BANK] call life_fnc_numberText,
            [_upgradePrice - BANK] call life_fnc_numberText
        ];
    };
    BANK = BANK - _upgradePrice;
    [1] call SOCK_fnc_updatePartial;
    group player setVariable ["gang_maxMembers",_slotUpgrade,true];
    hint parseText format [localize "STR_GNOTF_UpgradeSuccess",_maxMembers,_slotUpgrade,[_upgradePrice] call life_fnc_numberText];

    if (life_HC_isActive) then {
        [2,group player] remoteExec ["HC_fnc_updateCompany",HC_Life];
    } else {
        [2,group player] remoteExec ["TON_fnc_updateCompany",RSERV];
    };

} else {
    hint localize "STR_GNOTF_UpgradeCancel";
};
