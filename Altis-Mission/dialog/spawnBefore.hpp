////////////////////////////////////////////////////////
class ESG_spawnBefore {
    idd = 88214;
	name = "ESG_spawnBefore";
    movingEnable = 0;
    enableSimulation = 0;
    onLoad = "0 spawn{waituntil{!isNull (finddisplay 88214)}; [0] call life_fnc_ladeSpieler;}";

    class controlsBackground {
    
    class riffel: life_RscPicture
		{
			idc = -1;
			//text = "a3\ui_f\data\IGUI\RscTitles\SplashArma3\arma3_splashNoise_ca.paa";
			text = "texture\misc\loadingscreen.jpg";
			x = 0 * safezoneW + safezoneX;
			y = 0 * safezoneH + safezoneY;
			w = 1 * safezoneW;
			h = 1 * safezoneH;
		};
  };

  class Controls {
		class contentcontrols: life_RscControlsGroup
		{
			idc = -1;
			x = 0.561875 * safezoneW + safezoneX;
			y = 0.346 * safezoneH + safezoneY;
			w = 0.376406 * safezoneW;
			h = 0.385 * safezoneH;

			class Controls
			{
				class infos: life_RscStructuredText
				{
					idc = 121212;
					text = "";
					x = 0;
					y = 0;
					w = 0.376406 * safezoneW;
					h = 0.6 * safezoneH;
					colorBackground[] = {-1,-1,-1,0.7};
				};
			};
		};

		class spawn: ESG_RscCloseButton
		{
			idc = 2400;
			text = ""; //--- ToDo: Localize;
			x = 0.703698 * safezoneW + safezoneX;
			y = 0.817148 * safezoneH + safezoneY;
			w = 0.182031 * safezoneW;
			h = 0.0834815 * safezoneH;
			onButtonClick = "[4] call life_fnc_ladeSpieler";
		};

		class progress: Life_RscProgress
		{
			idc = 1000;
			x = 0.102448 * safezoneW + safezoneX;
			y = 0.8457 * safezoneH + safezoneY;
			w = 0.53625 * safezoneW;
			h = 0.033 * safezoneH;
			colorBackground[] = {-1,-1,-1,1};
			colorBar[] = {0.114,0.208,0.349,1};
			colorFrame[] = {0, 0, 0, 0};
		};

		class progress_text: life_RscStructuredText
		{
			idc = 1001;
			text = "Loading...."; //--- ToDo: Localize;
			x = 0.102448 * safezoneW + safezoneX;
			y = 0.8468 * safezoneH + safezoneY;
			w = 0.53625 * safezoneW;
			h = 0.033 * safezoneH;
		};
		class info_player: life_RscStructuredText
		{
			idc = 2402;
			text = "<t font='PuristaSemiBold'>Laden...</t>";
			x = 0.12875 * safezoneW + safezoneX;
			y = 0.599 * safezoneH + safezoneY;
			w = 0.185625 * safezoneW;
			h = 0.044 * safezoneH;
			size = "0.035 * safezoneH";
		};
		class info_geld: life_RscStructuredText
		{
			idc = 2403;
			text = "<t font='PuristaSemiBold'>Laden...</t>";
			x = 0.12875 * safezoneW + safezoneX;
			y = 0.676 * safezoneH + safezoneY;
			w = 0.185625 * safezoneW;
			h = 0.044 * safezoneH;
			size = "0.035 * safezoneH";
		};
		class info_stunden: life_RscStructuredText
		{
			idc = 2404;
			text = "<t font='PuristaSemiBold'>Laden...</t>";
			x = 0.371094 * safezoneW + safezoneX;
			y = 0.599 * safezoneH + safezoneY;
			w = 0.175313 * safezoneW;
			h = 0.044 * safezoneH;
			size = "0.035 * safezoneH";
		};
		class info_kfz: life_RscStructuredText
		{
			idc = 2405;
			text = "<t font='PuristaSemiBold'>Laden...</t>";
			x = 0.371094 * safezoneW + safezoneX;
			y = 0.676 * safezoneH + safezoneY;
			w = 0.175313 * safezoneW;
			h = 0.044 * safezoneH;
			size = "0.035 * safezoneH";
		};
		class join_pic: life_RscPicture
		{
			idc = 1201;
			text = "texture\misc\join.paa";
			x = 0.703698 * safezoneW + safezoneX;
			y = 0.817148 * safezoneH + safezoneY;
			w = 0.182031 * safezoneW;
			h = 0.0834815 * safezoneH;
		};
		class head_info: life_RscStructuredText
		{
			idc = 2406;
			text = "<t font='PuristaBold' size='2.3' underline='true'>Serverteam</t>";
			x = 0.561875 * safezoneW + safezoneX;
			y = 0.269 * safezoneH + safezoneY;
			w = 0.376406 * safezoneW;
			h = 0.066 * safezoneH;
		};
		class close: ESG_RscCloseButton
		{
			idc = -1;
			onButtonClick = "endmission '-';";
			x = 0.899114 * safezoneW + safezoneX;
			y = 0.816222 * safezoneH + safezoneY;
			w = 0.0464063 * safezoneW;
			h = 0.088 * safezoneH;
		};
	};
};
