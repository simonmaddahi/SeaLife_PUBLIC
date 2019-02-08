/*
 *
 *	@File:		locker-config.hpp
 *	@Author: 	AllianceApps
 *	@Date:		24.06.2017
 *
 *	You are not allowed to use this script or remove the credits of the script without written permission of the author.
 *  You are not allowed to use this script without a valid license. License terms apply.
 *
 *  Du darfst dieses Script nicht nutzen oder diesen Copyright-Hinweis nicht entfernen, wenn du keine schriftliche Bestätigung des Autors hast.
 *  Du darfst dieses Script nicht ohne gültige Lizenz nutzen. Die Lizenzbestimmungen für Scripts sind zu beachten.
 *  
 */
#define true 1
#define false 0
class locker_config {
	//Blacklisted items/virtitems/weapons/clothing which should not be safed. Enter classname.
	antisafeitems[] = {
		"itemclasname1",
		"itemclassname2",
		"storagesmall",
		"optic_LRPS",
		"LMG_Zafir_F"
	};
	
		
	//Sides which should have the permission to use the locker.
	locker_sides[] = {"GUER","WEST","CIV","EAST"}; //GUER = "independent", WEST = "west",CIV = "civilian",EAST = "opfor"
	
	//Killed EVH - Remove whole equiment if player dies while he's in the locker. (duping prevention)
	locker_killedevh = true; //true = activated
	
	//Converts old format to the newer one
	locker_converter = false;
	
	//if true, activates floating lvl values - else uses fixed locker_price and limit
	locker_lvl_bool = true; 
	
	/* 		ONLY IF locker_lvl_bool == FALSE		*/
		//Price of one locker
		locker_price = 500000; //default = 500000
		
		//The limit of items which can be saved. Checked on input. Every item has a weight of 1;
		locker_limit = 100; //default = 100
		
	/* 		ONLY IF locker_lvl_bool == TRUE		*/
		locker_levels[] = {
			/*	LOCKER LIMIT, PRICE TO UPGRADE	*/
			{50,50000}, //INITPRICE
			{100,100000}, //LVL 2
			{150,150000}, //LVL 3
			{250,500000}, //LVL 4
			{500,5000000} //LVL 5
		};
		
	/*=======================================================*/
};





/* DON'T EDIT ME! I'M A HORNY AND BUGGY DIALOG! */ 
class virt_locker
{
    idd = 1000001;
	name = "virt_locker";
    movingEnable = false;
    enableSimulation = true;
	
	class controlsBackground {
		class RscText_1014: Life_RscText
		{
			idc = -1;
			text = "$STR_locker";
			x = 0.270038 * safezoneW + safezoneX;
			y = 0.1832 * safezoneH + safezoneY;
			w = 0.460884 * safezoneW;
			h = 0.033 * safezoneH;
			colorBackground[] = {0.129,0.451,1,1};
			style = 2;
		};
		class bekleidung_btn: Life_RscButton
		{
			idc = -1;
			text = "$STR_locker_cloth";
			x = 0.270038 * safezoneW + safezoneX;
			y = 0.225 * safezoneH + safezoneY;
			w = 0.113465 * safezoneW;
			h = 0.033 * safezoneH;
			colorBackground[] = {0,0,0,0.8};
			colorText[] = {0.114,0.208,0.349,1};
			colorActive[] = {0,0,0,1};
			action = "0 call life_fnc_locker_changedialog";
			type = 1;access = 0;
			colorShadow[] = {0,0,0,0};
			colorFocused[] = {0,0,0,0.8};
			colorBackgroundActive[] = {0,0,0,0.8};
			offsetPressedX = 0;
			offsetPressedY = 0;
		};
		class waffen_btn: Life_RscButton
		{
			idc = -1;
			text = "$STR_locker_weap";
			x = 0.386355 * safezoneW + safezoneX;
			y = 0.225 * safezoneH + safezoneY;
			w = 0.113465 * safezoneW;
			h = 0.033 * safezoneH;
			colorBackground[] = {0,0,0,0.8};
			colorText[] = {0.114,0.208,0.349,1};
			colorActive[] = {0,0,0,1};
			action = "1 call life_fnc_locker_changedialog";
			type = 1;access = 0;
			colorShadow[] = {0,0,0,0};
			colorFocused[] = {0,0,0,0.8};
			colorBackgroundActive[] = {0,0,0,0.8};
			offsetPressedX = 0;
			offsetPressedY = 0;
		};
		class item_btn: Life_RscButton
		{
			idc = -1;
			text = "Items";
			x = 0.502372 * safezoneW + safezoneX;
			y = 0.225 * safezoneH + safezoneY;
			w = 0.112434 * safezoneW;
			h = 0.033 * safezoneH;
			colorBackground[] = {0,0,0,0.8};
			colorText[] = {0.114,0.208,0.349,1};
			colorActive[] = {0,0,0,1};
			action = "2 call life_fnc_locker_changedialog";
			type = 1;access = 0;
			colorShadow[] = {0,0,0,0};
			colorFocused[] = {0,0,0,0.8};
			colorBackgroundActive[] = {0,0,0,0.8};
			offsetPressedX = 0;
			offsetPressedY = 0;
		};
		class RscButton_2019: Life_RscButton
		{
			idc = -1;
			text = "$STR_locker_vitems";
			x = 0.617563 * safezoneW + safezoneX;
			y = 0.225 * safezoneH + safezoneY;
			w = 0.112949 * safezoneW;
			h = 0.033 * safezoneH;
			colorBackground[] = {0,0,0,0.8};
			colorText[] = {0.114,0.208,0.349,1};
			colorActive[] = {0,0,0,1};
			action = "3 call life_fnc_locker_changedialog";
			type = 1;access = 0;
			colorShadow[] = {0,0,0,0};
			colorFocused[] = {0,0,0,0.8};
			colorBackgroundActive[] = {0,0,0,0.8};
			offsetPressedX = 0;
			offsetPressedY = 0;
		};
		class background: Life_RscText
		{
			idc = -1;
			x = 0.270032 * safezoneW + safezoneX;
			y = 0.269 * safezoneH + safezoneY;
			w = 0.460967 * safezoneW;
			h = 0.506 * safezoneH;
			colorBackground[] = {0,0,0,0.8};
		};
		class logo: Life_RscPicture
		{
			idc = -1;
			text = "core\locker\allianceapps_logo.paa";
			x = 0.778437 * safezoneW + safezoneX;
			y = 0.8762 * safezoneH + safezoneY;
			w = 0.154687 * safezoneW;
			h = 0.132 * safezoneH;
		};
		class RscButtonxs: Life_RscButton
		{
			idc = -1;
			text = "$STR_Global_Close";
			x = 0.617504 * safezoneW + safezoneX;
			y = 0.7794 * safezoneH + safezoneY;
			w = 0.113465 * safezoneW;
			h = 0.033 * safezoneH;
			colorBackground[] = {0,0,0,0.8};
			colorText[] = {0.114,0.208,0.349,1};
			colorActive[] = {0,0,0,1};
			action = "0 spawn life_fnc_locker_terminate";
			type = 1;access = 0;
			colorShadow[] = {0,0,0,0};
			colorFocused[] = {0,0,0,0.8};
			colorBackgroundActive[] = {0,0,0,0.8};
			offsetPressedX = 0;
			offsetPressedY = 0;
		};
	};
	class controls {
		class weapon_einleg_btn: Life_RscButton
		{
			idc = 1000027;
			text = "<";
			x = 0.54125 * safezoneW + safezoneX;
			y = 0.3746 * safezoneH + safezoneY;
			w = 0.0154688 * safezoneW;
			h = 0.044 * safezoneH;
			sizeEx = 0.05;
			colorBackground[] = {0,0,0,1};
			colorText[] = {0.114,0.208,0.349,1};
			colorActive[] = {0,0,0,1};
			action = "[1,0,1,0] spawn life_fnc_locker_putinout";
			type = 1; access = 0;
			colorShadow[] = {0,0,0,0};
			colorFocused[] = {0,0,0,0.8};
			colorBackgroundActive[] = {0,0,0,0.8};
		};
		class pistolen_einleg_btn: Life_RscButton
		{
			idc = 1000028;
			text = "<";
			x = 0.54125 * safezoneW + safezoneX;
			y = 0.588 * safezoneH + safezoneY;
			w = 0.0154688 * safezoneW;
			h = 0.044 * safezoneH;
			sizeEx = 0.05;
			colorBackground[] = {0,0,0,1};
			colorText[] = {0.114,0.208,0.349,1};
			colorActive[] = {0,0,0,1};
			action = "[1,0,2,0] spawn life_fnc_locker_putinout";
			type = 1; access = 0;
			colorShadow[] = {0,0,0,0};
			colorFocused[] = {0,0,0,0.8};
			colorBackgroundActive[] = {0,0,0,0.8};
		};
		class weapon_schalli: Life_RscButton
		{
			idc = 1000029;
			text = "<";
			x = 0.568062 * safezoneW + safezoneX;
			y = 0.4978 * safezoneH + safezoneY;
			w = 0.0154688 * safezoneW;
			h = 0.0286 * safezoneH;
			sizeEx = 0.05;
			colorBackground[] = {0,0,0,1};
			colorText[] = {0.114,0.208,0.349,1};
			colorActive[] = {0,0,0,1};
			action = "[1,0,1,1] spawn life_fnc_locker_putinout";
			type = 1; access = 0;
			colorShadow[] = {0,0,0,0};
			colorFocused[] = {0,0,0,0.8};
			colorBackgroundActive[] = {0,0,0,0.8};
		};
		class weapon_bipot: Life_RscButton
		{
			idc = 1000030;
			text = "<";
			x = 0.614094 * safezoneW + safezoneX;
			y = 0.497911 * safezoneH + safezoneY;
			w = 0.0154688 * safezoneW;
			h = 0.0286 * safezoneH;
			sizeEx = 0.05;
			colorBackground[] = {0,0,0,1};
			colorText[] = {0.114,0.208,0.349,1};
			colorActive[] = {0,0,0,1};
			action = "[1,0,1,3] spawn life_fnc_locker_putinout";
			type = 1; access = 0;
			colorShadow[] = {0,0,0,0};
			colorFocused[] = {0,0,0,0.8};
			colorBackgroundActive[] = {0,0,0,0.8};
		};
		class weapon_visier: Life_RscButton
		{
			idc = 1000031;
			text = "<";
			x = 0.65675 * safezoneW + safezoneX;
			y = 0.4978 * safezoneH + safezoneY;
			w = 0.0154688 * safezoneW;
			h = 0.0286 * safezoneH;
			sizeEx = 0.05;
			colorBackground[] = {0,0,0,1};
			colorText[] = {0.114,0.208,0.349,1};
			colorActive[] = {0,0,0,1};
			action = "[1,0,1,2] spawn life_fnc_locker_putinout";
			type = 1; access = 0;
			colorShadow[] = {0,0,0,0};
			colorFocused[] = {0,0,0,0.8};
			colorBackgroundActive[] = {0,0,0,0.8};
		};
		class pistolen_schalli: Life_RscButton
		{
			idc = 1000032;
			text = "<";
			x = 0.591252 * safezoneW + safezoneX;
			y = 0.706363 * safezoneH + safezoneY;
			w = 0.0154688 * safezoneW;
			h = 0.0286 * safezoneH;
			sizeEx = 0.05;
			colorBackground[] = {0,0,0,1};
			colorText[] = {0.114,0.208,0.349,1};
			colorActive[] = {0,0,0,1};
			action = "[1,0,2,1] spawn life_fnc_locker_putinout";
			type = 1; access = 0;
			colorShadow[] = {0,0,0,0};
			colorFocused[] = {0,0,0,0.8};
			colorBackgroundActive[] = {0,0,0,0.8};
		};
		class pistolen_visier: Life_RscButton
		{
			idc = 1000033;
			text = "<";
			x = 0.63648 * safezoneW + safezoneX;
			y = 0.706941 * safezoneH + safezoneY;
			w = 0.0154688 * safezoneW;
			h = 0.0286 * safezoneH;
			sizeEx = 0.05;
			colorBackground[] = {0,0,0,1};
			colorText[] = {0.114,0.208,0.349,1};
			colorActive[] = {0,0,0,1};
			action = "[1,0,2,2] spawn life_fnc_locker_putinout";
			type = 1; access = 0;
			colorShadow[] = {0,0,0,0};
			colorFocused[] = {0,0,0,0.8};
			colorBackgroundActive[] = {0,0,0,0.8};
		};
		class weapon_take: Life_RscButton
		{
			idc = 1000034;
			text = ">";
			x = 0.464937 * safezoneW + safezoneX;
			y = 0.3636 * safezoneH + safezoneY;
			w = 0.0154688 * safezoneW;
			h = 0.044 * safezoneH;
			sizeEx = 0.05;
			colorBackground[] = {0,0,0,1};
			colorText[] = {0.114,0.208,0.349,1};
			colorActive[] = {0,0,0,1};
			action = "[1,1,1] spawn life_fnc_locker_putinout";
			type = 1; access = 0;
			colorShadow[] = {0,0,0,0};
			colorFocused[] = {0,0,0,0.8};
			colorBackgroundActive[] = {0,0,0,0.8};
		};
		class pistolen_take: Life_RscButton
		{
			idc = 1000035;
			text = ">";
			x = 0.464938 * safezoneW + safezoneX;
			y = 0.5044 * safezoneH + safezoneY;
			w = 0.0154688 * safezoneW;
			h = 0.044 * safezoneH;
			sizeEx = 0.05;
			colorBackground[] = {0,0,0,1};
			colorText[] = {0.114,0.208,0.349,1};
			colorActive[] = {0,0,0,1};
			action = "[1,1,2] spawn life_fnc_locker_putinout";
			type = 1; access = 0;
			colorShadow[] = {0,0,0,0};
			colorFocused[] = {0,0,0,0.8};
			colorBackgroundActive[] = {0,0,0,0.8};
		};
		class aufsatz_take: Life_RscButton
		{
			idc = 1000036;
			text = ">";
			x = 0.464937 * safezoneW + safezoneX;
			y = 0.6452 * safezoneH + safezoneY;
			w = 0.0154688 * safezoneW;
			h = 0.044 * safezoneH;
			sizeEx = 0.05;
			colorBackground[] = {0,0,0,1};
			colorText[] = {0.114,0.208,0.349,1};
			colorActive[] = {0,0,0,1};
			action = "[1,1,3] spawn life_fnc_locker_putinout";
			type = 1; access = 0;
			colorShadow[] = {0,0,0,0};
			colorFocused[] = {0,0,0,0.8};
			colorBackgroundActive[] = {0,0,0,0.8};
		};
		class kleidung_take: Life_RscButton
		{
			idc = 1000043;
			text = ">";
			x = 0.464937 * safezoneW + safezoneX;
			y = 0.335 * safezoneH + safezoneY;
			w = 0.0154688 * safezoneW;
			h = 0.044 * safezoneH;
			sizeEx = 0.05;
			colorBackground[] = {0,0,0,0.8};
			colorText[] = {0.114,0.208,0.349,1};
			colorActive[] = {0,0,0,1};
			action = "[0,1,1] spawn life_fnc_locker_putinout";
			type = 1;access = 0;
			colorShadow[] = {0,0,0,0};
			colorFocused[] = {0,0,0,0.8};
			colorBackgroundActive[] = {0,0,0,0.8};
		};
		class westen_take: Life_RscButton
		{
			idc = 1000044;
			text = ">";
			x = 0.464938 * safezoneW + safezoneX;
			y = 0.4604 * safezoneH + safezoneY;
			w = 0.0154688 * safezoneW;
			h = 0.044 * safezoneH;
			sizeEx = 0.05;
			colorBackground[] = {0,0,0,0.8};
			colorText[] = {0.114,0.208,0.349,1};
			colorActive[] = {0,0,0,1};
			action = "[0,1,2] spawn life_fnc_locker_putinout";
			type = 1;access = 0;
			colorShadow[] = {0,0,0,0};
			colorFocused[] = {0,0,0,0.8};
			colorBackgroundActive[] = {0,0,0,0.8};
		};
		class backpack_take: Life_RscButton
		{
			idc = 1000045;
			text = ">";
			x = 0.464937 * safezoneW + safezoneX;
			y = 0.577 * safezoneH + safezoneY;
			w = 0.0154688 * safezoneW;
			h = 0.044 * safezoneH;
			sizeEx = 0.05;
			colorBackground[] = {0,0,0,0.8};
			colorText[] = {0.114,0.208,0.349,1};
			colorActive[] = {0,0,0,1};
			action = "[0,1,3] spawn life_fnc_locker_putinout";
			type = 1;access = 0;
			colorShadow[] = {0,0,0,0};
			colorFocused[] = {0,0,0,0.8};
			colorBackgroundActive[] = {0,0,0,0.8};
		};
		class sonstigestake: Life_RscButton
		{
			idc = 1000048;
			text = ">";
			x = 0.464937 * safezoneW + safezoneX;
			y = 0.687 * safezoneH + safezoneY;
			w = 0.0154688 * safezoneW;
			h = 0.044 * safezoneH;
			sizeEx = 0.05;
			colorBackground[] = {0,0,0,0.8};
			colorText[] = {0.114,0.208,0.349,1};
			colorActive[] = {0,0,0,1};
			action = "[0,1,4] spawn life_fnc_locker_putinout";
			type = 1;access = 0;
			colorShadow[] = {0,0,0,0};
			colorFocused[] = {0,0,0,0.8};
			colorBackgroundActive[] = {0,0,0,0.8};
		};
		class helmet_drop: Life_RscButton
		{
			idc = 1000064;
			text = "<";
			x = 0.545374 * safezoneW + safezoneX;
			y = 0.7288 * safezoneH + safezoneY;
			w = 0.0154688 * safezoneW;
			h = 0.0286 * safezoneH;
			sizeEx = 0.05;
			colorBackground[] = {0,0,0,0.8};
			colorText[] = {0.114,0.208,0.349,1};
			colorActive[] = {0,0,0,1};
			action = "[0,0,4] spawn life_fnc_locker_putinout";
			type = 1;access = 0;
			colorShadow[] = {0,0,0,0};
			colorFocused[] = {0,0,0,0.8};
			colorBackgroundActive[] = {0,0,0,0.8};
		};
		class googlesdrop: Life_RscButton
		{
			idc = 1000065;
			text = "<";
			x = 0.603126 * safezoneW + safezoneX;
			y = 0.7288 * safezoneH + safezoneY;
			w = 0.0154688 * safezoneW;
			h = 0.0286 * safezoneH;
			sizeEx = 0.05;
			colorBackground[] = {0,0,0,0.8};
			colorText[] = {0.114,0.208,0.349,1};
			colorActive[] = {0,0,0,1};
			action = "[0,0,5] spawn life_fnc_locker_putinout";
			type = 1;access = 0;
			colorShadow[] = {0,0,0,0};
			colorFocused[] = {0,0,0,0.8};
			colorBackgroundActive[] = {0,0,0,0.8};
		};
		class rangefidrop: Life_RscButton
		{
			idc = 1000066;
			text = "<";
			x = 0.665 * safezoneW + safezoneX;
			y = 0.7288 * safezoneH + safezoneY;
			w = 0.0154688 * safezoneW;
			h = 0.0286 * safezoneH;
			sizeEx = 0.05;
			colorBackground[] = {0,0,0,0.8};
			colorText[] = {0.114,0.208,0.349,1};
			colorActive[] = {0,0,0,1};
			action = "[0,0,6] spawn life_fnc_locker_putinout";
			type = 1;access = 0;
			colorShadow[] = {0,0,0,0};
			colorFocused[] = {0,0,0,0.8};
			colorBackgroundActive[] = {0,0,0,0.8};
		};
		class uniformdrop: Life_RscButton
		{
			idc = 1000057;
			text = "<";
			x = 0.566635 * safezoneW + safezoneX;
			y = 0.335178 * safezoneH + safezoneY;
			w = 0.0154688 * safezoneW;
			h = 0.044 * safezoneH;
			sizeEx = 0.05;
			colorBackground[] = {0,0,0,0.8};
			colorText[] = {0.114,0.208,0.349,1};
			colorActive[] = {0,0,0,1};
			action = "[0,0,1] spawn life_fnc_locker_putinout";
			type = 1;access = 0;
			colorShadow[] = {0,0,0,0};
			colorFocused[] = {0,0,0,0.8};
			colorBackgroundActive[] = {0,0,0,0.8};
		};
		class vestdrop: Life_RscButton
		{
			idc = 1000058;
			text = "<";
			x = 0.56773 * safezoneW + safezoneX;
			y = 0.460526 * safezoneH + safezoneY;
			w = 0.0154688 * safezoneW;
			h = 0.044 * safezoneH;
			sizeEx = 0.05;
			colorBackground[] = {0,0,0,0.8};
			colorText[] = {0.114,0.208,0.349,1};
			colorActive[] = {0,0,0,1};
			action = "[0,0,2] spawn life_fnc_locker_putinout";
			type = 1;access = 0;
			colorShadow[] = {0,0,0,0};
			colorFocused[] = {0,0,0,0.8};
			colorBackgroundActive[] = {0,0,0,0.8};
		};
		class backpackdrop: Life_RscButton
		{
			idc = 1000059;
			text = "<";
			x = 0.567031 * safezoneW + safezoneX;
			y = 0.577 * safezoneH + safezoneY;
			w = 0.0174688 * safezoneW;
			h = 0.044 * safezoneH;
			sizeEx = 0.05;
			colorBackground[] = {0,0,0,0.8};
			colorText[] = {0.114,0.208,0.349,1};
			colorActive[] = {0,0,0,1};
			action = "[0,0,3] spawn life_fnc_locker_putinout";
			type = 1;access = 0;
			colorShadow[] = {0,0,0,0};
			colorFocused[] = {0,0,0,0.8};
			colorBackgroundActive[] = {0,0,0,0.8};
		};
		class sysitemtake: Life_RscButton
		{
			idc = 1000071;
			text = ">";
			x = 0.477375 * safezoneW + safezoneX;
			y = 0.4912 * safezoneH + safezoneY;
			w = 0.0174689 * safezoneW;
			h = 0.044 * safezoneH;
			sizeEx = 0.05;
			colorBackground[] = {0,0,0,0.8};
			colorText[] = {0.114,0.208,0.349,1};
			colorActive[] = {0,0,0,1};
			action = "";
			type = 1;access = 0;
			colorShadow[] = {0,0,0,0};
			colorFocused[] = {0,0,0,0.8};
			colorBackgroundActive[] = {0,0,0,0.8};
		};
		class sysitemdrop: Life_RscButton
		{
			idc = 1000076;
			text = "<";
			x = 0.507219 * safezoneW + safezoneX;
			y = 0.4912 * safezoneH + safezoneY;
			w = 0.0174689 * safezoneW;
			h = 0.044 * safezoneH;
			sizeEx = 0.05;
			colorBackground[] = {0,0,0,0.8};
			colorText[] = {0.114,0.208,0.349,1};
			colorActive[] = {0,0,0,1};
			action = "";
			type = 1;access = 0;
			colorShadow[] = {0,0,0,0};
			colorFocused[] = {0,0,0,0.8};
			colorBackgroundActive[] = {0,0,0,0.8};
		};
		class bekleidungswitch: Life_RscText
		{
			idc = 1000070;
			x = 0.270032 * safezoneW + safezoneX;
			y = 0.258 * safezoneH + safezoneY;
			w = 0.113453 * safezoneW;
			h = 0.01155 * safezoneH;
			colorBackground[] = {0,0,0,0.8};
		};
		class waffenswitch: Life_RscText
		{
			idc = 1000002;
			x = 0.386496 * safezoneW + safezoneX;
			y = 0.258 * safezoneH + safezoneY;
			w = 0.113453 * safezoneW;
			h = 0.01155 * safezoneH;
			colorBackground[] = {0,0,0,0.8};
		};
		class itemswitch: Life_RscText
		{
			idc = 1000003;
			x = 0.502436 * safezoneW + safezoneX;
			y = 0.258 * safezoneH + safezoneY;
			w = 0.112422 * safezoneW;
			h = 0.01155 * safezoneH;
			colorBackground[] = {0,0,0,0.8};
		};
		class virtitemswitch: Life_RscText
		{
			idc = 1000078;
			x = 0.61789 * safezoneW + safezoneX;
			y = 0.258 * safezoneH + safezoneY;
			w = 0.112937 * safezoneW;
			h = 0.01155 * safezoneH;
			colorBackground[] = {0,0,0,0.8};
		};
		class RscText_1005: Life_RscText
		{
			idc = 1000004;
			x = 0.497937 * safezoneW + safezoneX;
			y = 0.291 * safezoneH + safezoneY;
			w = 0.0061876 * safezoneW;
			h = 0.484 * safezoneH;
			colorBackground[] = {0.129,0.451,1,1};
		};
		class RscText_1007: Life_RscText
		{
			idc = 1000005;
			text = "$STR_locker_primweap";
			x = 0.298906 * safezoneW + safezoneX;
			y = 0.3262 * safezoneH + safezoneY;
			w = 0.0639374 * safezoneW;
			h = 0.0176 * safezoneH;
		};
		class primaelistbox: Life_RscListbox
		{
			idc = 1000006;
			x = 0.302 * safezoneW + safezoneX;
			y = 0.3438 * safezoneH + safezoneY;
			w = 0.160867 * safezoneW;
			h = 0.0792 * safezoneH;
			sizeEx = 0.04;
		};
		class RscText_1008: Life_RscText
		{
			idc = 1000007;
			text = "$STR_locker_handguns";
			x = 0.298906 * safezoneW + safezoneX;
			y = 0.467 * safezoneH + safezoneY;
			w = 0.0639374 * safezoneW;
			h = 0.0176 * safezoneH;
		};
		class pistolenlistbox: Life_RscListbox
		{
			idc = 1000008;
			x = 0.302 * safezoneW + safezoneX;
			y = 0.4846 * safezoneH + safezoneY;
			w = 0.160867 * safezoneW;
			h = 0.0792 * safezoneH;
			sizeEx = 0.04;
		};
		class RscText_1009: Life_RscText
		{
			idc = 1000009;
			text = "$STR_locker_attach";
			x = 0.298906 * safezoneW + safezoneX;
			y = 0.6078 * safezoneH + safezoneY;
			w = 0.0639374 * safezoneW;
			h = 0.0176 * safezoneH;
		};
		class aufsatzlistbox: Life_RscListbox
		{
			idc = 1000010;
			x = 0.302 * safezoneW + safezoneX;
			y = 0.6254 * safezoneH + safezoneY;
			w = 0.160867 * safezoneW;
			h = 0.0792 * safezoneH;
			sizeEx = 0.04;
		};
		class RscText_1006: Life_RscText
		{
			idc = -1;
			x = 0.270032 * safezoneW + safezoneX;
			y = 0.775 * safezoneH + safezoneY;
			w = 0.460942 * safezoneW;
			h = 0.0022 * safezoneH;
			colorBackground[] = {0.129,0.451,1,1};
		};
		class weaponpicture: Life_RscPicture
		{
			idc = 1000011;
			text = "\A3\Ui_f\data\GUI\Rsc\RscDisplayGear\ui_gear_primary_gs.paa";
			x = 0.563931 * safezoneW + safezoneX;
			y = 0.3636 * safezoneH + safezoneY;
			w = 0.109325 * safezoneW;
			h = 0.077 * safezoneH;
		};
		class weaponframe: Life_RscFrame
		{
			idc = 1000012;
			x = 0.562895 * safezoneW + safezoneX;
			y = 0.3614 * safezoneH + safezoneY;
			w = 0.114465 * safezoneW;
			h = 0.0814 * safezoneH;
		};
		class pistolenframe: Life_RscFrame
		{
			idc = 1000013;
			x = 0.562895 * safezoneW + safezoneX;
			y = 0.5726 * safezoneH + safezoneY;
			w = 0.114465 * safezoneW;
			h = 0.0814 * safezoneH;
		};
		class pistolenpicture: Life_RscPicture
		{
			idc = 1000014;
			text = "\A3\Ui_f\data\GUI\Rsc\RscDisplayGear\ui_gear_hgun_gs.paa";
			x = 0.561864 * safezoneW + safezoneX;
			y = 0.5748 * safezoneH + safezoneY;
			w = 0.114465 * safezoneW;
			h = 0.0814 * safezoneH;
		};
		class RscPicture_1202: Life_RscPicture
		{
			idc = 1000015;
			text = "\A3\Ui_f\data\GUI\Rsc\RscDisplayGear\ui_gear_muzzle_gs.paa";
			x = 0.564957 * safezoneW + safezoneX;
			y = 0.4582 * safezoneH + safezoneY;
			w = 0.0226873 * safezoneW;
			h = 0.0286 * safezoneH;
		};
		class RscFrame_1802: Life_RscFrame
		{
			idc = 1000016;
			x = 0.562893 * safezoneW + safezoneX;
			y = 0.456 * safezoneH + safezoneY;
			w = 0.026813 * safezoneW;
			h = 0.0352 * safezoneH;
		};
		class RscFrame_1803: Life_RscFrame
		{
			idc = 1000017;
			x = 0.651582 * safezoneW + safezoneX;
			y = 0.456 * safezoneH + safezoneY;
			w = 0.026813 * safezoneW;
			h = 0.0352 * safezoneH;
		};
		class RscFrame_1804: Life_RscFrame
		{
			idc = 1000018;
			x = 0.608269 * safezoneW + safezoneX;
			y = 0.456 * safezoneH + safezoneY;
			w = 0.026813 * safezoneW;
			h = 0.0352 * safezoneH;
		};
		class RscPicture_1203: Life_RscPicture
		{
			idc = 1000019;
			text = "\A3\Ui_f\data\GUI\Rsc\RscDisplayGear\ui_gear_bipod_gs.paa";
			x = 0.6093 * safezoneW + safezoneX;
			y = 0.4582 * safezoneH + safezoneY;
			w = 0.0226873 * safezoneW;
			h = 0.0286 * safezoneH;
		};
		class RscPicture_1204: Life_RscPicture
		{
			idc = 1000020;
			text = "\A3\Ui_f\data\GUI\Rsc\RscDisplayGear\ui_gear_top_gs.paa";
			x = 0.653644 * safezoneW + safezoneX;
			y = 0.4582 * safezoneH + safezoneY;
			w = 0.0226873 * safezoneW;
			h = 0.0286 * safezoneH;
		};
		class RscFrame_1805: Life_RscFrame
		{
			idc = 1000021;
			x = 0.586616 * safezoneW + safezoneX;
			y = 0.665 * safezoneH + safezoneY;
			w = 0.026813 * safezoneW;
			h = 0.0352 * safezoneH;
		};
		class RscFrame_1806: Life_RscFrame
		{
			idc = 1000022;
			x = 0.630953 * safezoneW + safezoneX;
			y = 0.665 * safezoneH + safezoneY;
			w = 0.026813 * safezoneW;
			h = 0.0352 * safezoneH;
		};
		class RscPicture_1205: Life_RscPicture
		{
			idc = 1000023;
			text = "\A3\Ui_f\data\GUI\Rsc\RscDisplayGear\ui_gear_muzzle_gs.paa";
			x = 0.588685 * safezoneW + safezoneX;
			y = 0.6672 * safezoneH + safezoneY;
			w = 0.0226873 * safezoneW;
			h = 0.0286 * safezoneH;
		};
		class RscPicture_1206: Life_RscPicture
		{
			idc = 1000024;
			text = "\A3\Ui_f\data\GUI\Rsc\RscDisplayGear\ui_gear_top_gs.paa";
			x = 0.632791 * safezoneW + safezoneX;
			y = 0.667022 * safezoneH + safezoneY;
			w = 0.0226873 * safezoneW;
			h = 0.0286 * safezoneH;
		};
		class weapontitle: Life_RscText
		{
			idc = 1000025;
			text = "";
			x = 0.558782 * safezoneW + safezoneX;
			y = 0.3394 * safezoneH + safezoneY;
			w = 0.121683 * safezoneW;
			h = 0.022 * safezoneH;
			style = 2;
		};
		class RscText_546445: Life_RscText
		{
			idc = 1000026;
			text = "";
			x = 0.558781 * safezoneW + safezoneX;
			y = 0.5506 * safezoneH + safezoneY;
			w = 0.122714 * safezoneW;
			h = 0.022 * safezoneH;
			style = 2;
		};
		class RscText_54645: Life_RscText
		{
			idc = 1000037;
			text = "$STR_locker_cloth_title";
			x = 0.298906 * safezoneW + safezoneX;
			y = 0.302 * safezoneH + safezoneY;
			w = 0.0639374 * safezoneW;
			h = 0.0176 * safezoneH;
		};
		class kleidungbox: Life_RscListbox
		{
			idc = 1000038;
			x = 0.302 * safezoneW + safezoneX;
			y = 0.3196 * safezoneH + safezoneY;
			w = 0.160867 * safezoneW;
			h = 0.0792 * safezoneH;
			sizeEx = 0.04;
		};
		class RscText_10208: Life_RscText
		{
			idc = 1000039;
			text = "$STR_locker_vests";
			x = 0.298906 * safezoneW + safezoneX;
			y = 0.4196 * safezoneH + safezoneY;
			w = 0.0639374 * safezoneW;
			h = 0.0176 * safezoneH;
		};
		class westenlistbox: Life_RscListbox
		{
			idc = 1000040;
			x = 0.302 * safezoneW + safezoneX;
			y = 0.4406 * safezoneH + safezoneY;
			w = 0.160867 * safezoneW;
			h = 0.0792 * safezoneH;
			sizeEx = 0.04;
		};
		class RscText_10209: Life_RscText
		{
			idc = 1000041;
			text = "$STR_locker_backpacks";
			x = 0.298906 * safezoneW + safezoneX;
			y = 0.5396 * safezoneH + safezoneY;
			w = 0.0639374 * safezoneW;
			h = 0.0176 * safezoneH;
		};
		class rucksacklistbox: Life_RscListbox
		{
			idc = 1000042;
			x = 0.302 * safezoneW + safezoneX;
			y = 0.5572 * safezoneH + safezoneY;
			w = 0.160867 * safezoneW;
			h = 0.0792 * safezoneH;
			sizeEx = 0.04;
		};
		class RscText_10110: Life_RscText
		{
			idc = 1000046;
			text = "$STR_locker_other";
			x = 0.298906 * safezoneW + safezoneX;
			y = 0.6518 * safezoneH + safezoneY;
			w = 0.0639374 * safezoneW;
			h = 0.0176 * safezoneH;
		};
		class sonstigeslistbox: Life_RscListbox
		{
			idc = 1000047;
			x = 0.301999 * safezoneW + safezoneX;
			y = 0.6694 * safezoneH + safezoneY;
			w = 0.160867 * safezoneW;
			h = 0.0792 * safezoneH;
			sizeEx = 0.04;
		};
		class helmpic: Life_RscPicture
		{
			idc = 1000049;
			text = "\A3\Ui_f\data\GUI\Rsc\RscDisplayGear\ui_gear_helmet_gs.paa";
			x = 0.535054 * safezoneW + safezoneX;
			y = 0.6716 * safezoneH + safezoneY;
			w = 0.0391876 * safezoneW;
			h = 0.0506 * safezoneH;
		};
		class googlespic: Life_RscPicture
		{
			idc = 1000050;
			text = "\A3\Ui_f\data\GUI\Rsc\RscDisplayGear\ui_gear_glasses_gs.paa";
			x = 0.592812 * safezoneW + safezoneX;
			y = 0.6694 * safezoneH + safezoneY;
			w = 0.04125 * safezoneW;
			h = 0.055 * safezoneH;
		};
		class backpackpic: Life_RscPicture
		{
			idc = 1000051;
			text = "\A3\Ui_f\data\GUI\Rsc\RscDisplayGear\ui_gear_backpack_gs.paa";
			x = 0.58559 * safezoneW + safezoneX;
			y = 0.5594 * safezoneH + safezoneY;
			w = 0.0546561 * safezoneW;
			h = 0.0792 * safezoneH;
		};
		class uniformpic: Life_RscPicture
		{
			idc = 1000052;
			text = "\A3\Ui_f\data\GUI\Rsc\RscDisplayGear\ui_gear_uniform_gs.paa";
			x = 0.585592 * safezoneW + safezoneX;
			y = 0.3196 * safezoneH + safezoneY;
			w = 0.0546561 * safezoneW;
			h = 0.0792 * safezoneH;
		};
		class vestpic: Life_RscPicture
		{
			idc = 1000053;
			text = "\A3\Ui_f\data\GUI\Rsc\RscDisplayGear\ui_gear_vest_gs.paa";
			x = 0.585589 * safezoneW + safezoneX;
			y = 0.4428 * safezoneH + safezoneY;
			w = 0.0546561 * safezoneW;
			h = 0.0792 * safezoneH;
		};
		class RscFrame_18400: Life_RscFrame
		{
			idc = 1000054;
			x = 0.58559 * safezoneW + safezoneX;
			y = 0.5594 * safezoneH + safezoneY;
			w = 0.0546561 * safezoneW;
			h = 0.0792 * safezoneH;
		};
		class RscFrame_14401: Life_RscFrame
		{
			idc = 1000055;
			x = 0.585592 * safezoneW + safezoneX;
			y = 0.3174 * safezoneH + safezoneY;
			w = 0.0546561 * safezoneW;
			h = 0.0836 * safezoneH;
		};
		class RscFrame_14802: Life_RscFrame
		{
			idc = 1000056;
			x = 0.585589 * safezoneW + safezoneX;
			y = 0.4428 * safezoneH + safezoneY;
			w = 0.0546561 * safezoneW;
			h = 0.0792 * safezoneH;
		};
		class binocularpic: Life_RscPicture
		{
			idc = 1000060;
			text = "\A3\Ui_f\data\GUI\Rsc\RscDisplayGear\ui_gear_binocular_gs.paa";
			x = 0.651596 * safezoneW + safezoneX;
			y = 0.6694 * safezoneH + safezoneY;
			w = 0.04125 * safezoneW;
			h = 0.055 * safezoneH;
		};
		class RscFrame_18503: Life_RscFrame
		{
			idc = 1000061;
			x = 0.592812 * safezoneW + safezoneX;
			y = 0.6694 * safezoneH + safezoneY;
			w = 0.04125 * safezoneW;
			h = 0.055 * safezoneH;
		};
		class RscFrame_18504: Life_RscFrame
		{
			idc = 1000062;
			x = 0.651596 * safezoneW + safezoneX;
			y = 0.6694 * safezoneH + safezoneY;
			w = 0.04125 * safezoneW;
			h = 0.055 * safezoneH;
		};
		class RscFrame_18055: Life_RscFrame
		{
			idc = 1000063;
			x = 0.534023 * safezoneW + safezoneX;
			y = 0.6694 * safezoneH + safezoneY;
			w = 0.04125 * safezoneW;
			h = 0.055 * safezoneH;
		};
		class uniformtitle: Life_RscText
		{
			idc = 1000067;
			text = "";
			x = 0.542282 * safezoneW + safezoneX;
			y = 0.2954 * safezoneH + safezoneY;
			w = 0.139219 * safezoneW;
			h = 0.022 * safezoneH;
			style = 2;
		};
		class vesttitle: Life_RscText
		{
			idc = 1000068;
			text = "";
			x = 0.540219 * safezoneW + safezoneX;
			y = 0.4208 * safezoneH + safezoneY;
			w = 0.139219 * safezoneW;
			h = 0.022 * safezoneH;
			style = 2;
		};
		class backpacktitle: Life_RscText
		{
			idc = 1000069;
			text = "";
			x = 0.540216 * safezoneW + safezoneX;
			y = 0.5374 * safezoneH + safezoneY;
			w = 0.139219 * safezoneW;
			h = 0.022 * safezoneH;
			style = 2;
		};
		class RscListbox_150: Life_RscListbox
		{
			idc = 1000072;
			x = 0.289625 * safezoneW + safezoneX;
			y = 0.335 * safezoneH + safezoneY;
			w = 0.185625 * safezoneW;
			h = 0.4158 * safezoneH;
			sizeEx = 0.04;
		};
		class text1231: Life_RscText
		{
			idc = 1000073;
			text = "$STR_locker_items";
			x = 0.287594 * safezoneW + safezoneX;
			y = 0.313 * safezoneH + safezoneY;
			w = 0.134062 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class RscListbox_101: Life_RscListbox
		{
			idc = 1000074;
			x = 0.52775 * safezoneW + safezoneX;
			y = 0.335 * safezoneH + safezoneY;
			w = 0.185625 * safezoneW;
			h = 0.4158 * safezoneH;
			sizeEx = 0.04;
		};
		class text4843: Life_RscText
		{
			idc = 1000075;
			text = "$STR_locker_yitems";
			x = 0.524657 * safezoneW + safezoneX;
			y = 0.313 * safezoneH + safezoneY;
			w = 0.134062 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class RscText_11214: Life_RscText
		{
			idc = 1000077;
			text = "";
			x = 0.600031 * safezoneW + safezoneX;
			y = 0.1832 * safezoneH + safezoneY;
			w = 0.125 * safezoneW; // 0.460884
			h = 0.033 * safezoneH;
			style = 1;
		};
		class RscButtonSA: Life_RscButton
		{
			idc = 1000079;
			text = "$STR_locker_upgrade";
			x = 0.270031 * safezoneW + safezoneX;
			y = 0.7794 * safezoneH + safezoneY;
			w = 0.113465 * safezoneW;
			h = 0.033 * safezoneH;
			colorBackground[] = {0,0,0,0.8};
			colorText[] = {0.114,0.208,0.349,1};
			colorActive[] = {0,0,0,1};
			action = "0 spawn life_fnc_locker_updateLevel";
			type = 1;access = 0;
			colorShadow[] = {0,0,0,0};
			colorFocused[] = {0,0,0,0.8};
			colorBackgroundActive[] = {0,0,0,0.8};
			offsetPressedX = 0;
			offsetPressedY = 0;
		};
		class RscEdit_14001: Life_RscEdit
		{
			idc = 1000080;
			text = "1"; //rechts
			x = 0.508249 * safezoneW + safezoneX;
			y = 0.5418 * safezoneH + safezoneY;
			w = 0.0164377 * safezoneW;
			h = 0.0286 * safezoneH;
			maxChars = 2;
			style = 2;
		};
		class RscEdit_14022: Life_RscEdit
		{
			idc = 1000081;
			text = "1"; //links
			x = 0.478406 * safezoneW + safezoneX;
			y = 0.5418 * safezoneH + safezoneY;
			w = 0.0164377 * safezoneW;
			h = 0.0286 * safezoneH;
			maxChars = 2;
			style = 2;
		};
	};
};