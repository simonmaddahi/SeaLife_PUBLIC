#include "..\..\script_macros.hpp"
/*
    File: fn_hudUpdate.sqf
    Author: Daniel Stuart

    Description:
    Updates the HUD when it needs to.
*/
disableSerialization;

if (isNull LIFEdisplay) then {[] call life_fnc_hudSetup;};
LIFEctrl(2200) progressSetPosition (life_hunger / 100);
LIFEctrl(2201) progressSetPosition (1 - (damage player));
LIFEctrl(2202) progressSetPosition (life_thirst / 100);
if(zbg_settings_logo) then {
	LIFEctrl(8888) ctrlSetFade 0.5;
	LIFEctrl(8888) ctrlCommit 0;
} else {
	LIFEctrl(8888) ctrlSetFade 1;
	LIFEctrl(8888) ctrlCommit 0;
};

LIFEctrl(1000) ctrlSetStructuredText parsetext format ["<t align='right'>%1 - %2 - %3</t>",(player getvariable ["realname",name player]), life_realtime_string , (call ESG_DBID)];
LIFEctrl(1000) ctrlSetFade 0.3;
LIFEctrl(1000) ctrlCommit 0;