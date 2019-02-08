class Life_My_Gang_Diag {
    idd = 2620;
    name= "life_my_gang_menu";
    movingEnable = 0;
    enableSimulation = 1;

    class controlsBackground {
		class bg: life_RscPicture
		{
			idc = -1;
			text = "texture\misc\bg_menu.paa";
			x = 0.17 * safezoneW + safezoneX;
			y = 0.115 * safezoneH + safezoneY;
			w = 0.665156 * safezoneW;
			h = 0.693 * safezoneH;
		};
        class title: Life_RscStructuredText
        {
        	idc = -1;
        	text = "<t align='right' font='PuristaBold' size='1.5'>Gangübersicht // Gangverwaltung</t>"; //--- ToDo: Localize;
        	x = 0.453594 * safezoneW + safezoneX;
        	y = 0.126 * safezoneH + safezoneY;
        	w = 0.154687 * safezoneW;
        	h = 0.033 * safezoneH;
        	colorBackground[] = {-1,-1,-1,0};
        };
		class head_ranks: life_RscText
		{
			idc = -1;
			text = "Rangverwaltung"; //--- ToDo: Localize;
			x = 0.175156 * safezoneW + safezoneX;
			y = 0.2096 * safezoneH + safezoneY;
			w = 0.211406 * safezoneW;
			h = 0.033 * safezoneH;
			colorBackground[] = {-1,-1,-1,0.7};
		};
		class head_member: life_RscText
		{
			idc = -1;
			text = "Mitgliedverwaltung"; //--- ToDo: Localize;
			x = 0.618594 * safezoneW + safezoneX;
			y = 0.2096 * safezoneH + safezoneY;
			w = 0.211406 * safezoneW;
			h = 0.033 * safezoneH;
			colorBackground[] = {-1,-1,-1,0.7};
		};
		class head_actions: life_RscText
		{
			idc = -1;
			text = "Gruppierungsverwaltung"; //--- ToDo: Localize;
			x = 0.396875 * safezoneW + safezoneX;
			y = 0.2096 * safezoneH + safezoneY;
			w = 0.211406 * safezoneW;
			h = 0.033 * safezoneH;
			colorBackground[] = {-1,-1,-1,0.7};
		};
		class head_invite: life_RscText
		{
			idc = -1;
			text = "Person in Gruppierung einladen"; //--- ToDo: Localize;
			x = 0.396875 * safezoneW + safezoneX;
			y = 0.544 * safezoneH + safezoneY;
			w = 0.211406 * safezoneW;
			h = 0.033 * safezoneH;
			colorBackground[] = {-1,-1,-1,0.7};
		};
	};

	class controls {
		class list_ranks: life_RscListbox
		{
			idc = 1500;
			text = "";
			x = 0.175156 * safezoneW + safezoneX;
			y = 0.247 * safezoneH + safezoneY;
			w = 0.211406 * safezoneW;
			h = 0.33 * safezoneH;
          	sizeEx = 0.032;
		};
		class list_member: life_RscListbox
		{
			idc = 1501;
			text = "";
			x = 0.618594 * safezoneW + safezoneX;
			y = 0.247 * safezoneH + safezoneY;
			w = 0.211406 * safezoneW;
			h = 0.33 * safezoneH;
          	sizeEx = 0.032;
		};
		class btn_createnew: life_RscButtonMenu
		{
			idc = 2400;
			text = "Ränge bearbeiten"; //--- ToDo: Localize;
			x = 0.175156 * safezoneW + safezoneX;
			y = 0.588 * safezoneH + safezoneY;
			w = 0.211406 * safezoneW;
			h = 0.033 * safezoneH;
			onButtonClick = "closeDialog 0; [0] call life_fnc_gangRanksMenu;";
        	colorBackground[] = {0.149,0.149,0.149,1};
			class Attributes {
	            font = "PuristaBold";
	            align = "center";
	        };
		};
		class btn_edit_rank_right: life_RscButtonMenu
		{
			idc = 2402;
			text = "Ausgewählten Rang löschen"; //--- ToDo: Localize;
			x = 0.175156 * safezoneW + safezoneX;
			y = 0.632 * safezoneH + safezoneY;
			w = 0.211406 * safezoneW;
			h = 0.033 * safezoneH;
			onButtonClick = "[1] call life_fnc_handleDBGang";
        	colorBackground[] = {0.149,0.149,0.149,1};
			class Attributes {
	            font = "PuristaBold";
	            align = "center";
	        };
		};
		class btn_leavegang: life_RscButtonMenu
		{
			idc = 2403;
			text = "Gruppierung verlassen"; //--- ToDo: Localize;
			x = 0.396875 * safezoneW + safezoneX;
			y = 0.258 * safezoneH + safezoneY;
			w = 0.211406 * safezoneW;
			h = 0.044 * safezoneH;
			onButtonClick = "call life_fnc_gangLeave";
        	colorBackground[] = {0.149,0.149,0.149,1};
			class Attributes {
	            font = "PuristaBold";
	            align = "center";
	        };
		};
		class btn_expandgang: life_RscButtonMenu
		{
			idc = 2404;
			text = "Gruppierung erweitern"; //--- ToDo: Localize;
			x = 0.396875 * safezoneW + safezoneX;
			y = 0.313 * safezoneH + safezoneY;
			w = 0.211406 * safezoneW;
			h = 0.044 * safezoneH;
			onButtonClick = "closeDialog 0; 0 spawn life_fnc_gangUpgrade;";
        	colorBackground[] = {0.149,0.149,0.149,1};
			class Attributes {
	            font = "PuristaBold";
	            align = "center";
	        };
		};
		class btn_gangkonto: life_RscButtonMenu
		{
			idc = 2405;
			text = "Gruppierungs-Konto"; //--- ToDo: Localize;
			x = 0.396875 * safezoneW + safezoneX;
			y = 0.368 * safezoneH + safezoneY;
			w = 0.211406 * safezoneW;
			h = 0.044 * safezoneH;
			onButtonClick = "hint 'Dieses Feature wird noch implementiert!"; //[] call life_fnc_gangKontoMenu
        	colorBackground[] = {0.149,0.149,0.149,1};
			class Attributes {
	            font = "PuristaBold";
	            align = "center";
	        };
		};
		class btn_manageganghouse: life_RscButtonMenu
		{
			idc = 2406;
			text = "Gruppierungshaus verwalten"; //--- ToDo: Localize;
			x = 0.396875 * safezoneW + safezoneX;
			y = 0.423 * safezoneH + safezoneY;
			w = 0.211406 * safezoneW;
			h = 0.044 * safezoneH;
			onButtonClick = "call life_fnc_gangHouseMenu";
        	colorBackground[] = {0.149,0.149,0.149,1};
			class Attributes {
	            font = "PuristaBold";
	            align = "center";
	        };
		};
		class btn_deletegang: life_RscButtonMenu
		{
			idc = 2407;
			text = "Gruppierung auflösen (Löschen)"; //--- ToDo: Localize;
			x = 0.396875 * safezoneW + safezoneX;
			y = 0.478 * safezoneH + safezoneY;
			w = 0.211406 * safezoneW;
			h = 0.044 * safezoneH;
			onButtonClick = "0 spawn life_fnc_gangDisband";
        	colorBackground[] = {0.149,0.149,0.149,1};
			class Attributes {
	            font = "PuristaBold";
	            align = "center";
	        };
		};
		class edit_searchplayer: life_RscEdit
		{
			idc = 1400;
			text = "";
			onKeyUp = "if(ctrlText 1400 != """") then {[2620, 1502, (ctrlText 1400),'!(_x in (units group player)) && (side _x isEqualTo civilian) && isNil {(group _x) getVariable ""gang_id""}']call ESG_fnc_searchPlayers;} else {call life_fnc_gangMenu}";
			x = 0.396875 * safezoneW + safezoneX;
			y = 0.588 * safezoneH + safezoneY;
			w = 0.211406 * safezoneW;
			h = 0.022 * safezoneH;
			tooltip = "Nach Person suchen"; //--- ToDo: Localize;
		};
		class list_players: life_RscListbox
		{
			idc = 1502;
			text = "";
			x = 0.396875 * safezoneW + safezoneX;
			y = 0.621 * safezoneH + safezoneY;
			w = 0.211406 * safezoneW;
			h = 0.11 * safezoneH;
          	sizeEx = 0.032;
		};
		class btn_inviteplayer: life_RscButtonMenu
		{
			idc = 2408;
			text = "Person in Gruppierung einladen"; //--- ToDo: Localize;
			x = 0.396875 * safezoneW + safezoneX;
			y = 0.742 * safezoneH + safezoneY;
			w = 0.211406 * safezoneW;
			h = 0.044 * safezoneH;
			onButtonClick = "0 spawn life_fnc_gangInvitePlayer";
        	colorBackground[] = {0.149,0.149,0.149,1};
			class Attributes {
	            font = "PuristaBold";
	            align = "center";
	        };
		};
		class btn_kickmember: life_RscButtonMenu
		{
			idc = 2409;
			text = "Mitglied rauswerfen"; //--- ToDo: Localize;
			x = 0.618594 * safezoneW + safezoneX;
			y = 0.588 * safezoneH + safezoneY;
			w = 0.211406 * safezoneW;
			h = 0.033 * safezoneH;
			onButtonClick = "call life_fnc_gangKick";
        	colorBackground[] = {0.149,0.149,0.149,1};
			class Attributes {
	            font = "PuristaBold";
	            align = "center";
	        };
		};
		class btn_applymemberrank: life_RscButtonMenu
		{
			idc = 2410;
			text = "Mitglied einen Rang zuweisen"; //--- ToDo: Localize;
			x = 0.618594 * safezoneW + safezoneX;
			y = 0.632 * safezoneH + safezoneY;
			w = 0.211406 * safezoneW;
			h = 0.033 * safezoneH;
			onButtonClick = "[0] call life_fnc_handleDBGang";
        	colorBackground[] = {0.149,0.149,0.149,1};
			class Attributes {
	            font = "PuristaBold";
	            align = "center";
	        };
		};
		class btn_newleader: life_RscButtonMenu
		{
			idc = 2411;
			text = "Mitglied als neuen Chef bestimmen"; //--- ToDo: Localize;
			x = 0.618594 * safezoneW + safezoneX;
			y = 0.676 * safezoneH + safezoneY;
			w = 0.211406 * safezoneW;
			h = 0.033 * safezoneH;
			onButtonClick = "0 spawn life_fnc_gangNewLeader";
        	colorBackground[] = {0.149,0.149,0.149,1};
			class Attributes {
	            font = "PuristaBold";
	            align = "center";
	        };
		};
	    class btn_close: Life_RscButtonMenu
	    {
	      idc = -1;
	      text = "Schliessen"; //--- ToDo: Localize;
	      x = 0.190625 * safezoneW + safezoneX;
	      y = 0.742 * safezoneH + safezoneY;
	      w = 0.0876563 * safezoneW;
	      h = 0.033 * safezoneH;
	      colorBackground[] = {0.149,0.149,0.149,1};
	      onButtonClick = "closeDialog 0;";
	    };
	};
};


class Life_Create_Gang_Diag {
    idd = 2520;
    name= "life_my_gang_menu_create";
    movingEnable = 0;
    enableSimulation = 1;

    class controlsBackground {
		class bg: life_RscPicture
		{
			idc = -1;
			text = "texture\misc\bg_menu.paa";
			x = 0.17 * safezoneW + safezoneX;
			y = 0.115 * safezoneH + safezoneY;
			w = 0.665156 * safezoneW;
			h = 0.693 * safezoneH;
		};

        class title: Life_RscStructuredText
        {
        	idc = -1;
        	text = "<t align='right' font='PuristaBold' size='1.5'>Ganggründung</t>"; //--- ToDo: Localize;
        	x = 0.453594 * safezoneW + safezoneX;
        	y = 0.126 * safezoneH + safezoneY;
        	w = 0.154687 * safezoneW;
        	h = 0.033 * safezoneH;
        	colorBackground[] = {-1,-1,-1,0};
        };
		class struc_info: life_RscStructuredText
		{
			idc = -1;
			text = "<t font='PuristaBold' size='1.5' align='center'>Eine Gangerstellung kostet 150.000$<br/>Dabei erstellst du eine permanente Gang, welche einen eigenen Namen hat und ein eigenes Tag. Dein Tag wird auch für andere Spieler angezeigt und kann nicht geändert werden!</t>";
			x = 0.175156 * safezoneW + safezoneX;
			y = 0.203 * safezoneH + safezoneY;
			w = 0.654844 * safezoneW;
			h = 0.165 * safezoneH;
		};
		class struc_name: life_RscStructuredText
		{
			idc = -1;
			text = "<t font='PuristaBold' align='center'>Name deiner Gang</t>";
			x = 0.365937 * safezoneW + safezoneX;
			y = 0.379 * safezoneH + safezoneY;
			w = 0.268125 * safezoneW;
			h = 0.044 * safezoneH;
		};
		class struc_tag: life_RscStructuredText
		{
			idc = -1;
			text = "<t font='PuristaBold' align='center'>Gangtag deiner Gang (Ohne Klammern und nur Buchstaben)</t>";
			x = 0.365937 * safezoneW + safezoneX;
			y = 0.5 * safezoneH + safezoneY;
			w = 0.268125 * safezoneW;
			h = 0.044 * safezoneH;
		};
	};

	class controls {
	    class btn_close: Life_RscButtonMenu
	    {
	      idc = -1;
	      text = "Schliessen"; //--- ToDo: Localize;
	      x = 0.190625 * safezoneW + safezoneX;
	      y = 0.742 * safezoneH + safezoneY;
	      w = 0.0876563 * safezoneW;
	      h = 0.033 * safezoneH;
	      colorBackground[] = {0.149,0.149,0.149,1};
	      onButtonClick = "closeDialog 0;";
	    };
		class edit_tag: life_RscEdit
		{
			idc = 1401;
			text = "";
			x = 0.371094 * safezoneW + safezoneX;
			y = 0.555 * safezoneH + safezoneY;
			w = 0.257813 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class btn_submit: life_RscButtonMenu
		{
			idc = 2400;
			text = "Neue Gruppierung erstellen"; //--- ToDo: Localize;
			x = 0.407187 * safezoneW + safezoneX;
			y = 0.621 * safezoneH + safezoneY;
			w = 0.170156 * safezoneW;
			h = 0.044 * safezoneH;
        	colorBackground[] = {0.149,0.149,0.149,1};
			onButtonClick = "call life_fnc_createGang";
			class Attributes {
	            font = "PuristaBold";
	            align = "center";
	        };
		};
		class edit_name: life_RscEdit
		{
			idc = 2522;
			text = "";
			x = 0.371094 * safezoneW + safezoneX;
			y = 0.434 * safezoneH + safezoneY;
			w = 0.257813 * safezoneW;
			h = 0.022 * safezoneH;
		};
	};
};

class ZB_Gangkonto {
    idd = 262026;
    name= "ZB_Gangkonto";
    movingEnable = 0;
    enableSimulation = 1;
    onUnLoad = "group player setVariable [""gang_bankInUse"", false, true];";

    class controlsBackground {
		class bg_main: life_RscPicture
		{
			idc = -1;
			text = "texture\misc\bg_menu.paa";
			x = 0.17 * safezoneW + safezoneX;
			y = 0.115 * safezoneH + safezoneY;
			w = 0.665156 * safezoneW;
			h = 0.693 * safezoneH;
		};
		class struc_kontoinfo: life_RscStructuredText
		{
			idc = -1;
			text = "<t font='PuristaBold' size='1.5' align='center'>Aktueller Kontostand der Gruppierung</t>"; //--- ToDo: Localize;
			x = 0.17 * safezoneW + safezoneX;
			y = 0.225 * safezoneH + safezoneY;
			w = 0.665156 * safezoneW;
			h = 0.066 * safezoneH;
		};

        class title: Life_RscStructuredText
        {
        	idc = -1;
        	text = "<t align='right' font='PuristaBold' size='1.5'>Gangkonto-Verwaltung</t>"; //--- ToDo: Localize;
        	x = 0.453594 * safezoneW + safezoneX;
        	y = 0.126 * safezoneH + safezoneY;
        	w = 0.154687 * safezoneW;
        	h = 0.033 * safezoneH;
        	colorBackground[] = {-1,-1,-1,0};
        };
		class trenner: life_RscText
		{
			idc = -1;
			x = 0.494844 * safezoneW + safezoneX;
			y = 0.379 * safezoneH + safezoneY;
			w = 0.004125 * safezoneW;
			h = 0.374 * safezoneH;
			colorBackground[] = {0.718,0.118,0.118,1};
		};
	};

	class controls {
	    class btn_close: Life_RscButtonMenu
	    {
	      idc = -1;
	      text = "Schliessen"; //--- ToDo: Localize;
	      x = 0.190625 * safezoneW + safezoneX;
	      y = 0.742 * safezoneH + safezoneY;
	      w = 0.0876563 * safezoneW;
	      h = 0.033 * safezoneH;
	      colorBackground[] = {0.149,0.149,0.149,1};
	      onButtonClick = "closeDialog 0;";
	    };
		class struc_kontostand: life_RscStructuredText
		{
			idc = 1101;
			text = "502.251.934$"; //--- ToDo: Localize;
			x = 0.17 * safezoneW + safezoneX;
			y = 0.291 * safezoneH + safezoneY;
			w = 0.665156 * safezoneW;
			h = 0.066 * safezoneH;
		};
		class edit_money: life_RscEdit
		{
			idc = 3425;
			text = "";
			x = 0.374844 * safezoneW + safezoneX;
			y = 0.325 * safezoneH + safezoneY;
			w = 0.224125 * safezoneW;
			h = 0.022 * safezoneH;
			tooltip = "Betrag hier eingeben";
		};
		class struc_playerkonto: life_RscStructuredText
		{
			idc = 1102;
			text = "502.251.934$"; //--- ToDo: Localize;
			x = 0.221562 * safezoneW + safezoneX;
			y = 0.401 * safezoneH + safezoneY;
			w = 0.221719 * safezoneW;
			h = 0.099 * safezoneH;
		};
		class btn_einzahlen: life_RscButtonMenu
		{
			idc = 2400;
			text = "Auf das Gangkonto überweisen"; //--- ToDo: Localize;
			x = 0.221562 * safezoneW + safezoneX;
			y = 0.511 * safezoneH + safezoneY;
			w = 0.221719 * safezoneW;
			h = 0.044 * safezoneH;
			//onButtonClick = "call life_fnc_createGang";
        	colorBackground[] = {0.149,0.149,0.149,1};
			class Attributes {
	            font = "PuristaBold";
	            align = "center";
	        };
		};
		class btn_abheben: life_RscButtonMenu
		{
			idc = 2401;
			text = "Vom Gangkonto abheben"; //--- ToDo: Localize;
			x = 0.221562 * safezoneW + safezoneX;
			y = 0.566 * safezoneH + safezoneY;
			w = 0.221719 * safezoneW;
			h = 0.044 * safezoneH;
        	colorBackground[] = {0.149,0.149,0.149,1};
			class Attributes {
	            font = "PuristaBold";
	            align = "center";
	        };
		};
		class list_members: life_RscListbox
		{
			idc = 1500;
			text = "";
			x = 0.520625 * safezoneW + safezoneX;
			y = 0.401 * safezoneH + safezoneY;
			w = 0.283594 * safezoneW;
			h = 0.22 * safezoneH;
          	sizeEx = 0.032;
		};
		class btn_moneytomember: life_RscButtonMenu
		{
			idc = 2402;
			text = "Zum Mitglied überweisen"; //--- ToDo: Localize;
			x = 0.551562 * safezoneW + safezoneX;
			y = 0.632 * safezoneH + safezoneY;
			w = 0.221719 * safezoneW;
			h = 0.044 * safezoneH;
        	colorBackground[] = {0.149,0.149,0.149,1};
			class Attributes {
	            font = "PuristaBold";
	            align = "center";
	        };
		};
	};
};

class ZB_Ganghaus {
    idd = 262022;
    name= "ZB_Ganghaus";
    movingEnable = 0;
    enableSimulation = 1;

    class controlsBackground {
		class bg_main: life_RscPicture
		{
			idc = -1;
			text = "texture\misc\bg_menu.paa";
			x = 0.17 * safezoneW + safezoneX;
			y = 0.115 * safezoneH + safezoneY;
			w = 0.665156 * safezoneW;
			h = 0.693 * safezoneH;
		};

        class title: Life_RscStructuredText
        {
        	idc = -1;
        	text = "<t align='right' font='PuristaBold' size='1.5'>Ganghaus-Verwaltung</t>"; //--- ToDo: Localize;
        	x = 0.453594 * safezoneW + safezoneX;
        	y = 0.126 * safezoneH + safezoneY;
        	w = 0.154687 * safezoneW;
        	h = 0.033 * safezoneH;
        	colorBackground[] = {-1,-1,-1,0};
        };
	};

	class controls {
	    class btn_close: Life_RscButtonMenu
	    {
	      idc = -1;
	      text = "Schliessen"; //--- ToDo: Localize;
	      x = 0.190625 * safezoneW + safezoneX;
	      y = 0.742 * safezoneH + safezoneY;
	      w = 0.0876563 * safezoneW;
	      h = 0.033 * safezoneH;
	      colorBackground[] = {0.149,0.149,0.149,1};
	      onButtonClick = "closeDialog 0;";
	    };
		class mapcontrol: Life_RscMapControl
		{
			idc = 2400;
			x = 0.510312 * safezoneW + safezoneX;
			y = 0.225 * safezoneH + safezoneY;
			w = 0.299062 * safezoneW;
			h = 0.363 * safezoneH;
	        maxSatelliteAlpha = 0.75;//0.75;
	        alphaFadeStartScale = 1.15;//0.15;
	        alphaFadeEndScale = 1.29;//0.29;
		};
		class btn_matesficken: life_RscButtonMenu
		{
			idc = 2401;
			text = "Haustürschlüssel einziehen"; //--- ToDo: Localize;
			x = 0.510312 * safezoneW + safezoneX;
			y = 0.599 * safezoneH + safezoneY;
			w = 0.299062 * safezoneW;
			h = 0.055 * safezoneH;
        	colorBackground[] = {0.149,0.149,0.149,1};
			class Attributes {
	            font = "PuristaBold";
	            align = "center";
	        };
		};
		class struc_overview: life_RscStructuredText
		{
			idc = 2402;
			text = "";
			x = 0.190625 * safezoneW + safezoneX;
			y = 0.225 * safezoneH + safezoneY;
			w = 0.293906 * safezoneW;
			h = 0.187 * safezoneH;
			colorBackground[] = { -1, -1, -1, 0.7 };
		};
		class btn_sellhouse: life_RscButtonMenu
		{
			idc = 2403;
			text = "Ganghaus verkaufen"; //--- ToDo: Localize;
			x = 0.190625 * safezoneW + safezoneX;
			y = 0.423 * safezoneH + safezoneY;
			w = 0.293906 * safezoneW;
			h = 0.055 * safezoneH;
        	colorBackground[] = {0.149,0.149,0.149,1};
			class Attributes {
	            font = "PuristaBold";
	            align = "center";
	        };
		};
		class btn_addsecurity: life_RscButtonMenu
		{
			idc = 2404;
			text = "Sicherheitssysteme installieren"; //--- ToDo: Localize;
			x = 0.190625 * safezoneW + safezoneX;
			y = 0.5 * safezoneH + safezoneY;
			w = 0.293906 * safezoneW;
			h = 0.055 * safezoneH;
        	colorBackground[] = {0.149,0.149,0.149,1};
        	onButtonClick = "hint 'Dieses Feature wird später implementiert!";
			class Attributes {
	            font = "PuristaBold";
	            align = "center";
	        };
		};
	};
};

class ZB_Gangranks {
    idd = 262025;
    name= "ZB_Gangranks";
    movingEnable = 0;
    enableSimulation = 1;

    class controlsBackground {
		class bg_main: life_RscPicture
		{
			idc = -1;
			text = "texture\misc\bg_menu.paa";
			x = 0.17 * safezoneW + safezoneX;
			y = 0.115 * safezoneH + safezoneY;
			w = 0.665156 * safezoneW;
			h = 0.693 * safezoneH;
		};
		class header_ranks: life_RscText
		{
			idc = -1;
			text = "Rangübersicht"; //--- ToDo: Localize;
			x = 0.180312 * safezoneW + safezoneX;
			y = 0.225 * safezoneH + safezoneY;
			w = 0.211406 * safezoneW;
			h = 0.033 * safezoneH;
			colorBackground[] = {-1,-1,-1,0.7};
		};
		class header_rechteverwaltung: life_RscText
		{
			idc = -1;
			text = "Rechteverwaltung"; //--- ToDo: Localize;
			x = 0.407187 * safezoneW + safezoneX;
			y = 0.225 * safezoneH + safezoneY;
			w = 0.149531 * safezoneW;
			h = 0.033 * safezoneH;
			colorBackground[] = {-1,-1,-1,0.7};
		};

        class title: Life_RscStructuredText
        {
        	idc = -1;
        	text = "<t align='right' font='PuristaBold' size='1.5'>Gangränge-Verwalten</t>"; //--- ToDo: Localize;
        	x = 0.453594 * safezoneW + safezoneX;
        	y = 0.126 * safezoneH + safezoneY;
        	w = 0.154687 * safezoneW;
        	h = 0.033 * safezoneH;
        	colorBackground[] = {-1,-1,-1,0};
        };
		class title_1: life_RscText
		{
			idc = -1;
			text = "Gruppenränge erstellen und bearbeiten"; //--- ToDo: Localize;
			x = 0.422656 * safezoneW + safezoneX;
			y = 0.313 * safezoneH + safezoneY;
			w = 0.397031 * safezoneW;
			h = 0.022 * safezoneH;
		};class title_2: life_RscText
		{
			idc = -1;
			text = "Gruppenränge löschen"; //--- ToDo: Localize;
			x = 0.422656 * safezoneW + safezoneX;
			y = 0.357 * safezoneH + safezoneY;
			w = 0.397031 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class title_3: life_RscText
		{
			idc = -1;
			text = "Gruppenslots erweitern"; //--- ToDo: Localize;
			x = 0.422656 * safezoneW + safezoneX;
			y = 0.401 * safezoneH + safezoneY;
			w = 0.397031 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class title_4: life_RscText
		{
			idc = -1;
			text = "Gangkonto einsehen"; //--- ToDo: Localize;
			x = 0.422656 * safezoneW + safezoneX;
			y = 0.445 * safezoneH + safezoneY;
			w = 0.397031 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class title_5: life_RscText
		{
			idc = -1;
			text = "Geld auf das Gangkonto einzahlen"; //--- ToDo: Localize;
			x = 0.422656 * safezoneW + safezoneX;
			y = 0.489 * safezoneH + safezoneY;
			w = 0.397031 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class title_6: life_RscText
		{
			idc = -1;
			text = "Geld vom Gangkonto an Gruppenmitglieder überweisen"; //--- ToDo: Localize;
			x = 0.422656 * safezoneW + safezoneX;
			y = 0.533 * safezoneH + safezoneY;
			w = 0.397031 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class title_7: life_RscText
		{
			idc = -1;
			text = "Ganghaus verwalten"; //--- ToDo: Localize;
			x = 0.422656 * safezoneW + safezoneX;
			y = 0.577 * safezoneH + safezoneY;
			w = 0.397031 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class title_8: life_RscText
		{
			idc = -1;
			text = "Neues Ganghaus kaufen"; //--- ToDo: Localize;
			x = 0.422656 * safezoneW + safezoneX;
			y = 0.621 * safezoneH + safezoneY;
			w = 0.397031 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class title_9: life_RscText
		{
			idc = -1;
			text = "Zugriff auf das Ganghaus (Automatische Schlüsselvergabe)"; //--- ToDo: Localize;
			x = 0.422656 * safezoneW + safezoneX;
			y = 0.665 * safezoneH + safezoneY;
			w = 0.397031 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class title_10: life_RscText
		{
			idc = -1;
			text = "Spieler in die Gruppierung einladen"; //--- ToDo: Localize;
			x = 0.422656 * safezoneW + safezoneX;
			y = 0.709 * safezoneH + safezoneY;
			w = 0.397031 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class title_11: life_RscText
		{
			idc = -1;
			text = "Mitglieder aus der Gruppierung rausschmeißen"; //--- ToDo: Localize;
			x = 0.422656 * safezoneW + safezoneX;
			y = 0.753 * safezoneH + safezoneY;
			w = 0.397031 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class title_12: life_RscText
		{
			idc = -1;
			text = "Mitglieder aus der Gruppierung einen Rang zuweisen"; //--- ToDo: Localize;
			x = 0.422656 * safezoneW + safezoneX;
			y = 0.269 * safezoneH + safezoneY;
			w = 0.397031 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class head_name: life_RscText
		{
			idc = -1;
			text = "Rangname:"; //--- ToDo: Localize;
			x = 0.559323 * safezoneW + safezoneX;
			y = 0.224889 * safezoneH + safezoneY;
			w = 0.061875 * safezoneW;
			h = 0.033 * safezoneH;
		};
	};

	class controls {
	    class btn_close: Life_RscButtonMenu
	    {
	      idc = -1;
	      text = "Schliessen"; //--- ToDo: Localize;
	      x = 0.190625 * safezoneW + safezoneX;
	      y = 0.742 * safezoneH + safezoneY;
	      w = 0.0876563 * safezoneW;
	      h = 0.033 * safezoneH;
	      colorBackground[] = {0.149,0.149,0.149,1};
	      onButtonClick = "closeDialog 0;";
	    };
		class list_ranks: life_RscListbox
		{
			idc = 1500;
			text = "";
			x = 0.180312 * safezoneW + safezoneX;
			y = 0.269 * safezoneH + safezoneY;
			w = 0.211406 * safezoneW;
			h = 0.352 * safezoneH;
          	sizeEx = 0.032;
          	onLBSelChanged = "[1] call life_fnc_gangRanksMenu";
		};
		class btn_add: life_RscButtonMenu
		{
			idc = 2400;
			text = "Rang hinzufügen"; //--- ToDo: Localize;
			x = 0.180312 * safezoneW + safezoneX;
			y = 0.632 * safezoneH + safezoneY;
			w = 0.211406 * safezoneW;
			h = 0.033 * safezoneH;
        	colorBackground[] = {0.149,0.149,0.149,1};
			class Attributes {
	            font = "PuristaBold";
	            align = "center";
	        };
		};
		class btn_save: life_RscButtonMenu
		{
			idc = 2401;
			text = "Veränderungen speichern"; //--- ToDo: Localize;
			x = 0.180312 * safezoneW + safezoneX;
			y = 0.676 * safezoneH + safezoneY;
			w = 0.211406 * safezoneW;
			h = 0.033 * safezoneH;
        	colorBackground[] = {0.149,0.149,0.149,1};
			class Attributes {
	            font = "PuristaBold";
	            align = "center";
	        };
		};
		class edit_rankname: life_RscEdit
		{
			idc = 1400;
			text = "";
			x = 0.627837 * safezoneW + safezoneX;
			y = 0.231481 * safezoneH + safezoneY;
			w = 0.190781 * safezoneW;
			h = 0.022 * safezoneH;
			tooltip = "Name des Rangs"; //--- ToDo: Localize;
		};
		class cb_1: Life_Checkbox
		{
			idc = 2800;
			x = 0.404062 * safezoneW + safezoneX;
			y = 0.30837 * safezoneH + safezoneY;
			w = 0.015 * safezoneW;
			h = 0.0294074 * safezoneH;
		};
		class cb_2: Life_Checkbox
		{
			idc = 2801;
			x = 0.404062 * safezoneW + safezoneX;
			y = 0.352777 * safezoneH + safezoneY;
			w = 0.015 * safezoneW;
			h = 0.0294074 * safezoneH;
		};
		class cb_3: Life_Checkbox
		{
			idc = 2802;
			x = 0.404062 * safezoneW + safezoneX;
			y = 0.396645 * safezoneH + safezoneY;
			w = 0.015 * safezoneW;
			h = 0.0294074 * safezoneH;
		};
		class cb_4: Life_Checkbox
		{
			idc = 2803;
			x = 0.404062 * safezoneW + safezoneX;
			y = 0.441667 * safezoneH + safezoneY;
			w = 0.015 * safezoneW;
			h = 0.0294074 * safezoneH;
		};
		class cb_5: Life_Checkbox
		{
			idc = 2804;
			x = 0.404062 * safezoneW + safezoneX;
			y = 0.485296 * safezoneH + safezoneY;
			w = 0.015 * safezoneW;
			h = 0.0294074 * safezoneH;
		};
		class cb_6: Life_Checkbox
		{
			idc = 2805;
			x = 0.404062 * safezoneW + safezoneX;
			y = 0.530555 * safezoneH + safezoneY;
			w = 0.015 * safezoneW;
			h = 0.0294074 * safezoneH;
		};
		class cb_7: Life_Checkbox
		{
			idc = 2806;
			x = 0.404062 * safezoneW + safezoneX;
			y = 0.573148 * safezoneH + safezoneY;
			w = 0.015 * safezoneW;
			h = 0.0294074 * safezoneH;
		};
		class cb_8: Life_Checkbox
		{
			idc = 2807;
			x = 0.404062 * safezoneW + safezoneX;
			y = 0.61574 * safezoneH + safezoneY;
			w = 0.015 * safezoneW;
			h = 0.0294074 * safezoneH;
		};
		class cb_9: Life_Checkbox
		{
			idc = 2808;
			x = 0.404062 * safezoneW + safezoneX;
			y = 0.660185 * safezoneH + safezoneY;
			w = 0.015 * safezoneW;
			h = 0.0294074 * safezoneH;
		};
		class cb_10: Life_Checkbox
		{
			idc = 2809;
			x = 0.404062 * safezoneW + safezoneX;
			y = 0.704629 * safezoneH + safezoneY;
			w = 0.015 * safezoneW;
			h = 0.0294074 * safezoneH;
		};
		class cb_11: Life_Checkbox
		{
			idc = 2810;
			x = 0.404062 * safezoneW + safezoneX;
			y = 0.75 * safezoneH + safezoneY;
			w = 0.015 * safezoneW;
			h = 0.0294074 * safezoneH;
		};
		class cb_12: Life_Checkbox
		{
			idc = 2811;
			x = 0.404062 * safezoneW + safezoneX;
			y = 0.266667 * safezoneH + safezoneY;
			w = 0.015 * safezoneW;
			h = 0.0294074 * safezoneH;
		};
	};
};