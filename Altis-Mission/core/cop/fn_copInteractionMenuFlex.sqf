/*
	Author: Basti | John Collins
*/

params [
	["_mode", "", [""]]
];

if (_mode isEqualTo "") exitWith {};

disableSerialization;

if (player getVariable ["Escorting", false]) then {
    if (isNull life_pInact_curTarget) exitWith {closeDialog 0;}; //Bad target
    if (!isPlayer life_pInact_curTarget) exitWith {closeDialog 0;}; //Bad side check?
	if (player distance life_pInact_curTarget > 4 ) exitWith {closeDialog 0;};
};

//closeDialog 0;

if (!dialog) then {
	createDialog "pInteraction_Menu";
};

private _display = findDisplay 37400;
private _Btn0 = _display displayCtrl 37450;
private _Btn1 = _display displayCtrl 37451;
private _Btn2 = _display displayCtrl 37452;
private _Btn3 = _display displayCtrl 37453;
private _Btn4 = _display displayCtrl 37454;
private _Btn5 = _display displayCtrl 37455;
private _Btn6 = _display displayCtrl 37456;
private _Btn7 = _display displayCtrl 37457;
private _Btn8 = _display displayCtrl 37458;
private _Btn9 = _display displayCtrl 28547;
private _Btn10 = _display displayCtrl 28547;

{ _x ctrlShow false; } forEach [_Btn0,_Btn1,_Btn2,_Btn3,_Btn4,_Btn5,_Btn6,_Btn7,_Btn8,_Btn9,_Btn10];

switch (_mode) do {
	case "haltung": {
		_Btn0 ctrlShow true;
		_Btn1 ctrlShow true;
		_Btn2 ctrlShow true;

		private _anim = life_pInact_curTarget getVariable ["restrainAnim", "AmovPercMstpSnonWnonDnon_Ease"];
		if (_anim isEqualTo "AmovPercMstpSnonWnonDnon_Ease") then {
			_Btn0 ctrlEnable false;
			_Btn1 ctrlEnable true;
			_Btn2 ctrlEnable true;
		} else {
			if (_anim isEqualTo "Acts_ExecutionVictim_Loop") then {
				_Btn0 ctrlEnable true;
				_Btn1 ctrlEnable false;
				_Btn2 ctrlEnable true;
			} else {
				_Btn0 ctrlEnable true;
				_Btn1 ctrlEnable true;
				_Btn2 ctrlEnable false;
			};
		};

		_Btn0 ctrlSetText "Hinstellen";
    	_Btn0 buttonSetAction "closeDialog 0; life_pInact_curTarget setVariable ['restrainAnim', 'AmovPercMstpSnonWnonDnon_Ease', true]; life_pInact_curTarget playMove 'AmovPercMstpSnonWnonDnon_Ease';";

		_Btn1 ctrlSetText "Hinhocken";
    	_Btn1 buttonSetAction "closeDialog 0; life_pInact_curTarget setVariable ['restrainAnim', 'Acts_ExecutionVictim_Loop', true]; life_pInact_curTarget playMoveNow 'Acts_ExecutionVictim_Loop';";

		_Btn2 ctrlSetText "Hinsetzen";
    	_Btn2 buttonSetAction "closeDialog 0; life_pInact_curTarget setVariable ['restrainAnim', 'Acts_AidlPsitMstpSsurWnonDnon05', true]; life_pInact_curTarget playMoveNow 'Acts_AidlPsitMstpSsurWnonDnon05';";
	};

	case "lizenzen": {
		_Btn0 ctrlShow true;
		_Btn1 ctrlShow true;
		_Btn2 ctrlShow true;
		_Btn3 ctrlShow true;
		_Btn4 ctrlShow true;
		_Btn5 ctrlShow true;

		[player, clientOwner] remoteExecCall ["ESG_fnc_getLicenses", life_pInact_curTarget];

		waitUntil {!(isNil "ESG_getOtherLicense")};
		{_x ctrlEnable (ESG_getOtherLicense select _forEachIndex);}foreach [_Btn1,_Btn2,_Btn3,_Btn4,_Btn5];
		ESG_getOtherLicense = nil;

		_Btn0 ctrlSetText "Lizenzen einsehen";
    	_Btn0 buttonSetAction "[player] remoteExecCall [""life_fnc_licenseCheck"",life_pInact_curTarget]; closeDialog 0;";

		_Btn1 ctrlSetText "Fahrerlaubnis entziehen";
    	_Btn1 buttonSetAction "[4] remoteExecCall [""life_fnc_removeLicenses"", life_pInact_curTarget]; [""Lizenz abgenommen"",""Du hast der Person die Fahrererlaubnis entzogen."", false, ""fast""] spawn ESG_fnc_notify;";

		_Btn2 ctrlSetText "LKW-Fahrerl. entziehen";
    	_Btn2 buttonSetAction "[5] remoteExecCall [""life_fnc_removeLicenses"", life_pInact_curTarget]; [""Lizenz abgenommen"",""Du hast der Person die LKW-Fahrerlaubnis entzogen."", false, ""fast""] spawn ESG_fnc_notify;";

		_Btn3 ctrlSetText "Flugschein entziehen";
    	_Btn3 buttonSetAction "[6] remoteExecCall [""life_fnc_removeLicenses"", life_pInact_curTarget]; [""Lizenz abgenommen"",""Du hast der Person den Flugschein entzogen."", false, ""fast""] spawn ESG_fnc_notify;";

		_Btn4 ctrlSetText "Bootsschein entziehen";
    	_Btn4 buttonSetAction "[7] remoteExecCall [""life_fnc_removeLicenses"", life_pInact_curTarget]; [""Lizenz abgenommen"",""Du hast der Person den Bootsführerschein entzogen."", false, ""fast""] spawn ESG_fnc_notify;";

		_Btn5 ctrlSetText "Waffenschein entziehen";
    	_Btn5 buttonSetAction "[8] remoteExecCall [""life_fnc_removeLicenses"", life_pInact_curTarget]; [""Lizenz abgenommen"",""Du hast der Person den Waffenschein entzogen."", false, ""fast""] spawn ESG_fnc_notify;";
	};
};