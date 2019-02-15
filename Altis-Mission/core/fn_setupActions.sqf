/*
    File: fn_setupActions.sqf
    Author:

    Description:
    Master addAction file handler for all client-based actions.
*/
//Für alle Fraktionen
life_actions pushBack (player addAction["<t color='#0099FF'>Hinsetzen</t>",{[cursorObject,player] spawn ESG_fnc_hinsetzen;},true,1,true,true,"""",'player distance cursorObject < 3 && {(["bench",str cursorObject]call bis_fnc_instring || ["chair",str cursorObject]call bis_fnc_instring)} ']);
life_actions pushback (player addAction ["Leiche ausrauben",{_m = cursorObject getVariable ["ESG_DeadGeld",0]; if(_m <= 0) then {["Ausrauben", "Die Leiche hat kein Geld dabei!", true, "fast"] spawn ESG_fnc_notify;}else{["Ausrauben", format ["Die Leiche hat %1$ dabei.",_m], false, "fast"] spawn ESG_fnc_notify; life_cash = life_cash + _m; cursorObject setvariable["ESG_DeadGeld",0,true];};},true,1,true,true,"""",'player distance cursorObject < 3 && !(alive cursorObject) && cursorTarget iskindof "Man"']);
//life_actions pushback (player addAction ["Bandagieren",{[player,playerSide]spawn ESG_fnc_bandage;},nil,50,TRUE,TRUE,'','!life_action_inUse && (getdammage player) > 0 && life_inv_bandage > 0 && (vehicle player isEqualTo player)',2,FALSE]);
switch (playerSide) do {
    case civilian: {
        //Drop fishing net
        life_actions pushback (player addAction[localize "STR_pAct_DropFishingNet",life_fnc_dropFishingNet,"",0,false,false,"",'
        (surfaceisWater (getPos vehicle player)) && (vehicle player isKindOf "Ship") && life_carryWeight < life_maxWeight && speed (vehicle player) < 2 && speed (vehicle player) > -1 && !life_net_dropped ']);
        //Rob person
        life_actions pushback (player addAction[localize "STR_pAct_RobPerson",life_fnc_robAction,"",0,false,false,"",'
       	!isNull cursorObject && player distance cursorObject < 3.5 && isPlayer cursorObject && lifeState cursorObject isEqualTo "INCAPACITATED" && !(cursorObject getVariable ["robbed",false]) ']);
		life_actions pushBack (player addAction["<t color = '#D660D6'>Anschnallgurt anlegen</t>",life_fnc_seatbelt,"",7,false,false,"",' !life_seatbelt && vehicle player != player ']);
		life_actions pushBack (player addAction["<t color = '#D660D6'>Anschnallgurt entfernen</t>",life_fnc_seatbelt,"",7,false,false,"",' life_seatbelt && vehicle player != player ']);
		//CaptureHideout
		life_actions = life_actions + [player addAction["<t color='#FF0000'>Einnehmen</t>",life_fnc_areaCapture,"",0,false,false,"",' ((typeOf cursorTarget) == "Flag_Red_F") ']];
   };
	
	case west: {
		life_actions pushback (player addAction["Boden entfernen",{{deleteVehicle _x;}foreach (nearestObjects [player,["weaponholder"],3]); titleText["Gegenstände wurden beschlagnahmt!","PLAIN DOWN"]},"",0,false,false,"",'count(nearestObjects [player,["weaponholder"],3])>0']);
		life_actions pushBack (player addAction["<t color = '#D660D6'>Anschnallgurt anlegen</t>",life_fnc_seatbelt,"",7,false,false,"",' !life_seatbelt && vehicle player != player ']);
		life_actions pushBack (player addAction["<t color = '#D660D6'>Anschnallgurt entfernen</t>",life_fnc_seatbelt,"",7,false,false,"",' life_seatbelt && vehicle player != player ']);
		//renew hideout
		life_actions = life_actions + [player addAction["<t color='#FF0000'>Capture Gang Location</t>",life_fnc_areaCapture,"",0,false,false,"",' ((typeOf cursorTarget) == "Flag_Red_F") ']];
	};
	
	case independent: {
		life_actions pushback(player addAction["Boden entfernen",{{deleteVehicle _x;}foreach (nearestObjects [player,["weaponholder"],3]); titleText["Gegenstände wurden beschlagnahmt!","PLAIN DOWN"]},"",0,false,false,"",'count(nearestObjects [player,["weaponholder"],3])>0']);
		life_actions pushBack (player addAction["<t color = '#D660D6'>Anschnallgurt anlegen</t>",life_fnc_seatbelt,"",7,false,false,"",' !life_seatbelt && vehicle player != player ']);
		life_actions pushBack (player addAction["<t color = '#D660D6'>Anschnallgurt entfernen</t>",life_fnc_seatbelt,"",7,false,false,"",' life_seatbelt && vehicle player != player ']);
	};
	
	case east: {
		life_actions pushback(player addAction["Boden entfernen",{{deleteVehicle _x;}foreach (nearestObjects [player,["weaponholder"],3]); titleText["Gegenstände wurden beschlagnahmt!","PLAIN DOWN"]},"",0,false,false,"",'count(nearestObjects [player,["weaponholder"],3])>0']);
		life_actions pushBack (player addAction["<t color = '#D660D6'>Anschnallgurt anlegen</t>",life_fnc_seatbelt,"",7,false,false,"",' !life_seatbelt && vehicle player != player ']);
		life_actions pushBack (player addAction["<t color = '#D660D6'>Anschnallgurt entfernen</t>",life_fnc_seatbelt,"",7,false,false,"",' life_seatbelt && vehicle player != player ']);
	};
};
