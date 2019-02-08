/*
	Author: Basti | John Collins
*/

params [
	"_head",
	"_body",
	["_error",false,[false]],
	["_speed","",[""]]
];

if (isServer || !hasInterface) exitWith {};

disableSerialization;
_display = finddisplay 46;
if (_error) then {
	playSound "3DEN_notificationWarning";
} else {
	playSound "3DEN_notificationDefault";
};

private _TextField = _display ctrlCreate ["RscStructuredText", -1];
_TextField ctrlSetStructuredText parseText _body;
_TextField ctrlSetPosition [0.814531 * safezoneW + safezoneX,0.214 * safezoneH + safezoneY,0.185625 * safezoneW,0];
_TextField ctrlSetBackgroundColor [0.192,0.216,0.267,0.8];
_TextField ctrlSetFade 1;
_TextField ctrlCommit 0;

private _Header = _display ctrlCreate ["RscText", -1];
_Header ctrlSetText _head;
_Header ctrlSetPosition [2, 0.181 * safezoneH + safezoneY,0.185625 * safezoneW, 0.033 * safezoneH];
_Header ctrlSetBackgroundColor [0.129,0.149,0.192,0.9];
_Header ctrlSetFade 1;
_Header ctrlCommit 0;


private _Trenner = _display ctrlCreate ["RscText", -1];
_Trenner ctrlSetPosition [0.995 * safezoneW + safezoneX,0.181 * safezoneH + safezoneY,0.0103125 * safezoneW, 0];
_Trenner ctrlCommit 0;
_Trenner ctrlSetPosition [0.995 * safezoneW + safezoneX,0.181 * safezoneH + safezoneY,0.0103125 * safezoneW, ((ctrlTextHeight _TextField)+ (ctrlTextHeight _Header)) + (0.0165 * safezoneH)];
_Trenner ctrlSetBackgroundColor [0.718,0.118,0.118,1];
_Trenner ctrlCommit 0.2;


_Header ctrlSetPosition [0.814531 * safezoneW + safezoneX,0.181 * safezoneH + safezoneY];
_Header ctrlSetFade 0;
_Header ctrlCommit 0.3;

_TextField ctrlSetPosition [0.814531 * safezoneW + safezoneX,0.214 * safezoneH + safezoneY,0.185625 * safezoneW, ((ctrlTextHeight _TextField)+ (0.005 * safezoneH))];
_TextField ctrlSetFade 0;
_TextField ctrlCommit 1;

[_TextField,_Header,_Trenner,_speed] spawn {
 	disableSerialization;
 	if (_this select 3 isEqualTo "fast") then {
 		uiSleep 5;
 	} else {
 		uiSleep 15;
 	};
	private _TextField = _this select 0;
	private _Header = _this select 1;
	private _Trenner = _this select 2;
	_posText = (ctrlPosition (_TextField)) select 1;
	_posHeader = (ctrlPosition (_Header)) select 1;
	_posTrenner = (ctrlPosition (_Trenner)) select 1;
	_highTrenner = (ctrlPosition (_Trenner)) select 3;
	_posText = (_posText + _highTrenner + (0.011 * safezoneH));
	_posHeader = (_posHeader + _highTrenner + (0.011 * safezoneH));
	_posTrenner = (_posTrenner + _highTrenner + (0.011 * safezoneH));
	_TextField ctrlSetPosition [2 * safezoneW + safezoneX,_posText];
	_Header ctrlSetPosition [2 * safezoneW + safezoneX, _posHeader];
	_TextField ctrlCommit 0.8;
	_Header ctrlCommit 0.8;
	_Trenner ctrlSetPosition [2 * safezoneW + safezoneX,_posTrenner];
	_Trenner ctrlCommit 0.8;
	uiSleep 0.8;
	ctrlDelete _Header;
	ctrlDelete _TextField;
	ctrlDelete _Trenner;
};

if (count life_open_notifications > 0) then {
	private _activeNotifications = 0;
	{
		private _ctrlHeader = _x select 0;
		private _ctrlText = _x select 1;
		private _ctrlTrenner = _x select 2;

		_posText = (ctrlPosition (_ctrlText)) select 1;
		_posHeader = (ctrlPosition (_ctrlHeader)) select 1;
		_posTrenner = (ctrlPosition (_ctrlTrenner)) select 1;
		_highTrenner = (ctrlPosition (_ctrlTrenner)) select 3;

		if (!isNull _ctrlHeader && !isNull _ctrlText && !isNull _ctrlTrenner) then {
			_ctrlHeader ctrlSetPosition [0.814531 * safezoneW + safezoneX, (_posHeader + _highTrenner + (0.011 * safezoneH))];
			_ctrlText ctrlSetPosition [0.814531 * safezoneW + safezoneX, (_posText + _highTrenner + (0.011 * safezoneH))];
			_ctrlTrenner ctrlSetPosition [0.995 * safezoneW + safezoneX, (_posTrenner + _highTrenner + (0.011 * safezoneH))];
			_ctrlHeader ctrlCommit 0.25;
			_ctrlText ctrlCommit 0.25;
			_ctrlTrenner ctrlCommit 0.25;
			_posText = (_posText + _highTrenner + (0.011 * safezoneH));
			_posHeader = (_posHeader + _highTrenner + (0.011 * safezoneH));
			_posTrenner = (_posTrenner + _highTrenner + (0.011 * safezoneH));
			if (_activeNotifications > 3) then {
				_ctrlText ctrlSetPosition [2 * safezoneW + safezoneX,_posText];
				_ctrlHeader ctrlSetPosition [2 * safezoneW + safezoneX, _posHeader];
				_ctrlText ctrlCommit 0.8;
				_ctrlHeader ctrlCommit 0.8;
				_ctrlTrenner ctrlSetPosition [2 * safezoneW + safezoneX,_posTrenner];
				_ctrlTrenner ctrlCommit 0.8;
			};
			_activeNotifications = _activeNotifications + 1;
		};
	} forEach life_open_notifications;
};
life_open_notifications = ([[_Header,_TextField,_Trenner]] + life_open_notifications) select {!isNull (_x select 0) && !isNull (_x select 1) && !isNull (_x select 2)}; // Add the Element to the Front of the Array and remove the deleted Arrays