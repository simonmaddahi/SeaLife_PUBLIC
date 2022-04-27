/*
	Author: Natic
	
	Description:
REALLY??? STOP TRYING TO GET THE MISSION FILES :D :D :D
*/


if (missionNamespace getVariable ["DECRYPT_compiled",false]) exitwith {};

{
	private _fnc = format["%1_fnc_%2",getText(_x >> "tag"),configName _x];
	missionNamespace setVariable [_fnc,compile format['
		private _fnc_scriptNameParent = if (isNil "_fnc_scriptName") then {"%1"} else {_fnc_scriptName};
		private _fnc_scriptName = "BIS_fnc_diagAAR";
		scriptName _fnc_scriptName;

		if (isNil "Exec_After") then {
			Exec_After = [];
		};
		Exec_After pushBack [_this,"%1",canSuspend];
	',_fnc]];
	nil;
} count ("true" configClasses (missionconfigfile >> "CRYPTOOOO"));
diag_log "PreCompiled Fncs";
