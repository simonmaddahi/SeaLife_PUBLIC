private _target = ESG_medicInteract;
private _side = side _target;
if(damage _target isEqualTo 0) exitWith {["Person gesund","Die Person ist nicht verletzt!", true, "fast"] spawn ESG_fnc_notify;};
//_healed = ["heal"]call ESG_fnc_skilltime;
//_healed = (_healed / 100);
if(!([false,"bandage",1] call life_fnc_handleInv) && !(playerSide isEqualTo independent)) exitWith {["Keine Bandagen","Du hast keine Bandagen!", true, "fast"] spawn ESG_fnc_notify;};
closeDialog 0;
life_action_inUse = true;
_toR = 0.2;
if(playerside isEqualTo independent) then {
	_toR = 0.8;
};
if (local _target) then {
	player playmove "ainvpknlmstpslaywrfldnon_medic";
	sleep 8;
	{
		_tmp = player getHit _x;

		if((_tmp - _toR) <= 0) then {
			player setHit [_x, 0];
		} else {
			player setHit [_x, (_tmp - _toR)];
		};
	}foreach (ESG_medicSelected select 1);
	//_target setdamage (_dmg - _healed);
	["Geheilt",format ["Du hast erfolgreich den Bereich %1 geheilt.", (ESG_medicSelected select 0)], false, "fast"] spawn ESG_fnc_notify;
} else {
	player playmove "ainvpknlmstpslaywrfldnon_medicother";
	sleep 8;
	[(ESG_medicSelected select 1),_toR] remoteExec ["ESG_fnc_hitter", _target];
	//_target setdamage (_dmg - _healed);
	["Geheilt",format ["Du hast erfolgreich den Bereich %1 geheilt.", (ESG_medicSelected select 0)], false, "fast"] spawn ESG_fnc_notify;
};
//["heal",1] call ESG_fnc_skilladd;
life_action_inUse = false;
call life_fnc_hudUpdate;