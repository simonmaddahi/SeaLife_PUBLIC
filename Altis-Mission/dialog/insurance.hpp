class ZBG_Insurance {
    idd = 257364;
    name= "ZBG_Insurance";
    movingEnable = 0;
    enableSimulation = 1;

    class controlsBackground {
		class bg: Life_RscPicture
		{
			idc = -1;
        	text = "texture\misc\bg_menu.paa";
			x = 0.17 * safezoneW + safezoneX;
			y = 0.115 * safezoneH + safezoneY;
			w = 0.665156 * safezoneW;
			h = 0.693 * safezoneH;
		};
		class info_structured: Life_RscStructuredText
		{
			idc = -1;
			text = "<t align='center' font='PuristaBold'>Willkommen bei den Altis Versicherungen</t><br/><t font='PuristaMedium' align='center'>Hier kannst du dein Fahrzeug versichern. Beachte dabei dass die Kosten für die Versicherung bei jedem Fahrzeug 50% des Kaufpreises betragen. Sollte dein Fahrzeug einen Totalschaden erleiden, haften wir für den Schaden und stellen dir ein neues Fahrzeug zur Verfügung. Die Versicherung verfällt, sobald dein Fahrzeug einen Totalschaden erleidet.</t><br/><t font='PuristaSemiBold' align='center'>Danke für dein Vertrauen!</t>"; //--- ToDo: Localize;
			x = 0.180312 * safezoneW + safezoneX;
			y = 0.215 * safezoneH + safezoneY;
			w = 0.649688 * safezoneW;
			h = 0.12 * safezoneH;
			size = "0.024 * safezoneH";
		};

        class title: Life_RscStructuredText
        {
        	idc = -1;
        	text = "<t align='right' font='PuristaBold' size='1.5'>Altis Versicherungen</t>"; //--- ToDo: Localize;
        	x = 0.453594 * safezoneW + safezoneX;
        	y = 0.126 * safezoneH + safezoneY;
        	w = 0.154687 * safezoneW;
        	h = 0.033 * safezoneH;
        	colorBackground[] = {-1,-1,-1,0};
        };

		class title_infos: life_RscStructuredText
		{
			idc = -1;
			text = "<t font='PuristaBold' underline='true'>Übersicht deines Fahrzeugs:</t>"; //--- ToDo: Localize;
			x = 0.180312 * safezoneW + safezoneX;
			y = 0.346 * safezoneH + safezoneY;
			w = 0.195937 * safezoneW;
			h = 0.033 * safezoneH;
		};
    };

    class controls {
		class struc_infos: life_RscStructuredText
		{
			idc = 1001;
			text = "";
			x = 0.180312 * safezoneW + safezoneX;
			y = 0.38 * safezoneH + safezoneY;
			w = 0.195937 * safezoneW;
			h = 0.176 * safezoneH;
			size = "0.021 * safezoneH";
		};
		class struc_price: life_RscStructuredText
		{
			idc = 1002;
			x = 0.37625 * safezoneW + safezoneX;
			y = 0.4 * safezoneH + safezoneY;
			w = 0.433125 * safezoneW;
			h = 0.044 * safezoneH;
			size = "0.024 * safezoneH";
		};
		class btn_submit: Life_RscButtonMenu
		{
			idc = 2400;
			text = "Versicherung abschließen";
			onButtonClick = "[nil, nil, nil, true] call ESG_fnc_insuranceBuy";
			x = 0.483594 * safezoneW + safezoneX;
			y = 0.47 * safezoneH + safezoneY;
			w = 0.221719 * safezoneW;
			h = 0.055 * safezoneH;
        	colorBackground[] = {0.149,0.149,0.149,1};
			class Attributes {
	            font = "PuristaBold";
	            align = "center";
	        };
			size = "0.027 * safezoneH";
		};
        class btnClose: Life_RscButtonMenu
        {
        	idc = -1;
        	text = "Schliessen"; //--- ToDo: Localize;
          	onButtonClick = "closeDialog 0;";
        	x = 0.190625 * safezoneW + safezoneX;
        	y = 0.742 * safezoneH + safezoneY;
        	w = 0.0876563 * safezoneW;
        	h = 0.033 * safezoneH;
        	colorBackground[] = {0.149,0.149,0.149,1};
        };
	};
};