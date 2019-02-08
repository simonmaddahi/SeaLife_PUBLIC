#include "..\..\script_macros.hpp"
/*
    Author: Bryan "Tonic" Boardwine
	edit: Natic
*/
private "_action";
_action = [
    localize "STR_GNOTF_DisbandWarn",
    localize "STR_Gang_Disband_Gang",
    localize "STR_Global_Yes",
    localize "STR_Global_No"
] call BIS_fnc_guiMessage;

if (_action) then {
    hint localize "STR_GNOTF_DisbandGangPro";

    if (life_HC_isActive) then {
        [group player] remoteExec ["HC_fnc_removeCompany",HC_Life];
    } else {
        [group player] remoteExec ["TON_fnc_removeCompany",RSERV];
    };

} else {
    hint localize "STR_GNOTF_DisbandGangCanc";
};