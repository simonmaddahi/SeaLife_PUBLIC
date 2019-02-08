class esg_medicsystem {
    idd = 39494;
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
		/*
		class RscPicture_1201: life_RscPicture
		{
			idc = 1201;
			text = "body_background1.paa";
			x = 0.304062 * safezoneW + safezoneX;
			y = 0.214 * safezoneH + safezoneY;
			w = 0.366094 * safezoneW;
			h = 0.583 * safezoneH;
			colorBackground[] = {-1,-1,-1,0};
		};
		*/
		class RscPicture_1202: life_RscPicture
		{
			idc = 1202;
			text = "texture\misc\medic_torso.paa";
			x = 0.304062 * safezoneW + safezoneX;
			y = 0.214 * safezoneH + safezoneY;
			w = 0.366094 * safezoneW;
			h = 0.583 * safezoneH;
			colorBackground[] = {-1,-1,-1,0};
			colorText[] = {0,0.9,0,1};
		};
		class RscPicture_1203: life_RscPicture
		{
			idc = 1203;
			text = "texture\misc\medic_beine.paa";
			x = 0.304062 * safezoneW + safezoneX;
			y = 0.214 * safezoneH + safezoneY;
			w = 0.366094 * safezoneW;
			h = 0.583 * safezoneH;
			colorBackground[] = {-1,-1,-1,0};
			colorText[] = {0,0.9,0,1};
		};
		class RscPicture_1204: life_RscPicture
		{
			idc = 1204;
			text = "texture\misc\medic_arme.paa";
			x = 0.304062 * safezoneW + safezoneX;
			y = 0.214 * safezoneH + safezoneY;
			w = 0.366094 * safezoneW;
			h = 0.583 * safezoneH;
			colorBackground[] = {-1,-1,-1,0};
			colorText[] = {0,0.9,0,1};
		};
		class RscPicture_1205: life_RscPicture
		{
			idc = 1205;
			text = "texture\misc\medic_kopf.paa";
			x = 0.304062 * safezoneW + safezoneX;
			y = 0.214 * safezoneH + safezoneY;
			w = 0.366094 * safezoneW;
			h = 0.583 * safezoneH;
			colorBackground[] = {-1,-1,-1,0};
			colorText[] = {0,0.9,0,1};
		};
		class title: life_RscStructuredText
		{
			idc = 5004;
			text = "<t font='PuristaBold' size='1.5' align='right'>Medicsystem | x</t>"; //--- ToDo: Localize;
			x = 0.2 * safezoneW + safezoneX;
			y = 0.126 * safezoneH + safezoneY;
			w = 0.4 * safezoneW;
			h = 0.033 * safezoneH;
			colorBackground[] = {-1,-1,-1,0};
		};
	};

	class controls {
		class RscButtonMenu_2400: life_RscButtonMenu
		{
			idc = -1;
			text = "Schließen"; //--- ToDo: Localize;
			x = 0.190625 * safezoneW + safezoneX;
			y = 0.742 * safezoneH + safezoneY;
			w = 0.0876563 * safezoneW;
			h = 0.033 * safezoneH;
			colorText[] = {1,1,1,1};
        	colorBackground[] = {0.149,0.149,0.149,1};
			colorBackgroundFocused[] = {1,1,1,1};
			colorBackground2[] = {0.753,0.145,0.145,1};
			animTextureOver = "#(argb,8,8,3)color(0.753,0.145,0.145,1)";
	        class Attributes {
	        	align = "center";
    			font = "PuristaBold";
	        };
    		onButtonClick = "closeDialog 0;";
		};
		class textselected: life_RscText
		{
			idc = 1001;
			text = "Ausgewählter Bereich: x"; //--- ToDo: Localize;
			x = 0.180312 * safezoneW + safezoneX;
			y = 0.225 * safezoneH + safezoneY;
			w = 0.175313 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class txtVerletzungenProzent: life_RscText
		{
			idc = 1002;
			text = "Verletzungen des Bereichs: x%"; //--- ToDo: Localize;
			x = 0.180312 * safezoneW + safezoneX;
			y = 0.258 * safezoneH + safezoneY;
			w = 0.175313 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class txtBandageCount: life_RscText
		{
			idc = 1003;
			text = "Verfügbare Bandagen: x Stück"; //--- ToDo: Localize;
			x = 0.649531 * safezoneW + safezoneX;
			y = 0.775 * safezoneH + safezoneY;
			w = 0.175313 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class btnCallMedic: life_RscButtonMenu
		{
			idc = 2401;
			text = "Rettungsdienst benachrichtigen"; //--- ToDo: Localize;
			x = 0.639219 * safezoneW + safezoneX;
			y = 0.291 * safezoneH + safezoneY;
			w = 0.170156 * safezoneW;
			h = 0.066 * safezoneH;
			colorBackground[] = {0.753,0.145,0.145,0.5};
          	class Attributes
    		{
    			align = "center";
    			font = "PuristaBold";
			};
			onButtonClick = "[]spawn ESG_fnc_medicCallMedic;";
		};
		class btnHealPerson: life_RscButtonMenu
		{
			idc = 2402;
			text = "Ausgewählten Bereich verbinden"; //--- ToDo: Localize;
			x = 0.185469 * safezoneW + safezoneX;
			y = 0.324 * safezoneH + safezoneY;
			w = 0.175313 * safezoneW;
			h = 0.077 * safezoneH;
			colorBackground[] = {0.753,0.145,0.145,0.5};
          	class Attributes
    		{
    			align = "center";
    			font = "PuristaBold";
			};
			onButtonClick = "[] spawn ESG_fnc_bandage;";
		};
		class btnTabletteGeben: life_RscButtonMenu
		{
			idc = 2403;
			text = "Schmerztablette geben"; //--- ToDo: Localize;
			x = 0.639219 * safezoneW + safezoneX;
			y = 0.379 * safezoneH + safezoneY;
			w = 0.170156 * safezoneW;
			h = 0.044 * safezoneH;
			colorBackground[] = {0.753,0.145,0.145,0.5};
          	class Attributes
    		{
    			align = "center";
    			font = "PuristaBold";
			};
			onButtonClick = "[player getVariable [""realname"", name player]]remoteExec [""ESG_fnc_medicSchmerz"", ESG_medicInteract]; closeDialog 0; hint ""Du hast der Person eine Schmerztablette gegeben!"";";
		};
		class btnLeftArm: ESG_RscCloseButton
		{
			idc = 2404;
			x = 0.510312 * safezoneW + safezoneX;
			y = 0.324 * safezoneH + safezoneY;
			w = 0.0464063 * safezoneW;
			h = 0.22 * safezoneH;
			colorBackground[] = {0,0,0,0};
			tooltip = "Arme auswählen";
			onButtonClick = "[""arme""]spawn ESG_fnc_medicChangeTeil;";
		};
		class btnRightArm: ESG_RscCloseButton
		{
			idc = 2405;
			x = 0.4175 * safezoneW + safezoneX;
			y = 0.324 * safezoneH + safezoneY;
			w = 0.0464063 * safezoneW;
			h = 0.22 * safezoneH;
			colorBackground[] = {0,0,0,0};
			tooltip = "Arme auswählen";
			onButtonClick = "[""arme""]spawn ESG_fnc_medicChangeTeil;";
		};
		class btnTorso: ESG_RscCloseButton
		{
			idc = 2406;
			x = 0.45875 * safezoneW + safezoneX;
			y = 0.324 * safezoneH + safezoneY;
			w = 0.0567187 * safezoneW;
			h = 0.187 * safezoneH;
			colorBackground[] = {0,0,0,0};
			tooltip = "Torso auswählen";
			onButtonClick = "[""torso""]spawn ESG_fnc_medicChangeTeil;";
		};
		class btnHead: ESG_RscCloseButton
		{
			idc = 2407;
			x = 0.466979 * safezoneW + safezoneX;
			y = 0.247 * safezoneH + safezoneY;
			w = 0.04125 * safezoneW;
			h = 0.077 * safezoneH;
			colorBackground[] = {0,0,0,0};
			tooltip = "Kopf auswählen";
			onButtonClick = "[""kopf""]spawn ESG_fnc_medicChangeTeil;";
		};
		class btnLegs: ESG_RscCloseButton
		{
			idc = 2408;
			x = 0.453594 * safezoneW + safezoneX;
			y = 0.511 * safezoneH + safezoneY;
			w = 0.0670312 * safezoneW;
			h = 0.253 * safezoneH;
			colorBackground[] = {0,0,0,0};
			tooltip = "Beine auswählen";
			onButtonClick = "[""beine""]spawn ESG_fnc_medicChangeTeil;";
		};
		class txtCountMedics: life_RscText
		{
			idc = 1004;
			text = "Rettungsdienst-Mitarbeiter im Dienst: 5"; //--- ToDo: Localize;
			x = 0.649531 * safezoneW + safezoneX;
			y = 0.742 * safezoneH + safezoneY;
			w = 0.175313 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class txtNamePerson: life_RscText
		{
			idc = 1005;
			text = "Name der Person: x"; //--- ToDo: Localize;
			x = 0.649531 * safezoneW + safezoneX;
			y = 0.709 * safezoneH + safezoneY;
			w = 0.175313 * safezoneW;
			h = 0.022 * safezoneH;
		};
	};
};