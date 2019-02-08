/*
    Ausweis Recall
*/
closedialog 0;
ESG_ausweis = _this select 0;
if(ESG_ausweis isEqualTo [])exitWith{endmission "";};
if (life_firstspawn) then {
	call life_fnc_spawnMenu;
} else {
	["Ausweis geändert","Du hast erfolgreich deinen Ausweis geändert.", false, "fast"] spawn ESG_fnc_notify;
	if(name player != ESG_ausweis select 0) exitWith {endmission "Namechange"};
};
