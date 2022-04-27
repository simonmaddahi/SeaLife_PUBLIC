/*
	Author: Basti | John Collins
	Modify: Natic
*/

params [
	["_target", objNull, [objNull]]
];

if (isNull _target || {!(isPlayer _target)}) exitWith {}; //Error Checks

private _anim = _target getVariable ["restrainAnim", "AmovPercMstpSnonWnonDnon_Ease"];
private _select = [];

switch (_anim) do {
	case "Acts_AidlPsitMstpSsurWnonDnon05": {
		_select = [["Hinstellen", "AmovPercMstpSnonWnonDnon_Ease"], ["Hinhocken", "Acts_ExecutionVictim_Loop"]];
	};

	case "Acts_ExecutionVictim_Loop": {
		_select = [["Hinstellen", "AmovPercMstpSnonWnonDnon_Ease"], ["Hinsetzen", "Acts_AidlPsitMstpSsurWnonDnon05"]];
	};

	case "AmovPercMstpSnonWnonDnon_Ease": {
		_select = [["Hinhocken", "Acts_ExecutionVictim_Loop"], ["Hinsetzen", "Acts_AidlPsitMstpSsurWnonDnon05"]];
	};
};

private _action = [
  format ["Wie soll %1 seine Haltung ändern?", _target getVariable ["realname", name _target]],
   "Haltung ändern",
   ((_select select 0) select 0),
   ((_select select 1) select 0)
] call BIS_fnc_guiMessage;

if (_action) then {
	_target setVariable ["restrainAnim", ((_select select 0) select 1), true];
} else {
	_target setVariable ["restrainAnim", ((_select select 1) select 1), true];
};
