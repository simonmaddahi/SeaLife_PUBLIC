/*
	Author: Natic
	
	Description: Check it for yourself :)
*/

_mode = _this select 0;
switch(_mode) do {
	case "heroin": {
		"chromAberration" ppEffectEnable true;
		"radialBlur" ppEffectEnable true;
		enableCamShake true;

		//Let's go for 45secs of effetcs
		for "_i" from 0 to 44 do
		{
			"chromAberration" ppEffectAdjust [random 0.25,random 0.25,true];
			"chromAberration" ppEffectCommit 1;   
			"radialBlur" ppEffectAdjust  [random 0.02,random 0.02,0.15,0.15];
			"radialBlur" ppEffectCommit 1;
			addcamShake[random 3, 1, random 3];
			sleep 1;
		};

		//Stop effects
		"chromAberration" ppEffectAdjust [0,0,true];
		"chromAberration" ppEffectCommit 5;
		"radialBlur" ppEffectAdjust  [0,0,0,0];
		"radialBlur" ppEffectCommit 5;
		sleep 6;

		//Deactivate ppEffects
		"chromAberration" ppEffectEnable false;
		"radialBlur" ppEffectEnable false;
		resetCamShake;
	};
	
	case "kokain": {
		//Activate ppEffects we need
		"chromAberration" ppEffectEnable true;
		"radialBlur" ppEffectEnable true;
		enableCamShake true;

		//Let's go for 45secs of effetcs
		for "_i" from 0 to 44 do
		{
			"chromAberration" ppEffectAdjust [random 0.25,random 0.25,true];
			"chromAberration" ppEffectCommit 1;   
			"radialBlur" ppEffectAdjust  [random 0.02,random 0.02,0.15,0.15];
			"radialBlur" ppEffectCommit 1;
			addcamShake[random 3, 1, random 3];
			sleep 1;
		};

		//Stop effects
		"chromAberration" ppEffectAdjust [0,0,true];
		"chromAberration" ppEffectCommit 5;
		"radialBlur" ppEffectAdjust  [0,0,0,0];
		"radialBlur" ppEffectCommit 5;
		sleep 6;

		//Deactivate ppEffects
		"chromAberration" ppEffectEnable false;
		"radialBlur" ppEffectEnable false;
		resetCamShake;
	};
	
	case "cannabis": {
		//Activate ppEffects we need
		"chromAberration" ppEffectEnable true;
		"radialBlur" ppEffectEnable true;
		enableCamShake true;
		_smoke = "SmokeShellYellow" createVehicle position player;
		if (!(isNull objectParent player)) then
			{
				_smoke attachTo [vehicle player, [-0.6,-1,0]];
			}
			else
			{
				_smoke attachTo [player, [0,-0.1,1.5]];
			};
			
		//Let's go for 45secs of effetcs
		for "_i" from 0 to 155 do
		{
			"chromAberration" ppEffectAdjust [random 0.25,random 0.25,true];
			"chromAberration" ppEffectCommit 1;   
			"radialBlur" ppEffectAdjust  [random 0.02,random 0.02,0.15,0.15];
			"radialBlur" ppEffectCommit 1;
			addcamShake[random 3, 1, random 3];
			sleep 1;
		};

		//Stop effects
		"chromAberration" ppEffectAdjust [0,0,true];
		"chromAberration" ppEffectCommit 5;
		"radialBlur" ppEffectAdjust  [0,0,0,0];
		"radialBlur" ppEffectCommit 5;
		sleep 6;

		//Deactivate ppEffects
		"chromAberration" ppEffectEnable false;
		"radialBlur" ppEffectEnable false;
		resetCamShake;
	};
	
	case "lsd": {
		//Activate ppEffects we need
		"chromAberration" ppEffectEnable true;
		"radialBlur" ppEffectEnable true;
		enableCamShake true;

		//Let's go for 45secs of effetcs
		for "_i" from 0 to 44 do
		{
			"chromAberration" ppEffectAdjust [random 0.25,random 0.25,true];
			"chromAberration" ppEffectCommit 1;   
			"radialBlur" ppEffectAdjust  [random 0.02,random 0.02,0.15,0.15];
			"radialBlur" ppEffectCommit 1;
			addcamShake[random 3, 1, random 3];
			sleep 1;
		};

		//Stop effects
		"chromAberration" ppEffectAdjust [0,0,true];
		"chromAberration" ppEffectCommit 5;
		"radialBlur" ppEffectAdjust  [0,0,0,0];
		"radialBlur" ppEffectCommit 5;
		sleep 6;

		//Deactivate ppEffects
		"chromAberration" ppEffectEnable false;
		"radialBlur" ppEffectEnable false;
		resetCamShake;
	};
};
