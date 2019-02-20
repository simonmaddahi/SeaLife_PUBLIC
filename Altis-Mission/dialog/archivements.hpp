/*
	Author: Natic
*/
class sealife_archivements {
    idd = 100100;
    name = "sealife_archivements";
    onLoad = "";
    onUnLoad = "";
    movingEnable = false;
    enableSimulation = false;

    class controlsBackground {
        class bg: Life_RscPicture
        {
            idc = -1;
            text = "ure\misc\bg_menu.paa";
            x = 0.17 * safezoneW + safezoneX;
            y = 0.115 * safezoneH + safezoneY;
            w = 0.665156 * safezoneW;
            h = 0.693 * safezoneH;
            ColorBackground[] = {0.784313,0.784313,0.784313,0};
            ColorText[] = {0,0,0,1};
        };
        class title: Life_RscStructuredText
        {
            idc = 5999;
            text = "<t align'right' font'PuristaBold' size'1.5'>Archivements</t>";
            x = 0.412621 * safezoneW + safezoneX;
            y = 0.169549 * safezoneH + safezoneY;
            w = 0.154687 * safezoneW;
            h = 0.033 * safezoneH;
            ColorBackground[] = {0,0,0,0};
        };
    };
    class controls {
        class btn_submit: Life_RscButtonMenu
        {
            idc = 2400;
            text = "Schließen";
            onButtonClick = "";
            x = 0.647855 * safezoneW + safezoneX;
            y = 0.034475 * safezoneH + safezoneY;
            w = 0.221719 * safezoneW;
            h = 0.055 * safezoneH;
            ColorBackground[] = {0.145098,0.145098,0.145098,1};
            ColorText[] = {1,1,1,1};
        };
        class archives_list: Life_RscListbox
        {
            idc = 100101;
            x = 0.209235 * safezoneW + safezoneX;
            y = 0.232345 * safezoneH + safezoneY;
            w = 0.752604 * safezoneW;
            h = 0.722222 * safezoneH;
            ColorBackground[] = {0,0,0,0.705882};
            ColorText[] = {1,1,1,1};
            colorSelectBackground[] = {0,0,0,1};
            colorSelect[] = {0,0,0,1};
        };
    };
};
////////////////////////////////////////////////////////////////////////////
