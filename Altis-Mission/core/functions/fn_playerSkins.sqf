#include "..\..\script_macros.hpp"
/*
    File: fn_playerSkins.sqf
    Author: Daniel Stuart

    Description:
    Sets skins for players by their side and uniform.
*/
private ["_skinName"];

switch (playerSide) do {
    case civilian: {
			if(uniform player isEqualTo "U_C_Poloshirt_blue")then {
			player setObjectTextureGlobal [0, "texture\uni\sl_spawn.jpg"];
			};
			
			if(license_civ_venox)then{
            _pfad = "texture\donator\kleidung\Venox\";
            if (uniform player isEqualTo "U_I_CombatUniform") then {
                player setObjectTextureGlobal [0, _pfad + "venox.jpg"];
			};
		};
			
		if(license_civ_venox)then{
            _pfad = "texture\donator\kleidung\Venox\";
            if (backpack player isEqualTo "B_ViperHarness_blk_F") then {
               (unitBackpack player) setObjectTextureGlobal [0, _pfad + "venox_ruck.jpg"];
			};
		};	
			
		if(license_civ_ktm2)then{
            _pfad = "texture\donator\kleidung\KTM\";
            if (uniform player isEqualTo "U_I_CombatUniform_shortsleeve") then {
                player setObjectTextureGlobal [0, _pfad + "ktm_civ.jpg"];
			};
		};	
		if(license_civ_ktm2)then{
            _pfad = "texture\donator\kleidung\KTM\";
            if (backpack player isEqualTo "B_ViperHarness_khk_F") then {
                (unitBackpack player) setObjectTextureGlobal [0, _pfad + "ruck_ktm_civ.jpg"];
			};
		};
	};
	
    case west: {
        if (uniform player isEqualTo "U_Rangemaster") then {
            player setObjectTextureGlobal [0, "texture\uni\Pol_Kurzarm.jpg"];
        };
		
		if (uniform player in ["U_B_CTRG_3","U_B_CTRG_1"]) then {
            player setObjectTextureGlobal [0, "texture\uni\Pol_Langarm.jpg"];
        };
		
		if (uniform player isEqualTo "U_C_Man_casual_2_F") then {
            player setObjectTextureGlobal [0, "texture\uni\Leitung_Kurzarm.jpg"];
        };
		
		if (uniform player in ["U_B_CTRG_Soldier_urb_1_F","U_B_CTRG_Soldier_urb_3_F"]) then {
            player setObjectTextureGlobal [0, "texture\uni\Leitung_Langarm.jpg"];
        };
		
		if((backpack player) != "")then {
			(unitBackpack player) setObjectTextureGlobal [0, ""];
		};
		
		if(license_cop_ktm)then{
            _pfad = "texture\donator\kleidung\KTM\";
            if (uniform player isEqualTo "U_I_CombatUniform_shortsleeve") then {
                player setObjectTextureGlobal [0, _pfad + "U_flake.jpg"];
            };
		};
    };
    case independent: {
        if (uniform player in ["U_I_CombatUniform","U_I_CombatUniform_shortsleeve"]) then {
			if((FETCH_CONST(life_medicLevel)) <= 4) then {
				player setObjectTextureGlobal [0, "texture\uni\rd_uni1.paa"];
			} else {
				if((FETCH_CONST(life_medicLevel)) >= 8) then {
					player setObjectTextureGlobal [0, "texture\uni\rd_uni3.paa"];
				} else {
					player setObjectTextureGlobal [0, "texture\uni\rd_uni2.paa"];
				};
			};
        };
		
		if((backpack player) != "")then {
			(unitBackpack player) setObjectTextureGlobal [0, ""];
		};
    };
	case east: {
		if((backpack player) != "")then {
			(unitBackpack player) setObjectTextureGlobal [0, ""];
		};
	};
};