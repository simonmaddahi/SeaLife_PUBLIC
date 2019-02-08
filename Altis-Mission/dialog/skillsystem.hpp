class esg_skillsystem_dialog {
    idd = 39472;
    movingEnable = 0;
    enableSimulation = 1;

    class controlsBackground {
        class bg_pic: life_RscPicture
        {
            idc = -1;

            text = "texture\misc\bg_menu.paa"; //--- ToDo: Localize;
            x = 0.17 * safezoneW + safezoneX;
            y = 0.115 * safezoneH + safezoneY;
            w = 0.665156 * safezoneW;
            h = 0.693 * safezoneH;
        };
        class title: Life_RscStructuredText
        {
            idc = -1;

            text = "<t font='PuristaBold' align='right' size='1.5'>Skillsystemübersicht</t>"; //--- ToDo: Localize;
            x = 0.180312 * safezoneW + safezoneX;
            y = 0.126 * safezoneH + safezoneY;
            w = 0.427969 * safezoneW;
            h = 0.033 * safezoneH;
            colorBackground[] = {-1,-1,-1,0};
        };
        class titleSelect: life_RscText
        {
            idc = -1;
            text = "Kategorie auswählen:"; //--- ToDo: Localize;
            x = 0.185469 * safezoneW + safezoneX;
            y = 0.203 * safezoneH + safezoneY;
            w = 0.139219 * safezoneW;
            h = 0.022 * safezoneH;
        };
        class txtPunktedieErHat: life_RscText
        {
            idc = -1;
            text = "Skillpunkte:"; //--- ToDo: Localize;
            x = 0.350469 * safezoneW + safezoneX;
            y = 0.236 * safezoneH + safezoneY;
            w = 0.108281 * safezoneW;
            h = 0.022 * safezoneH;
        };
        class txtNeeded: life_RscText
        {
            idc = -1;
            text = "Benötigte Skillpunkte:"; //--- ToDo: Localize;
            x = 0.350469 * safezoneW + safezoneX;
            y = 0.335 * safezoneH + safezoneY;
            w = 0.108281 * safezoneW;
            h = 0.022 * safezoneH;
        };
        class txtLevelGerade: life_RscText
        {
            idc = -1;
            text = "Aktuelle Skillstufe:"; //--- ToDo: Localize;
            x = 0.530937 * safezoneW + safezoneX;
            y = 0.236 * safezoneH + safezoneY;
            w = 0.108281 * safezoneW;
            h = 0.022 * safezoneH;
        };
        class txtInfoTitle: life_RscText
        {
            idc = -1;
            text = "Informationen zu deiner Skillstufe:"; //--- ToDo: Localize;
            x = 0.360781 * safezoneW + safezoneX;
            y = 0.467 * safezoneH + safezoneY;
            w = 0.170156 * safezoneW;
            h = 0.022 * safezoneH;
        };
        class txtNextTitle: life_RscText
        {
            idc = -1;
            text = "Informationen zur nächsten Skillstufe:"; //--- ToDo: Localize;
            x = 0.603125 * safezoneW + safezoneX;
            y = 0.467 * safezoneH + safezoneY;
            w = 0.170156 * safezoneW;
            h = 0.022 * safezoneH;
        };
    };

    class controls {
        class txtPunkteDieErHat: life_RscStructuredText
        {
            idc = 1100;
            text = "<t align='center' font='PuristaBold'>x</t>"; //--- ToDo: Localize;
            x = 0.350469 * safezoneW + safezoneX;
            y = 0.269 * safezoneH + safezoneY;
            w = 0.0928125 * safezoneW;
            h = 0.044 * safezoneH;
            colorBackground[] = {-1,-1,-1,0.7};
        };
        class txtSoVieleBrauchtErNoch: life_RscStructuredText
        {
            idc = 1101;
            text = "<t align='center' font='PuristaBold'>x</t>"; //--- ToDo: Localize;
            x = 0.350469 * safezoneW + safezoneX;
            y = 0.368 * safezoneH + safezoneY;
            w = 0.0928125 * safezoneW;
            h = 0.044 * safezoneH;
            colorBackground[] = {-1,-1,-1,0.7};
        };
        class txtStufeAktuell: life_RscStructuredText
        {
            idc = 1102;
            text = "<t align='center' font='PuristaBold'>Stufe x</t>"; //--- ToDo: Localize;
            x = 0.536094 * safezoneW + safezoneX;
            y = 0.269 * safezoneH + safezoneY;
            w = 0.0928125 * safezoneW;
            h = 0.044 * safezoneH;
            colorBackground[] = {-1,-1,-1,0.7};
        };
        class StrucInformationen: life_RscStructuredText
        {
            idc = 1103;
            text = "";
            x = 0.365937 * safezoneW + safezoneX;
            y = 0.5 * safezoneH + safezoneY;
            w = 0.20625 * safezoneW;
            h = 0.209 * safezoneH;
            colorBackground[] = {-1,-1,-1,0.5};
        };
        class strucNextInformation: life_RscStructuredText
        {
            idc = 1104;
            text = "";
            x = 0.613437 * safezoneW + safezoneX;
            y = 0.5 * safezoneH + safezoneY;
            w = 0.20625 * safezoneW;
            h = 0.209 * safezoneH;
            colorBackground[] = {-1,-1,-1,0.5};
        };
        class btn_close: Life_RscButtonMenu
        {
            onButtonClick = "closeDialog 0;";

            idc = -1;
            text = "Schließen"; //--- ToDo: Localize;
            x = 0.190625 * safezoneW + safezoneX;
            y = 0.742 * safezoneH + safezoneY;
            w = 0.0876563 * safezoneW;
            h = 0.033 * safezoneH;
            colorText[] = {1,1,1,1};
            colorBackground[] = {0.149,0.149,0.149,1};
        };
        class listKategorie: life_RscListbox
        {
            idc = 1500;
            text = "";
            x = 0.190625 * safezoneW + safezoneX;
            y = 0.236 * safezoneH + safezoneY;
            w = 0.134062 * safezoneW;
            h = 0.341 * safezoneH;
            sizeEx = 0.04;
            onLBSelChanged = "[]call ESG_fnc_updateSkillMenu;";
        };
        class titleSelectedFotschritt: life_RscTitle
        {
            idc = 1004;
            text = "Skillfortschritt Kategorie: x"; //--- ToDo: Localize;
            x = 0.345312 * safezoneW + safezoneX;
            y = 0.203 * safezoneH + safezoneY;
            w = 0.4 * safezoneW;
            h = 0.022 * safezoneH;
        };
    };
};