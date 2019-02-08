_mode = _this select 0;
_evh = _this select 1;

if (_mode isEqualTo 0) then {
	if((currentWeapon (_evh select 0)) isEqualTo "") then {
		ESG_AutoWaffe = "";
	}else {
		ESG_AutoWaffe = currentWeapon (_evh select 0);
	};
} else {
	if(ESG_AutoWaffe isEqualTo "") then {
		life_curWep_h = currentWeapon player;
        player action ["SwitchWeapon", player, player, 100];
        player switchCamera cameraView;
	} else {
		if(ESG_AutoWaffe in [primaryWeapon (_evh select 0),secondaryWeapon (_evh select 0),handgunWeapon (_evh select 0)]) then {
			(_evh select 0) selectWeapon ESG_AutoWaffe;
		};
	};
	player switchMove "";
	//player switchMove "stop";
};