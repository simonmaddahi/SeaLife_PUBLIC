#include "..\..\script_macros.hpp"
/*
    File: fn_tazed.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Starts the tazed animation and broadcasts out what it needs to.
*/
private ["_curWep","_curMags","_attach"];
params [
    ["_unit",objNull,[objNull]],
    ["_shooter",objNull,[objNull]]
];

if (isNull _unit || isNull _shooter) exitWith {player allowDamage true; player setVariable ["istazed",false,true];};

if (_shooter isKindOf "Man" && alive player) then {
    if (!(player getVariable ["istazed",false])) then {
        player setVariable ["istazed",true,true];
		
		"dynamicBlur" ppEffectEnable true;
		"dynamicBlur" ppEffectAdjust [3];
		"dynamicBlur" ppEffectCommit 2;
		enableCamShake true;
		addCamShake [10, 12, 16];
		
		[_unit] remoteExecCall ["life_fnc_tazeSound",RCLIENT];
		/*
        []spawn {
			_ragdoll = "Land_Can_V1_F" createVehicleLocal [0,0,0];
			_ragdoll setMass 1e10;
			_ragdoll attachTo [player, [0,0,0], "Spine3"];
			_ragdoll setVelocity [0,1,-6];
			player allowDamage false;
			detach _ragdoll;
			0 = _ragdoll spawn 
			{
				deleteVehicle _this;
				player allowDamage true;
			};
		};*/
		_unit setUnconscious true;
        [0,"STR_NOTF_Tazed",true,[profileName, _shooter getVariable ["realname",name _shooter]]] remoteExecCall ["life_fnc_broadcast",RCLIENT];
        //disableUserInput true;
        sleep 15;
		_unit setUnconscious false;
		sleep 1;
        [_unit,"AmovPpneMstpSrasWrflDnon"] remoteExecCall ["life_fnc_animSync",-2];

        if (!(player getVariable ["Escorting",false])) then {
            detach _unit;
        };
        _unit setVariable ["istazed",false,true];
        _unit allowDamage true;
        //disableUserInput false;
		"dynamicBlur" ppEffectEnable true;
		"dynamicBlur" ppEffectAdjust [0];
		"dynamicBlur" ppEffectCommit 2;
		resetCamShake;
    };
} else {
    _unit allowDamage true;
    player setVariable ["istazed",false,true];
};
