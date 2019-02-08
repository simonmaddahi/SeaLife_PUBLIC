closeDialog 0; 
life_respawned = true; 
[] call life_fnc_spawnMenu;
["Wiederbeleben fehlgeschlagen", format ["<t font='PuristaBold'><t font='PuristaBold' color='#b0000d'>%1</t> hat versucht dich wiederzubelen! Dies hat nicht geklappt und du bist an deinen Wunden verstorben!</t>", _this select 0], false] spawn ESG_fnc_notify;