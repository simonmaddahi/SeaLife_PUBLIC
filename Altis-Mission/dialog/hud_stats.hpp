#define ST_CENTER         0x02
/*
    Author: Daniel Stuart

    File: hud_stats.hpp
*/

class playerHUD {
    idd = -1;
    duration = 10e10;
    movingEnable = 0;
    fadein = 0;
    fadeout = 0;
    name = "playerHUD";
    onLoad = "uiNamespace setVariable ['playerHUD',_this select 0]";
    objects[] = {};
    controls[] = {
        LIFE_INFOTEXT,
        Life_RscProgress_HUDFood,
        Life_RscProgress_HUDHealth,
        Life_RscProgress_HUDWater,
		LIFE_PIC_LEBEN,
		LIFE_PIC_ESSEN,
		LIFE_PIC_TRINKEN,
		ESG_WATERMARK
    };

    /* Background */
    class LIFE_INFOTEXT: life_RscStructuredtext
	{
		idc = 1000;
		text = "SeaLife-Gaming.de - Scripted by Basti"; //--- ToDo: Localize;
		x = 0.659844 * safezoneW + safezoneX;
		y = 0.973 * safezoneH + safezoneY;
		w = 0.340312 * safezoneW;
		h = 0.022 * safezoneH;
	};

    /* Progress Bars */
    class LIFE_RscProgress_HUDCommon: Life_RscProgress {
        colorFrame[] = {0, 0, 0, 0};
        style = 2;
        y = 0.972223 * safezoneH + safezoneY;
        w = 0.0462964 * safezoneW;
        h = 0.0222222 * safezoneH;
    };

    class Life_RscProgress_HUDFood: LIFE_RscProgress_HUDCommon {
        idc = 2200;
        colorBar[] = {0.933,0.565,0.067};
		x = 0.897031 * safezoneW + safezoneX;
		y = 0.776852 * safezoneH + safezoneY;
		w = 0.0979687 * safezoneW;
		h = 0.011 * safezoneH;
    };

    class Life_RscProgress_HUDHealth: LIFE_RscProgress_HUDCommon {
        idc = 2201;
        colorBar[] = {0.898,0.016,0.18};
		x = 0.897031 * safezoneW + safezoneX;
		y = 0.907926 * safezoneH + safezoneY;
		w = 0.0979687 * safezoneW;
		h = 0.011 * safezoneH;
    };

    class Life_RscProgress_HUDWater: LIFE_RscProgress_HUDCommon {
        idc = 2202;
        colorBar[] = {0.325,0.643,0.91};
		x = 0.896615 * safezoneW + safezoneX;
		y = 0.843778 * safezoneH + safezoneY;
		w = 0.0979687 * safezoneW;
		h = 0.011 * safezoneH;
    };
	class LIFE_PIC_LEBEN: life_RscPicture
	{
		idc = -1;
		text = "texture\misc\leben.paa";
		x = 0.897031 * safezoneW + safezoneX;
		y = 0.863 * safezoneH + safezoneY;
		w = 0.0979687 * safezoneW;
		h = 0.055 * safezoneH;
	};
	class LIFE_PIC_ESSEN: life_RscPicture
	{
		idc = -1;
		text = "texture\misc\essen.paa";
		x = 0.897031 * safezoneW + safezoneX;
		y = 0.731 * safezoneH + safezoneY;
		w = 0.0979687 * safezoneW;
		h = 0.055 * safezoneH;
	};
	class LIFE_PIC_TRINKEN: life_RscPicture
	{
		idc = -1;
		text = "texture\misc\trinken.paa";
		x = 0.897031 * safezoneW + safezoneX;
		y = 0.797 * safezoneH + safezoneY;
		w = 0.0979687 * safezoneW;
		h = 0.055 * safezoneH;
	};
	class ESG_WATERMARK: life_RscPicture
	{
		idc = 8888;
		text = "texture\misc\esg_logo.paa";
		x = 0.005 * safezoneW + safezoneX;
		y = 0.896 * safezoneH + safezoneY;
		w = 0.0515625 * safezoneW;
		h = 0.088 * safezoneH;
	};
};