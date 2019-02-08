/*
	Author: Basti | John Collins
*/
params[
	["_sel",[],[[]]],
	["_toR",0,[0]]
];

{
	_tmp = player getHit _x;
	if((_tmp - _toR) <= 0) then {
		player setHit [_x, 0];
	} else {
		player setHit [_x, (_tmp - _toR)];
	};
}foreach _sel;

["Medicsystem","Du wurdest geheilt.", false, "fast"] spawn ESG_fnc_notify;
call life_fnc_hudUpdate;