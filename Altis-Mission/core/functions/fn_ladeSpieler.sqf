/*
	Created by Basti | John Collins
*/

params [
    ["_mode", 0, [1]],
    ["_title", "", [""]],
    ["_step", 0, [1]],
    ["_max", 1, [1]]
];

disableSerialization;
private _ui = findDisplay 88214;
private _btn = _ui displayCtrl 2400;
private _pic = _ui displayCtrl 1201;
private _progressBar = _ui displayCtrl 1000;
private _titleText = _ui displayCtrl 1001;
private _ctrlgruppe = _ui displayCtrl 121212;

switch (_mode) do {
    case 0: {
        _pic ctrlShow false;
        _btn ctrlEnable false;
        /*
        if ((getplayeruid player) in []) exitWith {
            _btn ctrlEnable true;
            _pic ctrlShow true;
            hint "Willkommen Chef!";
        };
        */
        0 cutFadeOut 9999999;
        0 fadeSound 0.1;
        0 fadeMusic 1;
        showChat false;
        player allowDamage false;
        playMusic "BackgroundTrack02_F"; //LeadTrack01_F_EPA

        _ui displaySetEventHandler["keyDown", "_this call life_fnc_displayHandler"];
        _titleText ctrlSetStructuredText parsetext "<t align='center' font='PuristaSemiBold'>Überprüfe den Client (1/15)</t>";
        _contenttext = '<br/><t font="PuristaBold" align="center">Serverteam</t><br/><t size="1.1" color="#FF0000">Projektleitung:</t><br/>    - FLAKE<br/>    - Melvin<br/><br/><t size="1.1" color="#FF0000">Core-Management:</t><br/>    - Webix <br/>    - XXX <br/><br/><t size="1.1" color="#00AB47">Supportleitung:</t><br/>    - Tim Sturm <br/>    - Mike Armstrong	<br/><br/><t size="1.1" color="#ff00bf">Community-Management:</t><br/>    - RosaChicken | Steve <br/><br/><t size="1.1" color="#0088FF">Entwickler:</t><br/>    - Natic <br/><br/><t font="PuristaBold" align="center">Fraktionsleitungen</t><br/><t size="1.1" color="#0069C4">Polizeidirektor:</t><br/>    - John Riley <br/><br/><t size="1.1" color="#ff2a0a">Branddirektor:</t><br/>    - Dr. Thomas Schneider <br/>    - Dr. Max waldschmidt';
        _ctrlgruppe ctrlSetStructuredText parseText _contenttext;
        _h = ctrlTextHeight _ctrlgruppe;
        _w = ((ctrlPosition _ctrlgruppe) select 2);
        _ctrlgruppe ctrlSetPosition[0, 0, _w, _h];
        _ctrlgruppe ctrlCommit 0;
        _progressBar progressSetPosition 0.01;
    };  

    case 1: {
        if (_step isEqualTo _max) then {
            _progressBar progressSetPosition 1;
            _titleText ctrlSetStructuredText parsetext format ["<t align='center' font='PuristaSemiBold' color='#fff8ff'>Willkommen, %1!</t>", name player];
            _btn ctrlEnable true;
            _pic ctrlShow true;
        } else {
            private _s = _step/_max;
            _progressBar progressSetPosition _s;
            _titleText ctrlSetStructuredText parsetext format["<t align='center' font='PuristaSemiBold'>%1 (%2/%3)</t>", _title, _step, _max];
        };
    };

    case 2: {
        _contenttext = _title;
        _ctrlgruppe ctrlSetStructuredText parseText _contenttext;
        _h = ctrlTextHeight _ctrlgruppe;
        _w = ((ctrlPosition _ctrlgruppe) select 2);
        _ctrlgruppe ctrlSetPosition[0, 0, _w, _h];
        _ctrlgruppe ctrlCommit 0;
    };

    case 3: {
        private _textPlayer = _ui displayCtrl 2402;
        private _textMoney = _ui displayCtrl 2403;
        private _textHours = _ui displayCtrl 2404;
        private _textcars = _ui displayCtrl 2405;

        _textPlayer ctrlSetStructuredText parseText format ["<t font='PuristaSemiBold'>%1</t><t font='PuristaMedium'> Spieler</t>", count allPlayers];
        _textMoney ctrlSetStructuredText parseText format ["<t font='PuristaSemiBold'>%1</t><t font='PuristaMedium'> $</t>", [ZBG_ServerStats select 0]call life_fnc_numberText];
        _textHours ctrlSetStructuredText parseText format ["<t font='PuristaSemiBold'>%1</t><t font='PuristaMedium'> %2</t>", ZBG_ServerStats select 1, ZBG_ServerStats select 2];
        _textcars ctrlSetStructuredText parseText format ["<t font='PuristaSemiBold'>%1</t><t font='PuristaMedium'> KFZ</t>", ZBG_ServerStats select 3];

        if (!((ZBG_ServerStats select 4) isEqualTo "") && !((ZBG_ServerStats select 5) isEqualTo "")) then {
            private _head = _ui displayCtrl 2406;
            _head ctrlSetStructuredText parseText format ["<t font='PuristaBold' size='2.3' underline='true'>%1</t>", ZBG_ServerStats select 4];
            _ctrlgruppe ctrlSetStructuredText parseText (ZBG_ServerStats select 5);
            _h = ctrlTextHeight _ctrlgruppe;
            diag_log format ["%1", _h];
            if (_h < 0.6) then {
                _h = 0.6;
            };
            _w = ((ctrlPosition _ctrlgruppe) select 2);
            _ctrlgruppe ctrlSetPosition[0, 0, _w, _h];
            _ctrlgruppe ctrlCommit 0;
        };
    };

    case 4: {
        _btn ctrlEnable false;
        0 fadeSound 1;
        showChat true;
        player allowDamage true; 
        5 fadeMusic 0.1;
        1 fadeMusic 1;
        closeDialog 0;
        if (playerSide isEqualTo civilian) then {
            if (life_is_alive && !life_is_arrested) then {
                /* Spawn at our last position */
                player setVehiclePosition [life_civ_position, [], 0, "CAN_COLLIDE"];
            } else {
                if (life_is_arrested) then {
                    life_is_arrested = false;
                    [player,true] spawn life_fnc_jail;
                };
            };
            life_is_alive = true;
        };

        if (life_firstSpawn && !life_is_arrested) then {
            call life_fnc_spawnMenu;
            playMusic "";
        };
    };
};