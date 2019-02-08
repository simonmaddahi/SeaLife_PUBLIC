class esg_ausweis_create {
    idd = 2777;
    name= "esg_ausweis_create";
    movingEnable = 0;
    enableSimulation = 1;

    class controlsBackground {
		    class bg : life_rscPicture
		    {
		        idc = -1;
				text = "texture\misc\ausweis.jpg";
				x = 0 * safezoneW + safezoneX;
				y = 0 * safezoneH + safezoneY;
				w = 1 * safezoneW;
				h = 1 * safezoneH;
		    };
		};

	class controls {
		class vorname: life_RscEdit
		{
			idc = 1003;
			text = "Name"; //--- ToDo: Localize;
			x = 0.422135 * safezoneW + safezoneX;
			y = 0.408296 * safezoneH + safezoneY;
			w = 0.241406 * safezoneW;
			h = 0.0321852 * safezoneH;
  			canModify = 0;
		};
		class geburt_tag: life_RscCombo
		{
			idc = 2100;
			x = 0.682292 * safezoneW + safezoneX;
			y = 0.696296 * safezoneH + safezoneY;
			w = 0.046459 * safezoneW;
			h = 0.0264074 * safezoneH;
		};
		class geburt_monat: life_RscCombo
		{
			idc = 2101;
			x = 0.742198 * safezoneW + safezoneX;
			y = 0.696296 * safezoneH + safezoneY;
			w = 0.110394 * safezoneW;
			h = 0.0264074 * safezoneH;
		};
		class geburt_jahr: life_RscCombo
		{
			idc = 2102;
			x = 0.866666 * safezoneW + safezoneX;
			y = 0.696296 * safezoneH + safezoneY;
			w = 0.0526463 * safezoneW;
			h = 0.0264074 * safezoneH;
		};
		class anschrift_strasse: life_RscEdit
		{
			idc = 1403;
			text = "Straße"; //--- ToDo: Localize;
			x = 0.421875 * safezoneW + safezoneX;
			y = 0.650926 * safezoneH + safezoneY;
			w = 0.241406 * safezoneW;
			h = 0.0321852 * safezoneH;
		};
		class anschrift_ort: life_RscEdit
		{
			idc = 1404;
			text = "Stadt"; //--- ToDo: Localize;
			x = 0.528646 * safezoneW + safezoneX;
			y = 0.692592 * safezoneH + safezoneY;
			w = 0.134635 * safezoneW;
			h = 0.0312593 * safezoneH;
		};
		class koerper_augenfarbe: life_RscEdit
		{
			idc = 1405;
			text = "Augenfarbe"; //--- ToDo: Localize;
			x = 0.786979 * safezoneW + safezoneX;
			y = 0.503704 * safezoneH + safezoneY;
			w = 0.134635 * safezoneW;
			h = 0.0312593 * safezoneH;
		};
		class geburtsort: life_RscEdit
		{
			idc = 1402;
			text = "Geburtsort"; //--- ToDo: Localize;
			x = 0.680208 * safezoneW + safezoneX;
			y = 0.597222 * safezoneH + safezoneY;
			w = 0.0960935 * safezoneW;
			h = 0.0331111 * safezoneH;
		};
		class koerper_groesse: life_RscEdit
		{
			idc = 1406;
			text = "Größe"; //--- ToDo: Localize;
			x = 0.680729 * safezoneW + safezoneX;
			y = 0.503704 * safezoneH + safezoneY;
			w = 0.0960935 * safezoneW;
			h = 0.0331111 * safezoneH;
		};
		class religion_combo: life_RscCombo
		{
			idc = 2103;
			x = 0.685937 * safezoneW + safezoneX;
			y = 0.411111 * safezoneH + safezoneY;
			w = 0.230834 * safezoneW;
			h = 0.0264074 * safezoneH;
		};
		class anschrift_plz: life_RscEdit
		{
			idc = 1401;
			text = "PLZ"; //--- ToDo: Localize;
			x = 0.422396 * safezoneW + safezoneX;
			y = 0.69074 * safezoneH + safezoneY;
			w = 0.0960935 * safezoneW;
			h = 0.0331111 * safezoneH;
		};
		class geburt_land: life_RscEdit
		{
			idc = 1407;
			text = "Geburtsland"; //--- ToDo: Localize;
			x = 0.7875 * safezoneW + safezoneX;
			y = 0.598148 * safezoneH + safezoneY;
			w = 0.134635 * safezoneW;
			h = 0.0312593 * safezoneH;
		};
		class geschlecht_combo: life_RscCombo
		{
			idc = 2104;
			x = 0.427344 * safezoneW + safezoneX;
			y = 0.532186 * safezoneH + safezoneY;
			w = 0.230834 * safezoneW;
			h = 0.0264074 * safezoneH;
		};
		class button_weiter: ESG_RscCloseButton
		{
			idc = -1;
			text = ""; //--- ToDo: Localize;
			x = 0.701094 * safezoneW + safezoneX;
			y = 0.819 * safezoneH + safezoneY;
			w = 0.185625 * safezoneW;
			h = 0.088 * safezoneH;
			onButtonClick = "[] spawn ESG_fnc_ausweis_get;";
		};
		class btn_cancel: ESG_RscCloseButton
		{
			idc = -1;
			text = "";
			onButtonClick = "endmission '-';";
			x = 0.898438 * safezoneW + safezoneX;
			y = 0.818518 * safezoneH + safezoneY;
			w = 0.0478126 * safezoneW;
			h = 0.0871852 * safezoneH;
		};
	};
};
