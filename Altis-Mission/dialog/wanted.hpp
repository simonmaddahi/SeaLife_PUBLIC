class life_wanted_menu {
    idd = 2400;
    name= "life_wanted_menu";
    movingEnable = false;
    enableSimulation = true;
    //onLoad = "[] spawn life_fnc_wantedadd2;";

    class controlsBackground {
        class bg_pic: Life_RscPicture
        {
        	idc = -1;
        	text = "texture\misc\bg_menu.paa";
			x = 0.17 * safezoneW + safezoneX;
			y = 0.115 * safezoneH + safezoneY;
			w = 0.665156 * safezoneW;
			h = 0.693 * safezoneH;
        };
		class title_overview: life_RscStructuredText
		{
			idc = -1;
			text = "<t font='PuristaBold'>Fahndungslisteneinträge</t>"; //--- ToDo: Localize;
			x = 0.175156 * safezoneW + safezoneX;
			y = 0.214 * safezoneH + safezoneY;
			w = 0.175313 * safezoneW;
			h = 0.033 * safezoneH;
		};
		class title_boesewichte: life_RscText
		{
			idc = -1;
			text = "Straftäter"; //--- ToDo: Localize;
			x = 0.185469 * safezoneW + safezoneX;
			y = 0.258 * safezoneH + safezoneY;
			w = 0.268125 * safezoneW;
			h = 0.033 * safezoneH;
			colorBackground[] = {-1,-1,-1,0.7};
		};
		class title_infos: life_RscText
		{
			idc = -1;
			text = "Informationen über den Straftäter"; //--- ToDo: Localize;
			x = 0.546406 * safezoneW + safezoneX;
			y = 0.258 * safezoneH + safezoneY;
			w = 0.268125 * safezoneW;
			h = 0.033 * safezoneH;
			colorBackground[] = {-1,-1,-1,0.7};
		};
		class bg_infos: life_RscText
		{
			idc = -1;
			x = 0.546406 * safezoneW + safezoneX;
			y = 0.302 * safezoneH + safezoneY;
			w = 0.268125 * safezoneW;
			h = 0.22 * safezoneH;
			colorBackground[] = {-1,-1,-1,0.5};
		};
		class title_straf: life_RscStructuredText
		{
			idc = -1;
			text = "<t align='center'>Straftaten</t>"; //--- ToDo: Localize;
			x = 0.546406 * safezoneW + safezoneX;
			y = 0.368 * safezoneH + safezoneY;
			w = 0.268125 * safezoneW;
			h = 0.033 * safezoneH;
		};
		class trenner: life_RscText
		{
			idc = -1;
			x = 0.180312 * safezoneW + safezoneX;
			y = 0.577 * safezoneH + safezoneY;
			w = 0.644531 * safezoneW;
			h = 0.0055 * safezoneH;
			colorBackground[] = {0.718,0.118,0.118,1};
		};
		class title_add: life_RscStructuredText
		{
			idc = -1;
			text = "<t font='PuristaBold'>Fahndungslisteneintrag hinzufügen</t>"; //--- ToDo: Localize;
			x = 0.175156 * safezoneW + safezoneX;
			y = 0.599 * safezoneH + safezoneY;
			w = 0.175313 * safezoneW;
			h = 0.033 * safezoneH;
		};
		class title_players: life_RscText
		{
			idc = -1;
			text = "Personen auf der Insel"; //--- ToDo: Localize;
			x = 0.37625 * safezoneW + safezoneX;
			y = 0.599 * safezoneH + safezoneY;
			w = 0.268125 * safezoneW;
			h = 0.033 * safezoneH;
			colorBackground[] = {-1,-1,-1,0.7};
		};
		class title_search: life_RscText
		{
			idc = -1;
			text = "Nach Person suchen..."; //--- ToDo: Localize;
			x = 0.649531 * safezoneW + safezoneX;
			y = 0.599 * safezoneH + safezoneY;
			w = 0.175313 * safezoneW;
			h = 0.033 * safezoneH;
			colorBackground[] = {-1,-1,-1,0.7};
		};

		class title_addwanted: life_RscText
		{
			idc = -1;
			text = "Verbrechen hinzufügen"; //--- ToDo: Localize;
			x = 0.185469 * safezoneW + safezoneX;
			y = 0.643 * safezoneH + safezoneY;
			w = 0.175313 * safezoneW;
			h = 0.033 * safezoneH;
			colorBackground[] = {-1,-1,-1,0.7};
		};

        class title: Life_RscStructuredText
        {
        	idc = -1;
        	text = "<t align='right' font='PuristaBold' size='1.5'>Fahndungsliste</t>"; //--- ToDo: Localize;
        	x = 0.453594 * safezoneW + safezoneX;
        	y = 0.126 * safezoneH + safezoneY;
        	w = 0.154687 * safezoneW;
        	h = 0.033 * safezoneH;
        	colorBackground[] = {-1,-1,-1,0};
        };
    };

    class controls 
    {
		class list_wanteds: life_RscListbox
		{
			idc = 1500;
	        text = "";
	        sizeEx = 0.035;
			x = 0.185469 * safezoneW + safezoneX;
			y = 0.302 * safezoneH + safezoneY;
			w = 0.268125 * safezoneW;
			h = 0.22 * safezoneH;
          	onLBSelChanged = "0 spawn life_fnc_wantedGrab";
		};
		class list_straftaten: life_RscListbox
		{
			idc = 1501;
	        text = "";
	        sizeEx = 0.035;
			x = 0.546406 * safezoneW + safezoneX;
			y = 0.401 * safezoneH + safezoneY;
			w = 0.268125 * safezoneW;
			h = 0.121 * safezoneH;
		};
		class list_players: life_RscListbox
		{
			idc = 1502;
	        text = "";
	        sizeEx = 0.035;
			x = 0.37625 * safezoneW + safezoneX;
			y = 0.643 * safezoneH + safezoneY;
			w = 0.268125 * safezoneW;
			h = 0.154 * safezoneH;
		};
		class struc_infos: life_RscStructuredText
		{
			idc = 1101;
			text = "";
			x = 0.546406 * safezoneW + safezoneX;
			y = 0.302 * safezoneH + safezoneY;
			w = 0.268125 * safezoneW;
			h = 0.066 * safezoneH;
		};
		class edit_search: life_RscEdit
		{
			idc = 1400;
			text = "";
			onKeyUp = "if(ctrlText 1400 != """") then {[2400, 1502, (ctrlText 1400)] call ESG_fnc_searchPlayers;} else { call life_fnc_wantedMenu;}";
			x = 0.649531 * safezoneW + safezoneX;
			y = 0.643 * safezoneH + safezoneY;
			w = 0.175313 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class edit_eintrag: life_RscEdit
		{
			idc = 1401;
			text = "";
			x = 0.185469 * safezoneW + safezoneX;
			y = 0.687 * safezoneH + safezoneY;
			w = 0.175313 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class btn_add: life_RscButtonMenu
		{
			idc = 2401;
			text = "Straftat hinzufügen"; //--- ToDo: Localize;
			x = 0.185469 * safezoneW + safezoneX;
			y = 0.72 * safezoneH + safezoneY;
			w = 0.175313 * safezoneW;
			h = 0.033 * safezoneH;
        	colorBackground[] = {0.149,0.149,0.149,1};
        	onButtonClick = "call life_fnc_wantedAddP;";
			class Attributes {
	            font = "PuristaBold";
	            align = "center";
	        };
		};
		class btn_delete: life_RscButtonMenu
		{
			idc = 2400;
			text = "Straftat entfernen"; //--- ToDo: Localize;
			x = 0.685625 * safezoneW + safezoneX;
			y = 0.533 * safezoneH + safezoneY;
			w = 0.128906 * safezoneW;
			h = 0.033 * safezoneH;
        	colorBackground[] = {0.149,0.149,0.149,1};
        	onButtonClick = "call life_fnc_pardon; closeDialog 0;";
			class Attributes {
	            font = "PuristaBold";
	            align = "center";
	        };
		};
        class btn_close: Life_RscButtonMenu
        {
        	idc = -1;
        	text = "Schliessen"; //--- ToDo: Localize;
        	x = 0.7475 * safezoneW + safezoneX;
        	y = 0.764 * safezoneH + safezoneY;
        	w = 0.0773437 * safezoneW;
        	h = 0.033 * safezoneH;
        	colorBackground[] = {0.149,0.149,0.149,1};
          	onButtonClick = "closeDialog 0;";
		  	class Attributes {
				align = "center";
			};
        };
	};
};