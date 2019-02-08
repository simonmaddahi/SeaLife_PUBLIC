class ZBG_Plates {
    idd = 471578;
    name= "ZBG_Plates";
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
			text = "<t align='center' font='PuristaBold'>Willkommen bei der Zulassungsstelle Altis</t><br/><t font='PuristaMedium' align='center'>Hier kannst du ein neues Kennzeichen beantragen oder dein vorhandenes Kennzeichen ändern. Beachte dabei, dass dein Kennzeichen maximal 6 Ziffern beinhalten darf. Die ersten zwei Buchstaben sind das Kürzel der Stadt, wo dein Fahrzeug zugelassen wurde.</t><br/><t font='PuristaSemiBold' align='center'>Denke an eine gültige TÜV Plakette!</t>"; //--- ToDo: Localize;
			x = 0.180312 * safezoneW + safezoneX;
			y = 0.215 * safezoneH + safezoneY;
			w = 0.649688 * safezoneW;
			h = 0.12 * safezoneH;
			size = "0.024 * safezoneH";
		};

        class title: Life_RscStructuredText
        {
        	idc = -1;
        	text = "<t align='right' font='PuristaBold' size='1.5'>Zulassungsstelle</t>"; //--- ToDo: Localize;
        	x = 0.453594 * safezoneW + safezoneX;
        	y = 0.126 * safezoneH + safezoneY;
        	w = 0.154687 * safezoneW;
        	h = 0.033 * safezoneH;
        	colorBackground[] = {-1,-1,-1,0};
        };
		class wunsch_zeichen: Life_RscTitle
		{
			idc = -1;
			text = "Bitte geb hier deine Wunsch-Nummer für dein Kennzeiche ein:"; //--- ToDo: Localize;
			x = 0.273281 * safezoneW + safezoneX;
			y = 0.454 * safezoneH + safezoneY;
			w = 0.231719 * safezoneW;
			h = 0.033 * safezoneH;
			sizeEx = "0.062 * (getResolution select 5)";
		};
	};
	class controls {
		class plate_info: Life_RscStructuredText
		{
			idc = 1101;
			text = ""; //--- ToDo: Localize;
			x = 0.278281 * safezoneW + safezoneX;
			y = 0.3878 * safezoneH + safezoneY;
			w = 0.427969 * safezoneW;
			h = 0.055 * safezoneH;
			size = "0.035 * safezoneH";
		};
		class edit_plate: Life_RscEdit
		{
			idc = 1400;
			text = "";
			x = 0.515156 * safezoneW + safezoneX;
			y = 0.456 * safezoneH + safezoneY;
			w = 0.144375 * safezoneW;
			h = 0.033 * safezoneH;
		};
		class btn_submit: Life_RscButtonMenu
		{
			idc = 2400;
			text = "Kennzeichen beantragen";
			onButtonClick = "[nil, nil, nil, [1]] call ESG_fnc_changePlate";
			x = 0.37625 * safezoneW + safezoneX;
			y = 0.511 * safezoneH + safezoneY;
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