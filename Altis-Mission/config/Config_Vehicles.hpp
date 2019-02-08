class CarShops {
    /*
     *    ARRAY FORMAT:
     *        0: STRING (Classname)
     *        1: ARRAY (This is for limiting items to certain things)
     *            0: Variable to read from
     *            1: Variable Value Type (SCALAR / BOOL /EQUAL)
     *            2: What to compare to (-1 = Check Disabled)
     *
     *   BLUFOR Vehicle classnames can be found here: https://community.bistudio.com/wiki/Arma_3_CfgVehicles_WEST
     *   OPFOR Vehicle classnames can be found here: https://community.bistudio.com/wiki/Arma_3_CfgVehicles_EAST
     *   Independent Vehicle classnames can be found here: https://community.bistudio.com/wiki/Arma_3_CfgVehicles_GUER
     *   Civilian Vehicle classnames can be found here: https://community.bistudio.com/wiki/Arma_3_CfgVehicles_CIV
     */
    class civ_car {
        side = "civ";
		title = "Zivilisten Fahrzeuge";
        conditions = "license_civ_driver";
        vehicles[] = {
            {
                "C_Offroad_01_F",
                ""
            },
            {
                "C_Hatchback_01_F",
                ""
            },
            {
                "C_Offroad_02_unarmed_F",
                ""
            },
			{
                "C_SUV_01_F",
                ""
            },
			{
                "C_Hatchback_01_sport_F",
                ""
            },
			{
                "C_Van_02_transport_F",
                ""
            },
			{
                "C_Van_01_transport_F",
                ""
            },
			{
                "C_Van_01_box_F",
                ""
            },
			{
                "C_Van_02_vehicle_F",
                ""
            },
            {
                "C_Van_01_fuel_F",
                ""
            }
        };
    };

    class kart_shop {
        side = "civ";
		title = "Kart Shop";
        conditions = "";
        vehicles[] = {
            {
                "C_Kart_01_Blu_F",
                ""
            },
            {
                "C_Kart_01_Fuel_F",
                ""
            },
            {
                "C_Kart_01_Red_F",
                ""
            },
            {
                "C_Kart_01_Vrana_F",
                ""
            },
            {
              "C_Kart_01_F",
              ""
            }
        };
    };

    class civ_truck {
        side = "civ";
		title = "Zivilisten Lastkraftwagen";
        conditions = "license_civ_trucking";
        vehicles[] = {
			//Zamack
            {
                "I_Truck_02_fuel_F",
                ""
            },
            {
                "I_Truck_02_transport_F",
                ""
            },
            {
                "I_Truck_02_covered_F",
                ""
            },
			//Tempest
            {
                "O_Truck_03_fuel_F",
                ""
            },
            {
                "O_Truck_03_transport_F",
                ""
            },
            {
              "O_Truck_03_covered_F",
              ""
            },
            {
              "O_Truck_03_device_F",
              ""
            },
			//Hemmet
            {
              "B_Truck_01_fuel_F",
              ""
            },
            {
              "B_Truck_01_transport_F",
              ""
            },
            {
              "B_Truck_01_covered_F",
              ""
            }
        };
    };

    class civ_air {
        side = "civ";
		title = "Zivilisten Luftfahrzeuge";
        conditions = "license_civ_pilot";
        vehicles[] = {
            {
                "C_Heli_Light_01_civil_F",   //M-900
                ""
            },
			{
                "B_Heli_Light_01_F",		//MH-9 Hummingbird
                ""
            },
			{
                "O_Heli_Light_02_unarmed_F",		//P0-30 Orca
                ""
            },
			{
                "I_Heli_Transport_02_F",			//Mohawk
                ""
            },
			{
                "O_Heli_Transport_04_F",		//Taru
                ""
            },
			{
                "O_Heli_Transport_04_box_F",		//Taru (Cargo)
                ""
            },
			{
                "B_Heli_Transport_03_unarmed_F",			//Huron
                ""
            },
			{
                "C_Plane_Civil_01_F",			//Ceasar
                ""
            }
        };
    };

    class civ_ship {
        side = "civ";
		title = "Zivilisten Bootshop";
        conditions = "license_civ_boat";
        vehicles[] = {
            {
                "C_Rubberboat",
                ""
            },
            {
                "C_Boat_Civil_01_F",
                ""
            },
            {
                "C_Boat_Transport_02_F",
                ""
            }, //Apex DLC
            {
                "C_Scooter_Transport_01_F",
                ""
            } //Apex DLC
        };
    };

    class reb_car {
        side = "civ";
		title = "Rebellen Fahrzeuge";
        conditions = "license_civ_rebel";
        vehicles[] = {
			{
              "B_T_LSV_01_unarmed_F",
              ""
            },
			{
              "O_T_LSV_02_unarmed_F",		//Quilin	
              ""
            },
			{
              "B_MRAP_01_F",
              ""
            },
			{
              "O_MRAP_02_F",
              ""
            }
        };
    };

    class reb_air {
        side = "civ";
		title = "Rebellen Luftfahrzeuge";
        conditions = "license_civ_rebel";
        vehicles[] = {
            {
                "B_Heli_Light_01_F",
                ""
            },
			//{
            //    "I_Heli_light_03_unarmed_F",
            //    ""
            //},
			{
                "O_Heli_Transport_04_bench_F",
                ""
            }
        };
    };
	
	class reb_boot {  //Muss noch auf die Mapp!
        side = "civ";
		title = "Rebellen Bootshop";
        conditions = "license_civ_rebel";
        vehicles[] = {
            {
                "C_Boat_Civil_01_F",
                ""
            },
			{
                "C_Boat_Transport_02_F",
                ""
            }
        };
    };

    class med_shop {
        side = "med";
		title = "Rettungsdienst Fahrzeuge";
        conditions = "";
        vehicles[] = {
			{
                "B_Quadbike_01_F",
                "call life_mediclevel >= 1"
            },
            {
                "C_Offroad_01_F",
                "call life_mediclevel >= 1"
            },
            {
                "C_SUV_01_F",
                "call life_mediclevel >= 5"
            },
            {
                "C_Hatchback_01_sport_F",
                "call life_mediclevel >= 3"
            },
			{
                "C_Van_02_medevac_F",  //Transporter medic
                "call life_mediclevel >= 2"
            },
			{
                "B_GEN_Van_02_vehicle_F",  //Transporter normal
                "call life_mediclevel >= 2"
            },
			{
                "B_T_LSV_01_unarmed_F",  //Prowler
                "call life_mediclevel >= 7"
            },
			{
                "I_MRAP_03_F",  //Strider
                "call life_mediclevel >= 8"
			},
			{
				"B_APC_Tracked_01_CRV_F",  //Bobcat
				"call life_mediclevel >= 10"
			},
			{
				"C_Hatchback_01_F",  //Limo normal
				"call life_mediclevel >= 3"
			},
			{
				"B_Truck_01_transport_F",  //Tempest
				"call life_mediclevel >= 5"
			},
			{
				"O_Truck_03_fuel_F",  //Tempest tanken
				"call life_mediclevel >= 6"
			},
			{
				"O_Truck_03_repair_F",  //Tempest Repair
				"call life_mediclevel >= 6"
			},
			{
				"O_Truck_03_medical_F",  //Tempest Medical
				"call life_mediclevel >= 6"
			},
			{
				"O_Truck_03_ammo_F",  //Tempest Munition
				"call life_mediclevel >= 9"
            }
        };
    };

    class med_air {
        side = "med";
		title = "Rettungsdienst Luftfahrzeuge";
        conditions = "";
        vehicles[] = {
            {
                "C_Heli_Light_01_civil_F",  //M-900
                "call life_mediclevel >= 2"
            },
			{
                "B_Heli_Light_01_F",  //Hummingbird
                "call life_mediclevel >= 2"
            },
			{
                "O_Heli_Light_02_unarmed_F",  //Orca
                "call life_mediclevel >= 5"
            },
			{
                "I_Heli_light_03_unarmed_F",  //Hellcat
                "call life_mediclevel >= 7"
            },
			{
                "O_Heli_Transport_04_medevac_F",  //Taru Med
                "call life_mediclevel >= 7"
			},
			{
				"B_T_VTOL_01_vehicle_F",   //Blackfisch Vehicle
				"call life_mediclevel >=7"
			},
			{
				"B_T_VTOL_01_infantry_F",   //Blackfisch Transport
				"call life_mediclevel >=7"
			},
			{
				"B_Heli_Transport_03_unarmed_F",   //Huron
				"call life_mediclevel >=9"
            }
        };
    };
	
	class med_boot {  //Muss noch auf die Mapp!
        side = "med";
		title = "Rettungsdienst Bootshop";
        conditions = "";
        vehicles[] = {
            {
                "C_Boat_Civil_01_F",
                ""
            },
			{
                "C_Boat_Transport_02_F",
                ""
            }
        };
    };

    class cop_car {
        side = "cop";
		title = "Polizei Fahrzeuge";
        conditions = "";
        vehicles[] = {
			{
              "C_Offroad_01_F",
              "call life_coplevel >= 2"
            },//C_Offroad_02_unarmed_F
			{
              "C_Offroad_02_unarmed_F",
              "call life_coplevel >= 3"
            },
            {
              "C_SUV_01_F",
              "call life_coplevel >= 3"
            },
            {
                "C_Hatchback_01_sport_F",
                "call life_coplevel >= 4"
            },
			{
                "B_GEN_Van_02_transport_F",
                "call life_coplevel >= 3"
            },
            {
                "B_GEN_Van_02_vehicle_F",
                "call life_coplevel >= 3"
            },
			{
                "B_T_LSV_01_unarmed_F",
                "call life_coplevel >= 5"
            },
			{
                "O_T_LSV_02_unarmed_F",
                "call life_coplevel >= 5"
            },
			{
                "B_MRAP_01_F",
                "call life_coplevel >= 7"
            },
			{
                "O_MRAP_02_F",
                "call life_coplevel >= 6"
            },
			{
                "I_MRAP_03_F",
                "call life_coplevel >= 8"
            }
        };
    };

    class cop_air {
        side = "cop";
		title = "Polizei Luftfahrzeuge";
        conditions = "";
        vehicles[] = {
			{
                "B_Heli_Light_01_F",  //Hummi
                "call life_coplevel >= 3"
            },
			{
                "O_Heli_Light_02_unarmed_F",  //Orca
                "call life_coplevel >= 4"
            },
			{
                "I_Heli_light_03_unarmed_F",  //Hellcat
                "call life_coplevel >= 5"
            },
			{
                "B_Heli_Attack_01_F",  //Blackfoot
                "call life_coplevel >= 7"
            },
			{
                "B_Heli_Transport_01_F",  //Ghosthawk
                "call life_coplevel >= 7"
            },
			{
                "B_Heli_Transport_03_unarmed_F",  //Huron
                "call life_coplevel >= 8"
            },
			{
                "I_Heli_Transport_02_F",  //Mohawk
                "call life_coplevel >= 6"
			},
			{
				"B_T_VTOL_01_vehicle_F", //Blackfish Vehicle
				"call life_coplevel >= 10"
			},
			{
				"O_Heli_Transport_04_bench_F",  //Taru Bank
				"call life_coplevel >= 6"
            }
        };
    };

    class cop_ship {
        side = "cop";
		title = "Polizei Bootshop";
        conditions = "";
        vehicles[] = {
            {
                "C_Boat_Civil_01_F",
                "call life_coplevel >= 1"
            },
            {
                "C_Boat_Transport_02_F",
                "call life_coplevel >= 1"
            },
			{
                "I_Boat_Armed_01_minigun_F",
                "call life_coplevel >= 1"
            }
        };
    };
};

class LifeCfgVehicles {
    /*
     *    Vehicle Configs (Contains textures and other stuff)
     *
     *    "price" is the price before any multipliers set in Master_Config are applied.
     *
     *    Default Multiplier Values & Calculations:
     *       Civilian [Purchase, Sell]: [1.0, 0.5]
     *       Cop [Purchase, Sell]: [0.5, 0.5]
     *       Medic [Purchase, Sell]: [0.75, 0.5]
     *       ChopShop: Payout = price * 0.25
     *       GarageSell: Payout = price * [0.5, 0.5, 0.5, -1]
     *       Cop Impound: Payout = price * 0.1
     *       Pull Vehicle from Garage: Cost = price * [1, 0.5, 0.75, -1] * [0.5, 0.5, 0.5, -1]
     *           -- Pull Vehicle & GarageSell Array Explanation = [civ,cop,medic,east]
     *
     *       1: ARRAY (license required)
     *         Ex: { "driver", "" , "" , "" } //civilian, west, independent, east
     *         licenses[] = { {"CIV"}, {"COP"}, {"MEDIC"}, {"EAST"} };
     *    Textures config follows { Texture Name, side, {texture(s)path}}
     *    Texture(s)path follows this format:
     *    INDEX 0: Texture Layer 0
     *    INDEX 1: Texture Layer 1
     *    INDEX 2: Texture Layer 2
     *    etc etc etc
     *
     * 
     * BITTE BEI JEDEM FAHRZEUG NOCH EIN ARRAY HINZUFÜGEN (MATERIALS)!!! ----> Beispiel C_Boat_Transport_02_F
     * DEN MIT ZAHLEN FÜLLEN, DIE ZAHLEN FINDEST DU HERAUS, INDEM DU IN DEN EDEN EDITOR GEHST UND DICH INS FAHRZEUG REINSETZT UND IN DIE KONSOLE DAS EINGIBST:
     * 
     0 spawn {private _str = ""; {vehicle player setObjectMaterialGlobal [_foreachIndex,"a3\data_f\lights\car_beacon_red_emit.rvmat"]; _result = ["Willst du den Part mit Material faerben?", "Material benutzen?", "JA!", "NEIN!"] call BIS_fnc_guiMessage; if(_result) then {_str = format ["%1%2,",_str, _foreachIndex];};vehicle player setObjectMaterialGlobal [_foreachIndex,"a3\data_f\default.rvmat"];}foreach (getObjectTextures vehicle player); hint format ["%1 - Dies wurde in deine Zwischenablage kopiert!",_str]; copyToClipboard _str;};
     
        DAS LETZTE KOMMA MUSS ENTFERNT WERDEN!
     */

    class Default {
        vItemSpace = -1;
        conditions = "";
        price_civ = -1;
        price_cop = -1;
        price_med = -1;
        textures[] = {};
        materials[] = {};
    };

    // Apex DLC
    class C_Boat_Transport_02_F {
        vItemSpace = 30;
        conditions = "license_civ_boat";
        price_civ = 120000;
        price_cop = 10000;
        price_med = 10000;
        textures[] = {
            {
                "Blau_Weiß",
                "civ",
                {
                    "a3\boat_f_exp\boat_transport_02\data\boat_transport_02_exterior_civilian_co.paa",
                    "a3\boat_f_exp\boat_transport_02\data\boat_transport_02_interior_2_civilian_co.paa"
                }
            }
        };

        materials[] = {
            0, 1
        };
    }; 
	
	class I_Boat_Armed_01_minigun_F { //kein shop
        vItemSpace = 650;
        vFuelSpace = 50000;
        conditions = "license_civ_boat";
        price_civ = 900000;
        price_cop = 1400000;
        price_med = 1400000;
        textures[] = {};
		
		materials[] = {
            0, 1, 2
        };
    };
	
	class B_Heli_Attack_01_dynamicLoadout_F {  //kein shop
        vItemSpace = 650;
        vFuelSpace = 50000;
        conditions = "license_civ_pilot";
        price_civ = 1400000;
        price_cop = 1400000;
        price_med = 1400000;
        textures[] = {};
		materials[] = {
            0
        };
    };
	
    // Apex DLC
    class C_Offroad_02_unarmed_F {  //MB
        vItemSpace = 30;
        conditions = "license_civ_driver";
        price_civ = 17500;
        price_cop = 5700;
        price_med = 1;
        textures[] = {
            {
                "Schwarz",
                "civ",
                {
                    "\a3\soft_f_exp\offroad_02\data\offroad_02_ext_black_co.paa",
                    "\a3\soft_f_exp\offroad_02\data\offroad_02_ext_black_co.paa",
                    "\a3\soft_f_exp\offroad_02\data\offroad_02_int_black_co.paa",
                    "\a3\soft_f_exp\offroad_02\data\offroad_02_int_black_co.paa"
                }
            },
            {
                "Blau",
                "civ",
                {
                    "\a3\soft_f_exp\offroad_02\data\offroad_02_ext_blue_co.paa",
                    "\a3\soft_f_exp\offroad_02\data\offroad_02_ext_blue_co.paa",
                    "\a3\soft_f_exp\offroad_02\data\offroad_02_int_blue_co.paa",
                    "\a3\soft_f_exp\offroad_02\data\offroad_02_int_blue_co.paa"
                }
            },

            {
                "Grün",
                "civ",
                {
                    "\a3\soft_f_exp\offroad_02\data\offroad_02_ext_green_co.paa",
                    "\a3\soft_f_exp\offroad_02\data\offroad_02_ext_green_co.paa",
                    "\a3\soft_f_exp\offroad_02\data\offroad_02_int_green_co.paa",
                    "\a3\soft_f_exp\offroad_02\data\offroad_02_int_green_co.paa"
                }
            },
            {
                "Orange",
                "civ",
                {
                    "\a3\soft_f_exp\offroad_02\data\offroad_02_ext_orange_co.paa",
                    "\a3\soft_f_exp\offroad_02\data\offroad_02_ext_orange_co.paa",
                    "\a3\soft_f_exp\offroad_02\data\offroad_02_int_orange_co.paa",
                    "\a3\soft_f_exp\offroad_02\data\offroad_02_int_orange_co.paa"
                }
            },
            {
                "Rot",
                "civ",
                {
                    "\a3\soft_f_exp\offroad_02\data\offroad_02_ext_red_co.paa",
                    "\a3\soft_f_exp\offroad_02\data\offroad_02_ext_red_co.paa",
                    "\a3\soft_f_exp\offroad_02\data\offroad_02_int_red_co.paa",
                    "\a3\soft_f_exp\offroad_02\data\offroad_02_int_red_co.paa"
                }
            },
            {
                "Weiß",
                "civ",
                {
                    "a3\soft_f_exp\offroad_02\data\offroad_02_ext_white_co.paa",
                    "a3\soft_f_exp\offroad_02\data\offroad_02_ext_white_co.paa",
                    "a3\soft_f_exp\offroad_02\data\offroad_02_int_white_co.paa",
                    "a3\soft_f_exp\offroad_02\data\offroad_02_int_white_co.paa"
                }
            },
            {
                "Polizei",
                "cop",
                {
                    "texture\cop\polizei_mb4wd.paa"
                }
            },
            {
                "Rettungsdienst",
                "med",
                {
                    "texture\rd\fw_jeep.jpg"
                }
            }
        };
		materials[] = {
            0
        };
    };

    // Apex DLC
    class C_Plane_Civil_01_F {
        vItemSpace = 150;
        conditions = "license_civ_pilot";
        price_civ = 400000;
        price_cop = 400000;
        price_med = 400000;
        textures[] = {
            {
                "Rennen (Tan Interior)",
                "civ",
                {
                    "A3\Air_F_Exp\Plane_Civil_01\Data\btt_ext_01_Racer_co.paa",
                    "A3\Air_F_Exp\Plane_Civil_01\Data\btt_ext_02_Racer_co.paa",
                    "A3\Air_F_Exp\Plane_Civil_01\Data\btt_int_01_tan_co.paa",
                    "A3\Air_F_Exp\Plane_Civil_01\Data\btt_int_02_tan_co.paa"
                }
            },
            {
                "Rennen",
                "civ",
                {
                    "A3\Air_F_Exp\Plane_Civil_01\Data\btt_ext_01_Racer_co.paa",
                    "A3\Air_F_Exp\Plane_Civil_01\Data\btt_ext_02_Racer_co.paa",
                    "A3\Air_F_Exp\Plane_Civil_01\Data\btt_int_01_co.paa",
                    "A3\Air_F_Exp\Plane_Civil_01\Data\btt_int_02_co.paa"
                }
            },
            {
                "Red Line (Tan Interior)",
                "civ",
                {
                    "A3\Air_F_Exp\Plane_Civil_01\Data\btt_ext_01_RedLine_co.paa",
                    "A3\Air_F_Exp\Plane_Civil_01\Data\btt_ext_02_RedLine_co.paa",
                    "A3\Air_F_Exp\Plane_Civil_01\Data\btt_int_01_tan_co.paa",
                    "A3\Air_F_Exp\Plane_Civil_01\Data\btt_int_02_tan_co.paa"
                }
            },
            {
                "Red Line",
                "civ",
                {
                    "A3\Air_F_Exp\Plane_Civil_01\Data\btt_ext_01_RedLine_co.paa",
                    "A3\Air_F_Exp\Plane_Civil_01\Data\btt_ext_02_RedLine_co.paa",
                    "A3\Air_F_Exp\Plane_Civil_01\Data\btt_int_01_co.paa",
                    "A3\Air_F_Exp\Plane_Civil_01\Data\btt_int_02_co.paa"
                }
            },
            {
                "Tribal (Tan Interior)",
                "civ",
                {
                    "A3\Air_F_Exp\Plane_Civil_01\Data\btt_ext_01_Tribal_co.paa",
                    "A3\Air_F_Exp\Plane_Civil_01\Data\btt_ext_02_Tribal_co.paa",
                    "A3\Air_F_Exp\Plane_Civil_01\Data\btt_int_01_tan_co.paa",
                    "A3\Air_F_Exp\Plane_Civil_01\Data\btt_int_02_tan_co.paa"
                }
            },
            {
                "Tribal",
                "civ",
                {
                    "A3\Air_F_Exp\Plane_Civil_01\Data\btt_ext_01_Tribal_co.paa",
                    "A3\Air_F_Exp\Plane_Civil_01\Data\btt_ext_02_Tribal_co.paa",
                    "A3\Air_F_Exp\Plane_Civil_01\Data\btt_int_01_co.paa",
                    "A3\Air_F_Exp\Plane_Civil_01\Data\btt_int_02_co.paa"
                }
            },
            {
                "Blue Wave (Tan Interior)",
                "civ",
                {
                    "A3\Air_F_Exp\Plane_Civil_01\Data\btt_ext_01_Wave_co.paa",
                    "A3\Air_F_Exp\Plane_Civil_01\Data\btt_ext_02_Wave_co.paa",
                    "A3\Air_F_Exp\Plane_Civil_01\Data\btt_int_01_tan_co.paa",
                    "A3\Air_F_Exp\Plane_Civil_01\Data\btt_int_02_tan_co.paa"
                }
            },
            {
                "Blue Wave",
                "civ",
                {
                    "A3\Air_F_Exp\Plane_Civil_01\Data\btt_ext_01_Wave_co.paa",
                    "A3\Air_F_Exp\Plane_Civil_01\Data\btt_ext_02_Wave_co.paa",
                    "A3\Air_F_Exp\Plane_Civil_01\Data\btt_int_01_co.paa",
                    "A3\Air_F_Exp\Plane_Civil_01\Data\btt_int_02_co.paa"
                }
            }
        };
		materials[] = {
			0,1
		};
    };

    // Apex DLC
    class C_Plane_Civil_01_racing_F {  //kein shop
        vItemSpace = 100;
        conditions = "license_civ_pilot";
        price_civ = 800000;
        price_cop = 600000;
        price_med = 600000;
        textures[] = {
            {
                "Rennen (Tan Interior)",
                "civ",
                {
                    "A3\Air_F_Exp\Plane_Civil_01\Data\btt_ext_01_Racer_co.paa",
                    "A3\Air_F_Exp\Plane_Civil_01\Data\btt_ext_02_Racer_co.paa",
                    "A3\Air_F_Exp\Plane_Civil_01\Data\btt_int_01_tan_co.paa",
                    "A3\Air_F_Exp\Plane_Civil_01\Data\btt_int_02_tan_co.paa"
                }
            },
            {
                "Rennen",
                "civ",
                {
                    "A3\Air_F_Exp\Plane_Civil_01\Data\btt_ext_01_Racer_co.paa",
                    "A3\Air_F_Exp\Plane_Civil_01\Data\btt_ext_02_Racer_co.paa",
                    "A3\Air_F_Exp\Plane_Civil_01\Data\btt_int_01_co.paa",
                    "A3\Air_F_Exp\Plane_Civil_01\Data\btt_int_02_co.paa"
                }
            },
            {
                "Red Line (Tan Interior)",
                "civ",
                {
                    "A3\Air_F_Exp\Plane_Civil_01\Data\btt_ext_01_RedLine_co.paa",
                    "A3\Air_F_Exp\Plane_Civil_01\Data\btt_ext_02_RedLine_co.paa",
                    "A3\Air_F_Exp\Plane_Civil_01\Data\btt_int_01_tan_co.paa",
                    "A3\Air_F_Exp\Plane_Civil_01\Data\btt_int_02_tan_co.paa"
                }
            },
            {
                "Red Line",
                "civ",
                {
                    "A3\Air_F_Exp\Plane_Civil_01\Data\btt_ext_01_RedLine_co.paa",
                    "A3\Air_F_Exp\Plane_Civil_01\Data\btt_ext_02_RedLine_co.paa",
                    "A3\Air_F_Exp\Plane_Civil_01\Data\btt_int_01_co.paa",
                    "A3\Air_F_Exp\Plane_Civil_01\Data\btt_int_02_co.paa"
                }
            },
            {
                "Tribal (Tan Interior)",
                "civ",
                {
                    "A3\Air_F_Exp\Plane_Civil_01\Data\btt_ext_01_Tribal_co.paa",
                    "A3\Air_F_Exp\Plane_Civil_01\Data\btt_ext_02_Tribal_co.paa",
                    "A3\Air_F_Exp\Plane_Civil_01\Data\btt_int_01_tan_co.paa",
                    "A3\Air_F_Exp\Plane_Civil_01\Data\btt_int_02_tan_co.paa"
                }
            },
            {
                "Tribal",
                "civ",
                {
                    "A3\Air_F_Exp\Plane_Civil_01\Data\btt_ext_01_Tribal_co.paa",
                    "A3\Air_F_Exp\Plane_Civil_01\Data\btt_ext_02_Tribal_co.paa",
                    "A3\Air_F_Exp\Plane_Civil_01\Data\btt_int_01_co.paa",
                    "A3\Air_F_Exp\Plane_Civil_01\Data\btt_int_02_co.paa"
                }
            },
            {
                "Blue Wave (Tan Interior)",
                "civ",
                {
                    "A3\Air_F_Exp\Plane_Civil_01\Data\btt_ext_01_Wave_co.paa",
                    "A3\Air_F_Exp\Plane_Civil_01\Data\btt_ext_02_Wave_co.paa",
                    "A3\Air_F_Exp\Plane_Civil_01\Data\btt_int_01_tan_co.paa",
                    "A3\Air_F_Exp\Plane_Civil_01\Data\btt_int_02_tan_co.paa"
                }
            },
            {
                "Blue Wave",
                "civ",
                {
                    "A3\Air_F_Exp\Plane_Civil_01\Data\btt_ext_01_Wave_co.paa",
                    "A3\Air_F_Exp\Plane_Civil_01\Data\btt_ext_02_Wave_co.paa",
                    "A3\Air_F_Exp\Plane_Civil_01\Data\btt_int_01_co.paa",
                    "A3\Air_F_Exp\Plane_Civil_01\Data\btt_int_02_co.paa"
                }
            }
        };
		materials[] = {
			0,1
		};
    };

    // Apex DLC
    class C_Scooter_Transport_01_F {
        vItemSpace = 30;
        conditions = "";
        price_civ = 25000;
        price_cop = 25000;
        price_med = 25000;
        textures[] = {
            {
                "Rot",
                "civ",
                {
                    "\a3\boat_f_exp\scooter_transport_01\data\scooter_transport_01_co.paa",
                    "\a3\boat_f_exp\scooter_transport_01\data\scooter_transport_01_vp_co.paa"
                }
            },
            {
                "Blau",
                "civ",
                {
                    "\a3\boat_f_exp\scooter_transport_01\data\scooter_transport_01_blue_co.paa",
                    "\a3\boat_f_exp\scooter_transport_01\data\scooter_transport_01_vp_blue_co.paa"
                }
            },
            {
                "Schwarz",
                "civ",
                {
                    "\a3\boat_f_exp\scooter_transport_01\data\scooter_transport_01_black_co.paa",
                    "\a3\boat_f_exp\scooter_transport_01\data\scooter_transport_01_vp_black_co.paa"
                }
            },
            {
                "Grün",
                "civ",
                {
                    "\a3\boat_f_exp\scooter_transport_01\data\scooter_transport_01_lime_co.paa",
                    "\a3\boat_f_exp\scooter_transport_01\data\scooter_transport_01_vp_lime_co.paa"
                }
            },
            {
                "Grau",
                "civ",
                {
                    "\a3\boat_f_exp\scooter_transport_01\data\scooter_transport_01_grey_co.paa",
                    "\a3\boat_f_exp\scooter_transport_01\data\scooter_transport_01_vp_grey_co.paa"
                }
            }
        };
		materials[] = {
			0
		};
    };

    // Apex DLC
    class O_T_LSV_02_unarmed_F {
        vItemSpace = 50;
        conditions = "license_civ_driver";
        price_civ = 750000;
        price_cop = 30000;
        price_med = 300000;
        textures[] = {
            {
                "Grüne Tarnung",
                "civ",
                {
                    "a3\soft_f_exp\lsv_02\data\csat_lsv_01_ghex_co.paa",
                    "a3\soft_f_exp\lsv_02\data\csat_lsv_02_ghex_co.paa",
                }
            },
            {
                "Trockene Tarnung",
                "civ",
                {
                    "a3\soft_f_exp\lsv_02\data\csat_lsv_01_arid_co.paa",
                    "a3\soft_f_exp\lsv_02\data\csat_lsv_02_arid_co.paa",
                }
            },
          {
              "Polizei",
              "cop",
              {
                  "texture\cop\polizei_qillin_1.paa",
                  "texture\cop\polizei_qillin_2.paa",
                  "texture\cop\polizei_qillin_3.paa"
              }
          }
        };
		
		materials[] = {
			0
		};
    };

    // Apex DLC
    class O_T_LSV_02_armed_F {  //kein shop
        vItemSpace = 100;
        conditions = "license_civ_driver";
        price_civ = 3500000;
        price_cop = 900000;
        price_med = 900000;
        textures[] = {
          {
              "Grüne Tarnung",
              "civ",
              {
                  "a3\soft_f_exp\lsv_02\data\csat_lsv_01_ghex_co.paa",
                  "a3\soft_f_exp\lsv_02\data\csat_lsv_02_ghex_co.paa",
                  "a3\soft_f_exp\lsv_02\data\csat_lsv_03_ghex_co.paa"
              }
          },
          {
              "Trockene Tarnung",
              "civ",
              {
                  "a3\soft_f_exp\lsv_02\data\csat_lsv_01_arid_co.paa",
                  "a3\soft_f_exp\lsv_02\data\csat_lsv_02_arid_co.paa",
                  "a3\soft_f_exp\lsv_02\data\csat_lsv_03_arid_co.paa"
              }
          },
          {
              "Polizei",
              "cop",
              {
                  "texture\cop\polizei_qillin_1.paa",
                  "texture\cop\polizei_qillin_2.paa",
                  "texture\cop\polizei_qillin_3.paa"
              }
          }
        };
		materials[] = {
			0
		};
    };

    // Apex DLC
    class B_T_VTOL_01_vehicle_F {  //Blackfish Transport
        vItemSpace = 2500;
        conditions = "license_civ_pilot || {license_cop_cAir}";
        price_civ = 35000000;
        price_cop = 350000;
        price_med = 3500000;
        textures[] = {};
		materials[] = {
			0, 1, 2, 3
		};
    };

    class B_T_VTOL_01_infantry_F {  //Blackfisch Personen
        vItemSpace = 2000;
        conditions = "license_civ_pilot || {license_cop_cAir}";
        price_civ = 30000000;
        price_cop = 3500000;
        price_med = 3500000;
        textures[] = {};
		materials[] = {
			0, 1, 2, 3
		};
    };


    class O_Truck_03_repair_F {  //tempest repair
        vItemSpace = 50;
        conditions = "";
        price_civ = 2500000;
        price_cop = 250000;
        price_med = 250000;
        textures[] = {
            {
                "Rettungsdienst",
                "med",
                {
                    "texture\med\truck_03_ext01_co.paa",
                    "texture\med\truck_03_ext02_co.paa",
                    "texture\med\truck_03_ammo_co.paa",
                    "texture\med\truck_03_cargo_co.paa"
                }
			},
			{
				"Löschfahrzeug",
				"med",
				{
					"texture\fw\tempest_repair\fw_tempest_1.jpg",
					"texture\fw\tempest_repair\fw_tempest_2.jpg",
					"texture\fw\tempest_repair\fw_tempest_3.jpg"
				}
            }
        };
		materials[] = {
			0, 1, 2
		};
    };

    class O_Heli_Transport_04_covered_F {  //kein shop
        vItemSpace = 1000;
        conditions = "license_civ_pilot || {license_med_mAir}";
        price_civ = 13000000;
        price_cop = 13000000;
        price_med = 13000000;
        textures[] = {
            {
                "Braune Tarnung",
                "civ",
                {
                    "a3\air_f_heli\heli_transport_04\data\heli_transport_04_base_01_co.paa",
                    "a3\air_f_heli\heli_transport_04\data\heli_transport_04_base_02_co.paa",
                    "a3\air_f_heli\heli_transport_04\data\heli_transport_04_pod_ext01_co.paa",
                    "a3\air_f_heli\heli_transport_04\data\heli_transport_04_pod_ext02_co.paa"
                }
            },
            {
                "Schwarz",
                "civ",
                {
                    "a3\air_f_heli\heli_transport_04\data\heli_transport_04_base_01_black_co.paa",
                    "a3\air_f_heli\heli_transport_04\data\heli_transport_04_base_02_black_co.paa",
                    "a3\air_f_heli\heli_transport_04\data\heli_transport_04_pod_ext01_black_co.paa",
                    "a3\air_f_heli\heli_transport_04\data\heli_transport_04_pod_ext02_black_co.paa"
                }
            }
        };
		materials[] = {
			0, 1, 2, 3
		};
    };

    class O_Heli_Transport_04_bench_F {  //taru bank
        vItemSpace = 950;
        conditions = "license_civ_pilot";
        price_civ = 12000000;
        price_cop = 90000;
        price_med = 12000000;
        textures[] = {
            {
                "Braune Tarnung",
                "civ",
                {
                    "a3\air_f_heli\heli_transport_04\data\heli_transport_04_base_01_co.paa",
                    "a3\air_f_heli\heli_transport_04\data\heli_transport_04_base_02_co.paa",
                    "a3\air_f_heli\heli_transport_04\data\heli_transport_04_bench_co.paa"
                }
            },
            {
                "Schwarz",
                "civ",
                {
                    "a3\air_f_heli\heli_transport_04\data\heli_transport_04_base_01_black_co.paa",
                    "a3\air_f_heli\heli_transport_04\data\heli_transport_04_base_02_black_co.paa",
                    "a3\air_f_heli\heli_transport_04\data\heli_transport_04_bench_black_co.paa"
                }
            }
        };
		materials[] = {
			0, 1, 2, 3
		};
    };

    class O_Heli_Transport_04_fuel_F {  //kein shop
        vItemSpace = 950;
        conditions = "license_civ_pilot";
        price_civ = 12000000;
        price_cop = 12000000;
        price_med = 12000000;
        textures[] = {
            {
                "Braune Tarnung",
                "civ",
                {
                    "a3\air_f_heli\heli_transport_04\data\heli_transport_04_base_01_co.paa",
                    "a3\air_f_heli\heli_transport_04\data\heli_transport_04_base_02_co.paa",
                    "a3\air_f_heli\heli_transport_04\data\heli_transport_04_fuel_co.paa"
                }
            },
            {
                "Schwarz",
                "civ",
                {
                    "a3\air_f_heli\heli_transport_04\data\heli_transport_04_base_01_black_co.paa",
                    "a3\air_f_heli\heli_transport_04\data\heli_transport_04_base_02_black_co.paa",
                    "a3\air_f_heli\heli_transport_04\data\heli_transport_04_fuel_black_co.paa"
                }
            }
        };
		materials[] = {
			0, 1, 2, 3
		};
    };

    class O_Heli_Transport_04_F {
        vItemSpace = 100;
        conditions = "license_civ_pilot";
        price_civ = 8600000;
        price_cop = 1000000;
        price_med = 1000000;
        textures[] = {
            {
                "Braune Tarnung",
                "civ",
                {
                    "\A3\air_f_heli\Heli_Transport_04\data\heli_transport_04_base_01_co.paa",
                    "\A3\air_f_heli\Heli_Transport_04\data\heli_transport_04_base_02_co.paa"
                }
            },
            {
                "Schwarz",
                "civ",
                {
                    "\A3\air_f_heli\Heli_Transport_04\data\heli_transport_04_base_01_black_co.paa",
                    "\A3\air_f_heli\Heli_Transport_04\data\heli_transport_04_base_02_black_co.paa"
                }
            }
        };
		materials[] = {
			0, 1
		};
    };

    class I_MRAP_03_F {
        vItemSpace = 50;
        conditions = "";
        price_civ = 7500000;
        price_cop = 200000;
        price_med = 1500000;
        textures[] = {
            {
                "Polizei",
                "cop",
                {
                    "texture\cop\polizei_strider.paa"
                }
            },
            {
                "Grau",
                "civ",
                {
                    "\A3\soft_f_beta\mrap_03\data\mrap_03_ext_co.paa",
                    "\A3\data_f\vehicles\turret_co.paa"
                }
            },
            {
                "Grüne Tarnung",
                "civ",
                {
                  "a3\soft_f_beta\mrap_03\data\mrap_03_ext_indp_co.paa",
                  "a3\data_f\vehicles\turret_indp_co.paa"
                }
            },
            {
                "Rettungsdienst",
                "med",
                {
                  "texture\rd\rd_strider.paa"
                }
            }
        };
		materials[] = {
			0, 1
		};
    };

    class B_T_LSV_01_unarmed_F {  //Prowler
        vItemSpace = 50;
        conditions = "";
        price_civ = 765000;
        price_cop = 30000;
        price_med = 750000;
        textures[] = {
            {
                "Polizei",
                "cop",
                {
                    "texture\cop\polizei_prowler_1.paa",
                    "texture\cop\polizei_prowler_2.paa"
                }
            },
            {
                "Grün",
                "civ",
                {
                    "a3\soft_f_exp\lsv_01\data\nato_lsv_01_olive_co.paa",
                    "a3\soft_f_exp\lsv_01\data\nato_lsv_02_olive_co.paa",
                    "a3\soft_f_exp\lsv_01\data\nato_lsv_03_olive_co.paa",
                    "a3\soft_f_exp\lsv_01\data\nato_lsv_adds_olive_co.paa"
                }
            },
            {
                "Sand",
                "civ",
                {
                    "a3\soft_f_exp\lsv_01\data\nato_lsv_01_sand_co.paa",
                    "a3\soft_f_exp\lsv_01\data\nato_lsv_02_sand_co.paa",
                    "a3\soft_f_exp\lsv_01\data\nato_lsv_03_sand_co.paa",
                    "a3\soft_f_exp\lsv_01\data\nato_lsv_adds_sand_co.paa"
                }
            },
            {
                "Schwarz",
                "civ",
                {
                    "a3\soft_f_exp\lsv_01\data\nato_lsv_01_black_co.paa",
                    "a3\soft_f_exp\lsv_01\data\nato_lsv_02_black_co.paa",
                    "a3\soft_f_exp\lsv_01\data\nato_lsv_03_black_co.paa",
                    "a3\soft_f_exp\lsv_01\data\nato_lsv_adds_black_co.paa"
                }
            },
            {
                "Rettungsdienst",
                "med",
                {
                    "texture\rd\rd_prowler.paa"
                }
            }
        };
		materials[] = {
			0
		};
    };

    class C_Rubberboat {
        vItemSpace = 10;
        conditions = "license_civ_boat";
        price_civ = 20000;
        price_cop = 5000;
        price_med = 5000;
        textures[] = {
            {
                "Orange",
                "civ",
                {
                    "\A3\boat_f\Boat_Transport_01\data\boat_transport_01_rescue_co.paa"
                }
            }
        };
		materials[] = {
			0
		};
    };

    class B_Heli_Transport_01_F {
        vItemSpace = 200;
        conditions = "license_civ_pilot || {license_cop_cAir}";
        price_civ = 50000000;
        price_cop = 100000;
        price_med = 4000000;
        textures[] = {
            {
                "Polizei",
                "cop",
                {
                    "texture\cop\polizei_ghosthawk_1.paa",
                    "texture\cop\polizei_ghosthawk_2.paa"
                }
            }
        };
		materials[] = {
			0, 1
		};
    };

    class B_MRAP_01_hmg_F {
        vItemSpace = 100;
        conditions = "";
        price_civ = 10000000;
        price_cop = 950000;
        price_med = 500000;
        textures[] = {};
		materials[] = {
			0
		};
    };

    class B_Boat_Armed_01_minigun_F {
        vItemSpace = 175;
        conditions = "license_cop_cg";
        price_civ = 100000;
        price_cop = 50000;
        price_med = 500000;
        textures[] = {};
		materials[] = {
			0
		};
    };

    class B_Boat_Transport_01_F {
        vItemSpace = 45;
        conditions = "license_cop_cg";
        price_civ = 10000;
        price_cop = 5000;
        price_med = 50000;
        textures[] = {};
		materials[] = {
			0
		};
    };

    class O_Truck_03_transport_F {  //Tempest offen
        vItemSpace = 750;
        conditions = "license_civ_trucking";
        price_civ = 1600000;
        price_cop = 1700000;
        price_med = 1700000;
        textures[] = {
            {
                "Braune Tarnung",
                "civ",
                {
                    "a3\soft_f_epc\truck_03\data\truck_03_ext01_co.paa",
                    "a3\soft_f_epc\truck_03\data\truck_03_ext02_co.paa",
                    "a3\soft_f_epc\truck_03\data\truck_03_cargo_co.paa"
                }
            },
            {
                "Grüne Tarnung",
                "civ",
                {
                    "a3\soft_f_exp\truck_03\data\truck_03_ext01_ghex_co.paa",
                    "a3\soft_f_exp\truck_03\data\truck_03_ext02_ghex_co.paa",
                    "a3\soft_f_exp\truck_03\data\truck_03_cargo_ghex_co.paa"
                }
            }
        };
		
		materials[] = {
			0, 1, 2
		};
    };

    class O_Truck_03_device_F {  //Tempest Gerät
        vItemSpace = 450;
        conditions = "license_civ_trucking";
        price_civ = 6000000;
        price_cop = 15000000;
        price_med = 15000000;
        textures[] = {
            {
                "Braune Tarnung",
                "civ",
                {
                    "a3\soft_f_epc\truck_03\data\truck_03_ext01_co.paa",
                    "a3\soft_f_epc\truck_03\data\truck_03_ext02_co.paa",
                    "a3\soft_f_epc\truck_03\data\truck_03_cargo_co.paa",
                    "a3\structures_f_epc\items\electronics\data\the_device_02_co.paa",
                    "a3\structures_f_epc\items\electronics\data\the_device_03_co.paa"
                }
            },
            {
                "Grüne Tarnung",
                "civ",
                {
                    "a3\soft_f_exp\truck_03\data\truck_03_ext01_ghex_co.paa",
                    "a3\soft_f_exp\truck_03\data\truck_03_ext02_ghex_co.paa",
                    "a3\soft_f_exp\truck_03\data\truck_03_cargo_ghex_co.paa",
                    "a3\structures_f_epc\items\electronics\data\the_device_02_co.paa",
                    "a3\structures_f_epc\items\electronics\data\the_device_03_co.paa"
                }
            }
        };
		materials[] = {
			0, 1, 2
		};
    };

    class O_Truck_03_fuel_F {  //Tempest Fuel
        vItemSpace = 500;
        conditions = "license_civ_trucking";
        price_civ = 1200000;
        price_cop = 1600000;
        price_med = 1600000;
        textures[] = {
            {
                "Braune Tarnung",
                "civ",
                {
                    "a3\soft_f_epc\truck_03\data\truck_03_ext01_co.paa",
                    "a3\soft_f_epc\truck_03\data\truck_03_ext02_co.paa",
                    "a3\soft_f_epc\truck_03\data\truck_03_fuel_co.paa"
                }
            },
            {
                "Grüne Tarnung",
                "civ",
                {
                    "a3\soft_f_exp\truck_03\data\truck_03_ext01_ghex_co.paa",
                    "a3\soft_f_exp\truck_03\data\truck_03_ext02_ghex_co.paa",
                    "a3\soft_f_exp\truck_03\data\truck_03_fuel_ghex_co.paa"
                }
            }
        };
		materials[] = {
			0, 1, 2
		};
    };

    class Land_CargoBox_V1_F {
        vItemSpace = 250;
        conditions = "";
        price_civ = -1;
        price_cop = -1;
        price_med = -1;
        textures[] = {};
    };

    class Box_IND_Grenades_F {
        vItemSpace = 700;
        conditions = "";
        price_civ = -1;
        price_cop = -1;
        price_med = -1;
        textures[] = {};
    };

    class B_supplyCrate_F {
        vItemSpace = 1700;
        conditions = "";
        price_civ = -1;
        price_cop = -1;
        price_med = -1;
        textures[] = {};
    };

    class B_G_Offroad_01_F {
        vItemSpace = 65;
        conditions = "";
        price_civ = 45000;
        price_cop = 30000;
        price_med = 30000;
        textures[] = {};
		materials[] = {
			0, 1
		};
    };

    class B_G_Offroad_01_armed_F {
        vItemSpace = 65;
        conditions = "license_civ_rebel";
        price_civ = 8500000;
        price_cop = 8500000;
        price_med = 8500000;
        textures[] = {
            {
                "Grüne Tarnung",
                "civ",
                {
                    "a3\soft_f_bootcamp\offroad_01\data\offroad_01_ext_ig_04_co.paa",
                    "a3\soft_f_bootcamp\offroad_01\data\offroad_01_ext_ig_04_co.paa"
                }
            },
            {
                "Olive Tarnung",
                "civ",
                {
                    "a3\soft_f_bootcamp\offroad_01\data\offroad_01_ext_ig_05_co.paa",
                    "a3\soft_f_bootcamp\offroad_01\data\offroad_01_ext_ig_05_co.paa"
                }
            },
            {
                "Braune Tarnung",
                "civ",
                {
                    "a3\soft_f_bootcamp\offroad_01\data\offroad_01_ext_ig_06_co.paa",
                    "a3\soft_f_bootcamp\offroad_01\data\offroad_01_ext_ig_06_co.paa"
                }
            },
            {
                "Jäger Tarnung",
                "civ",
                {
                    "a3\soft_f_bootcamp\offroad_01\data\offroad_01_ext_ig_12_co.paa",
                    "a3\soft_f_bootcamp\offroad_01\data\offroad_01_ext_ig_12_co.paa"
                }
            }
        };
		materials[] = {
			0, 1
		};
    };

    class C_Boat_Civil_01_F {  //Motorboot
        vItemSpace = 85;
        conditions = "license_civ_boat";
        price_civ = 120000;
        price_cop = 22000;
        price_med = 22000;
        textures[] = {
            {
                "Braun Gelb",
                "civ",
                {
                    "\A3\boat_f_gamma\Boat_Civil_01\data\boat_civil_01_ext_co.paa"
                }
            },
            {
                "Orange",
                "civ",
                {
                    "\A3\boat_f_gamma\Boat_Civil_01\data\boat_civil_01_ext_rescue_co.paa"
                }
            }
        };
		materials[] = {
			0
		};
    };

    class C_Boat_Civil_01_police_F {
        vItemSpace = 85;
        conditions = "license_cop_cg";
        price_civ = 22000;
        price_cop = 220000;
        price_med = 0;
        textures[] = {
            {
                "Polizei",
                "fed",
                {
                    "\A3\boat_f_gamma\Boat_Civil_01\data\boat_civil_01_ext_police_co.paa"
                }
            }
        };
		materials[] = {
			0
		};
    };

    class B_Truck_01_box_F {  //kein shop
        vItemSpace = 1000;
        conditions = "license_civ_trucking";
        price_civ = 5000000;
        price_cop = 1300000;
        price_med = 1300000;
        textures[] = {};
		
		materials[] = {
			0, 1, 2
		};
    };

    class B_Truck_01_transport_F {
        vItemSpace = 800;
        conditions = "license_civ_trucking";
        price_civ = 680000;
        price_cop = 1400000;
        price_med = 1400000;
        textures[] = {};
		
		materials[] = {
			0, 1, 2
		};
    };

    class O_MRAP_02_F {  //Ifrit
        vItemSpace = 50;
        conditions = "license_civ_driver";
        price_civ = 6000000;
        price_cop = 120000;
        price_med = 10000;
        textures[] = {
            {
                "Grüne Tarnung",
                "civ",
                {
                    "a3\soft_f_exp\mrap_02\data\mrap_02_ext_01_ghex_co.paa",
                    "a3\soft_f_exp\mrap_02\data\mrap_02_ext_02_ghex_co.paa"
                }
            },
            {
                "Braune Tarnung",
                "civ",
                {
                    "a3\soft_f\mrap_02\data\mrap_02_ext_01_co.paa",
                    "a3\soft_f\mrap_02\data\mrap_02_ext_02_co.paa"
                }
            },
            {
                "Polizei",
                "cop",
                {
                    "texture\cop\polizei_ifrit_1.paa",
                    "texture\cop\polizei_ifrit_2.paa"
                }
            }
        };
		materials[] = {
			0, 1
		};
    };

    class O_MRAP_02_hmg_F {  //Kein Shop
        vItemSpace = 100;
        conditions = "license_civ_driver";
        price_civ = 10000000;
        price_cop = 10000000;
        price_med = 10000000;
        textures[] = {
            {
                "Grüne Tarnung",
                "civ",
                {
                    "a3\soft_f_exp\mrap_02\data\mrap_02_ext_01_ghex_co.paa",
                    "a3\soft_f_exp\mrap_02\data\mrap_02_ext_02_ghex_co.paa",
                    "a3\data_f_exp\vehicles\turret_ghex_co.paa"
                }
            },
            {
                "Braune Tarnung",
                "civ",
                {
                    "a3\soft_f\mrap_02\data\mrap_02_ext_01_co.paa",
                    "a3\soft_f\mrap_02\data\mrap_02_ext_02_co.paa",
                    "a3\data_f\vehicles\turret_co.paa"
                }
            }
        };
		materials[] = {
			0, 1
		};
    };

    class C_Offroad_01_F {  //Offroader
        vItemSpace = 60;
        conditions = "license_civ_driver";
        price_civ = 17500;
        price_cop = 3500;
        price_med = 0;
        textures[] = {
            {
                "Rot",
                "civ",
                {
                    "\A3\soft_F\Offroad_01\Data\offroad_01_ext_co.paa",
                    "\A3\soft_F\Offroad_01\Data\offroad_01_ext_co.paa"
                }
            },
            {
                "Gelb",
                "civ",
                {
                    "\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE01_CO.paa",
                    "\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE01_CO.paa"
                }
            },
            {
                "Weiss",
                "civ",
                {
                    "\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE02_CO.paa",
                    "\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE02_CO.paa"
                }
            },
            {
                "Blau",
                "civ",
                {
                    "\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE03_CO.paa",
                    "\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE03_CO.paa"
                }
            },
            {
                "Dunkelrot",
                "civ",
                {
                    "\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE04_CO.paa",
                    "\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE04_CO.paa"
                }
            },
            {
                "Blau/Weiss",
                "civ",
                {
                    "\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE05_CO.paa",
                    "\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE05_CO.paa"
                }
            },
            {
                "Polizei",
                "cop",
                {
                    "texture\cop\polizei_offroader.paa"
                }
            },
            {
                "Feuerwehr",
                "med",
                {
                    "texture\fw\offroader\fw_offroader.jpg"
                }
            }
        };
		materials[] = {
			0, 1
		};
    };

    class C_Kart_01_Blu_F {  //
        vItemSpace = 5;
        conditions = "license_civ_driver";
        price_civ = 40000;
        price_cop = 45000;
        price_med = 45000;
        textures[] = {};
		materials[] = {
			0
		};
    };
    /*
    To edit another information in this classes you can use this exemple.
    class C_Kart_01_Fuel_F : C_Kart_01_Blu_F{
        vItemSpace = 40;
        price = ;
    };

    will modify the virtual space and the price of the vehicle, but other information such as license and textures will pick up the vehicle declare at : Vehicle {};
    */
    class C_Kart_01_Fuel_F: C_Kart_01_Blu_F {}; // Get all information of C_Kart_01_Blu_F
    class C_Kart_01_Red_F: C_Kart_01_Blu_F {};
    class C_Kart_01_Vrana_F: C_Kart_01_Blu_F {};
    class C_Kart_01_F: C_Kart_01_Blu_F {};
    class C_Kart_01_green_F: C_Kart_01_Blu_F {};
    class C_Kart_01_orange_F: C_Kart_01_Blu_F {};
    class C_Kart_01_white_F: C_Kart_01_Blu_F {};
    class C_Kart_01_yellow_F: C_Kart_01_Blu_F {};
    class C_Kart_01_black_F: C_Kart_01_Blu_F {};

    class C_Hatchback_01_sport_F {  //Limo Sport
        vItemSpace = 30;
        conditions = "license_civ_driver";
        price_civ = 140000;
        price_cop = 21000;
        price_med = 0;
        textures[] = {
            {
                "Rot",
                "civ",
                {
                    "\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_sport01_co.paa"
                }
            },
            {
                "Dunkelblau",
                "civ",
                {
                    "\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_sport02_co.paa"
                }
            },
            {
                "Orange",
                "civ",
                {
                    "\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_sport03_co.paa"
                }
            },
            {
                "Schwarz/Weiss",
                "civ",
                {
                    "\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_sport04_co.paa"
                }
            },
            {
                "Beige",
                "civ",
                {
                    "\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_sport05_co.paa"
                }
            },
            {
                "Grün",
                "civ",
                {
                    "\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_sport06_co.paa"
                }
			},
			{
				"Free Candy",
				"civ",
				{
					"texture\hatch\hatch_free_candy.jpg"
				}
            },
            {
                "Polizei",
                "cop",
                {
                    "texture\cop\polizei_hatchback.paa"
                }
            },
			{
				"Feuerwehr",
				"med",
				{
					"texture\fw\hatch\fw_hatchback.jpg"
				}
            }
        };
		 materials[] = {
            0
        };
    };

    class B_Quadbike_01_F {  //
        vItemSpace = 20;
        conditions = "license_civ_driver";
        price_civ = 2500;
        price_cop = 0;
        price_med = 0;
        textures[] = {
            {
                "Rettungsdienst",
                "med",
                {
                    "texture\rd\rd_quad.paa"
                }
            }
        };
		materials[] = {
            0
        };
    };

    class I_Truck_02_covered_F {  //Zamak Abgedeckt
        vItemSpace = 250;
        conditions = "license_civ_trucking";
        price_civ = 300000;
        price_cop = 800000;
        price_med = 800000;
        textures[] = {
            {
                "Orange",
                "civ",
                {
                    "\A3\Soft_F_Beta\Truck_02\data\truck_02_kab_co.paa",
                    "\a3\soft_f_beta\Truck_02\data\truck_02_kuz_co.paa"
                }
            },
            {
                "Orange/Oliv",
                "civ",
                {
                    "a3\soft_f_beta\truck_02\data\truck_02_kab_co.paa",
                    "a3\soft_f_beta\truck_02\data\truck_02_kuz_olive_co.paa"
                }
            },
            {
                "Blau",
                "civ",
                {
                    "a3\soft_f_beta\truck_02\data\truck_02_kab_blue_co.paa",
                    "a3\soft_f_beta\truck_02\data\truck_02_kuz_co.paa"
                }
            },
            {
                "Blau/Oliv",
                "civ",
                {
                    "a3\soft_f_beta\truck_02\data\truck_02_kab_blue_co.paa",
                    "a3\soft_f_beta\truck_02\data\truck_02_kuz_olive_co.paa"
                }
            }
        };
		materials[] = {
            0, 1
        };
    };

    class I_Truck_02_transport_F {  //Zamak offen
        vItemSpace = 200;
        conditions = "license_civ_trucking";
        price_civ = 200000;
        price_cop = 750000;
        price_med = 750000;
        textures[] = {
            {
                "Orange",
                "civ",
                {
                    "\A3\Soft_F_Beta\Truck_02\data\truck_02_kab_co.paa",
                    "\a3\soft_f_beta\Truck_02\data\truck_02_kuz_co.paa"
                }
            },
            {
                "Blau",
                "civ",
                {
                    "a3\soft_f_beta\truck_02\data\truck_02_kab_blue_co.paa",
                    "\a3\soft_f_beta\Truck_02\data\truck_02_kuz_co.paa"
                }
            }
        };
		materials[] = {
            0, 1
        };
    };

    class O_Truck_03_covered_F {  //Tempest abgedeckt
        vItemSpace = 700;
        conditions = "license_civ_trucking";
        price_civ = 2100000;
        price_cop = 1800000;
        price_med = 1800000;
        textures[] = {
            {
                "Braune Tarnung",
                "civ",
                {
                    "a3\soft_f_epc\truck_03\data\truck_03_ext01_co.paa",
                    "a3\soft_f_epc\truck_03\data\truck_03_ext02_co.paa",
                    "a3\soft_f_epc\truck_03\data\truck_03_cargo_co.paa",
                    "a3\soft_f_epc\truck_03\data\truck_03_cover_co.paa"
                }
            },
            {
                "Grüne Tarnung",
                "civ",
                {
                    "a3\soft_f_exp\truck_03\data\truck_03_ext01_ghex_co.paa",
                    "a3\soft_f_exp\truck_03\data\truck_03_ext02_ghex_co.paa",
                    "a3\soft_f_exp\truck_03\data\truck_03_cargo_ghex_co.paa",
                    "a3\soft_f_exp\truck_03\data\truck_03_cover_ghex_co.paa"
                }
            }
        };
		materials[] = {
            0, 1, 2, 3
        };
    };

    class C_Hatchback_01_F {  //Limo normal
        vItemSpace = 30;
        conditions = "license_civ_driver";
        price_civ = 17500;
        price_cop = 0;
        price_med = 0;
        textures[] = {
            {
                "Beige",
                "civ",
                {
                    "\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base01_co.paa"
                }
            },
            {
                "Grün",
                "civ",
                {
                    "\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base02_co.paa"
                }
            },
            {
                "Blau",
                "civ",
                {
                    "\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base03_co.paa"
                }
            },
            {
                "Dunkelblau",
                "civ",
                {
                    "\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base04_co.paa"
                }
            },
            {
                "Gelb",
                "civ",
                {
                    "\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base06_co.paa"
                }
            },
            {
                "Weiss",
                "civ",
                {
                    "\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base07_co.paa"
                }
            },
            {
                "Grau",
                "civ",
                {
                    "\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base08_co.paa"
                }
            },
            {
                "Schwarz",
                "civ",
                {
                    "\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base09_co.paa"
                }
			},
			{
				"Feuerwehr",
				"med",
				{
					"texture\fw\hatch\fw_hatchback.jpg"
				}
            }
        };
		materials[] = {
            0
        };
    };

    class C_SUV_01_F {  //
        vItemSpace = 40;
        conditions = "license_civ_driver";
        price_civ = 30000;
        price_cop = 5700;
        price_med = 0;
        textures[] = {
            {
                "Dunkelrot",
                "civ",
                {
                    "\a3\soft_f_gamma\SUV_01\Data\suv_01_ext_co.paa"
                }
            },
            {
                "Silber",
                "civ",
                {
                    "\a3\soft_f_gamma\SUV_01\Data\suv_01_ext_03_co.paa"
                }
            },
            {
                "Orange",
                "civ",
                {
                    "\a3\soft_f_gamma\SUV_01\Data\suv_01_ext_04_co.paa"
                }
            },
            {
                "Notarzt",
                "med",
                {
                    "texture\fw\suv\notarzt_suv.jpg"
                }
			},
            {
                "Feuerwehr",
                "med",
                {
                    "texture\fw\suv\fw_suv.jpg"
                }
            },
            {
                "Polizei",
                "cop",
                {
                    "texture\cop\polizei_suv.paa"
                }
            }
        };
		materials[] = {
            0
        };
    };

    class C_Van_01_transport_F {  //Truck
        vItemSpace = 100;
        conditions = "license_civ_driver";
        price_civ = 75000;
        price_cop = 500000;
        price_med = 500000;
        textures[] = {
            {
                "Weiss",
                "civ",
                {
                    "a3\soft_f_gamma\Van_01\Data\van_01_ext_co.paa",
                    "a3\soft_f_gamma\van_01\data\van_01_adds_co.paa",
                    "a3\soft_f_gamma\van_01\data\van_01_int_base_co.paa"
                }
            },
            {
                "Rot",
                "civ",
                {
                    "a3\soft_f_gamma\Van_01\Data\van_01_ext_red_co.paa",
                    "a3\soft_f_gamma\van_01\data\van_01_adds_co.paa",
                    "a3\soft_f_gamma\van_01\data\van_01_int_base_co.paa"
                }
            },
            {
                "Schwarz",
                "civ",
                {
                    "a3\soft_f_gamma\van_01\data\van_01_ext_black_co.paa",
                    "a3\soft_f_gamma\van_01\data\van_01_adds_co.paa",
                    "a3\soft_f_gamma\van_01\data\van_01_int_base_co.paa"
                }
            }
        };
		materials[] = {
            0, 1, 2
        };
    };

    class C_Van_01_box_F {  //Truck Box
        vItemSpace = 130;
        conditions = "license_civ_driver";
        price_civ = 85000;
        price_cop = 1500000;
        price_med = 1500000;
        textures[] = {
            {
                "Weiss",
                "civ",
                {
                    "\a3\soft_f_gamma\Van_01\Data\van_01_ext_co.paa"
                }
            },
            {
                "Rot",
                "civ",
                {
                    "\a3\soft_f_gamma\Van_01\Data\van_01_ext_red_co.paa"
                }
            },
            {
                "Schwarz",
                "civ",
                {
                    "a3\soft_f_gamma\van_01\data\van_01_ext_black_co.paa",
                    "a3\soft_f_gamma\van_01\data\van_01_adds_co.paa"
                }
            }
        };
		
		materials[] = {
            0, 1
        };
    };

    class B_MRAP_01_F {  //Hunter
        vItemSpace = 65;
        conditions = "license_civ_driver";
        price_civ = 6000000;
        price_cop = 150000;
        price_med = 800000;
        textures[] = {
            {
                "Polizei",
                "cop",
                {
                    "texture\cop\polizei_hunter_1.paa",
                    "texture\cop\polizei_hunter_2.paa"
                }
            },
            {
                "Grau",
                "civ",
                {
                    "a3\soft_f\mrap_01\data\mrap_01_base_co.paa",
                    "a3\soft_f\mrap_01\data\mrap_01_adds_co.paa"
                }
            }
        };
		materials[] = {
            0, 1
        };
    };

    class B_Heli_Transport_03_unarmed_F {  //huron
        vItemSpace = 750;
        conditions = "license_civ_pilot || {license_cop_cAir}";
        price_civ = 7100000;
        price_cop = 115000;
        price_med = 10000000;
        textures[] = {
            {
                "Schwarz",
                "civ",
                {
                    "\A3\air_f_heli\Heli_Transport_03\Data\heli_transport_03_ext01_black_co.paa",
                    "\A3\air_f_heli\Heli_Transport_03\Data\heli_transport_03_ext02_black_co.paa"
                }
            },
            {
                "Grün",
                "civ",
                {
                    "a3\air_f_heli\heli_transport_03\data\heli_transport_03_ext01_co.paa",
                    "a3\air_f_heli\heli_transport_03\data\heli_transport_03_ext02_co.paa"
                }
            },
            {
                "Polizei",
                "cop",
                {
                    "texture\cop\polizei_huron_1.paa",
                    "texture\cop\polizei_huron_2.paa"
                }
            }
        };
		materials[] = {
            0, 1
        };
    };

    class B_Heli_Light_01_F {  //hummingbird
        vItemSpace = 30;
        conditions = "license_civ_pilot || {license_cop_cAir}";
        price_civ = 895000;
        price_cop = 28000;
        price_med = 300000;
        textures[] = {
            {
                "Blau",
                "civ",
                {
                    "\a3\air_f\Heli_Light_01\Data\heli_light_01_ext_blue_co.paa"
                }
            },
            {
                "Rot",
                "civ",
                {
                    "\a3\air_f\Heli_Light_01\Data\heli_light_01_ext_co.paa"
                }
            },
            {
                "Blueline",
                "civ",
                {
                    "\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_blueline_co.paa"
                }
            },
            {
                "Elliptical",
                "civ",
                {
                    "\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_elliptical_co.paa"
                }
            },
            {
                "Furious",
                "civ",
                {
                    "\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_furious_co.paa"
                }
            },
            {
                "Jeans Blue",
                "civ",
                {
                    "\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_jeans_co.paa"
                }
            },
            {
                "Speedy Redline",
                "civ",
                {
                    "\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_speedy_co.paa"
                }
            },
            {
                "Sunset",
                "civ",
                {
                    "\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_sunset_co.paa"
                }
            },
            {
                "Vrana",
                "civ",
                {
                    "\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_vrana_co.paa"
                }
            },
            {
                "Waves Blue",
                "civ",
                {
                    "\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_wave_co.paa"
                }
            },
            {
                "Digital Tarnung",
                "reb",
                {
                    "\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_digital_co.paa"
                }
            },
            {
                "Digi Green",
                "reb",
                {
                    "\a3\air_f\Heli_Light_01\Data\heli_light_01_ext_indp_co.paa"
                }
            },
			{
                "John Player Special",
                "civ",
                {
                    "texture\zig_hummi\hummingbird_jps.jpg"
                }
            },
			{
                "Marlboro",
                "civ",
                {
                    "texture\zig_hummi\hummingbird_marlboro.jpg"
                }
            },
            {
                "Polizei",
                "cop",
                {
                    "texture\cop\polizei_hummingbird.paa"
                }
            },
            {
                "Rettungsdienst",
                "med",
                {
                    "texture\rd\medic_m900.paa"
                }
            }
        };
		materials[] = {
            0
        };
    };

    class C_Heli_Light_01_civil_F {  //M-900
        vItemSpace = 30;
        conditions = "license_civ_pilot || {license_med_mAir}";
        price_civ = 400000;
        price_cop = 250000;
        price_med = 250000;
        textures[] = {
            {
                "Blueline",
                "civ",
                {
                    "\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_blueline_co.paa"
                }
            },
            {
                "Elliptical",
                "civ",
                {
                    "\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_elliptical_co.paa"
                }
            },
            {
                "Furious",
                "civ",
                {
                    "\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_furious_co.paa"
                }
            },
            {
                "Jeans Blue",
                "civ",
                {
                    "\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_jeans_co.paa"
                }
            },
            {
                "Speedy Redline",
                "civ",
                {
                    "\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_speedy_co.paa"
                }
            },
            {
                "Sunset",
                "civ",
                {
                    "\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_sunset_co.paa"
                }
            },
            {
                "Vrana",
                "civ",
                {
                    "\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_vrana_co.paa"
                }
            },
            {
                "Waves Blue",
                "civ",
                {
                    "\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_wave_co.paa"
                }
            },
			{
                "Rettungsdienst",
                "med",
                {
                    "texture\rd\medic_m900.paa"
                }
            }
        };
		materials[] = {
            0
        };
    };

    class I_Heli_Transport_02_F {  //Mohawk
        vItemSpace = 200;
        conditions = "license_civ_pilot";
        price_civ = 3800000;
        price_cop = 60000;
        price_med = 500000;
        textures[] = {
            {
                "Dahoman",
                "civ",
                {
                    "\A3\air_f_beta\Heli_Transport_02\data\skins\heli_transport_02_1_dahoman_co.paa",
                    "\A3\air_f_beta\Heli_Transport_02\data\skins\heli_transport_02_2_dahoman_co.paa",
                    "\A3\air_f_beta\Heli_Transport_02\data\skins\heli_transport_02_3_dahoman_co.paa"
                }
            },
            {
                "Ion",
                "civ",
                {
                    "\A3\air_f_beta\Heli_Transport_02\data\skins\heli_transport_02_1_ion_co.paa",
                    "\A3\air_f_beta\Heli_Transport_02\data\skins\heli_transport_02_2_ion_co.paa",
                    "\A3\air_f_beta\Heli_Transport_02\data\skins\heli_transport_02_3_ion_co.paa"
                }
            },
            {
                "Polizei",
                "cop",
                {
                    "texture\cop\polizei_mohawk_1.paa",
                    "texture\cop\polizei_mohawk_2.paa",
                    "texture\cop\polizei_mohawk_3.paa"
                }
            }
        };
		materials[] = {
            0,1,2
        };
    };

    class O_T_VTOL_02_infantry_F {  //kein shop
        vItemSpace = 1000;
        conditions = "license_civ_pilot || {license_med_mAir}";
        price_civ = 30000000;
        price_cop = 175000;
        price_med = 175000;
        textures[] = {
            {
                "Graue Tarnung",
                "civ",
                {
                    "a3\air_f_exp\vtol_02\data\vtol_02_ext01_co.paa",
                    "a3\air_f_exp\vtol_02\data\vtol_02_ext02_co.paa",
                    "a3\air_f_exp\vtol_02\data\vtol_02_ext03_l_co.paa",
                    "a3\air_f_exp\vtol_02\data\vtol_02_ext03_r_co.paa"
                }
            },
            {
                "Braune Tarnung",
                "civ",
                {
                    "a3\air_f_exp\vtol_02\data\vtol_02_ext01_bhex_co.paa",
                    "a3\air_f_exp\vtol_02\data\vtol_02_ext02_bhex_co.paa",
                    "a3\air_f_exp\vtol_02\data\vtol_02_ext03_l_bhex_co.paa",
                    "a3\air_f_exp\vtol_02\data\vtol_02_ext03_r_bhex_co.paa"
                }
            },
            {
                "Grüne Tarnung",
                "civ",
                {
                    "a3\air_f_exp\vtol_02\data\vtol_02_ext01_ghex_co.paa",
                    "a3\air_f_exp\vtol_02\data\vtol_02_ext02_ghex_co.paa",
                    "a3\air_f_exp\vtol_02\data\vtol_02_ext03_l_ghex_co.paa",
                    "a3\air_f_exp\vtol_02\data\vtol_02_ext03_r_ghex_co.paa"
                }
            }
        };
		materials[] = {
            0, 1, 2, 3
        };
    };

    class O_T_VTOL_02_vehicle_F {  //kein shop
        vItemSpace = 1000;
        conditions = "license_civ_pilot";
        price_civ = 30000000;
        price_cop = 175000;
        price_med = 175000;
        textures[] = {
          {
              "Graue Tarnung",
              "civ",
              {
                  "a3\air_f_exp\vtol_02\data\vtol_02_ext01_co.paa",
                  "a3\air_f_exp\vtol_02\data\vtol_02_ext02_co.paa",
                  "a3\air_f_exp\vtol_02\data\vtol_02_ext03_l_co.paa",
                  "a3\air_f_exp\vtol_02\data\vtol_02_ext03_r_co.paa"
              }
          },
          {
              "Braune Tarnung",
              "civ",
              {
                  "a3\air_f_exp\vtol_02\data\vtol_02_ext01_bhex_co.paa",
                  "a3\air_f_exp\vtol_02\data\vtol_02_ext02_bhex_co.paa",
                  "a3\air_f_exp\vtol_02\data\vtol_02_ext03_l_bhex_co.paa",
                  "a3\air_f_exp\vtol_02\data\vtol_02_ext03_r_bhex_co.paa"
              }
          },
          {
              "Grüne Tarnung",
              "civ",
              {
                  "a3\air_f_exp\vtol_02\data\vtol_02_ext01_ghex_co.paa",
                  "a3\air_f_exp\vtol_02\data\vtol_02_ext02_ghex_co.paa",
                  "a3\air_f_exp\vtol_02\data\vtol_02_ext03_l_ghex_co.paa",
                  "a3\air_f_exp\vtol_02\data\vtol_02_ext03_r_ghex_co.paa"
              }
          }
        };
		materials[] = {
            0, 1, 2, 3
        };
    };

    class O_Heli_Light_02_unarmed_F {  //Orca
        vItemSpace = 100;
        conditions = "license_civ_pilot || {license_med_mAir}";
        price_civ = 2400000;
        price_cop = 43000;
        price_med = 300000;
        textures[] = {
            {
                "Weiss / Blau",
                "civ",
                {
                    "\a3\air_f\Heli_Light_02\Data\heli_light_02_ext_civilian_co.paa"
                }
            },
            {
                "Grüne Tarnung",
                "civ",
                {
                    "\a3\air_f\Heli_Light_02\Data\heli_light_02_ext_indp_co.paa"
                }
            },
            {
                "Braune Tarnung",
                "civ",
                {
                    "\a3\air_f\Heli_Light_02\Data\heli_light_02_ext_opfor_co.paa"
                }
            },
            {
                "Rettungsdienst",
                "med",
                {
                    "texture\rd\medic_orca.paa"
                }
            },
            {
                "Polizei",
                "cop",
                {
                    "texture\cop\polizei_orca.paa"
                }
            }
        };
		materials[] = {
            0
        };
    };

    class B_SDV_01_F {  //kein civ
        vItemSpace = 50;
        conditions = "license_civ_boat || {license_cop_cg}";
        price_civ = 150000;
        price_cop = 25000;
        price_med = 25000;
        textures[] = {};
		materials[] = {
            0
        };
    };

    class C_Van_01_fuel_F {  //Truck Fuel
        vItemSpace = 120;
        vFuelSpace = 19500;
        conditions = "license_civ_driver";
        price_civ = 95000;
        price_cop = 450000;
        price_med = 450000;
        textures[] = {
            {
                "Weiss",
                "civ",
                {
                    "a3\soft_f_gamma\van_01\data\van_01_ext_co.paa",
                    "a3\soft_f_gamma\van_01\data\van_01_tank_red_co.paa"
                }
            },
            {
                "Rot",
                "civ",
                {
                    "a3\soft_f_gamma\van_01\data\van_01_ext_red_co.paa",
                    "a3\soft_f_gamma\van_01\data\van_01_tank_red_co.paa"
                }
            },
            {
                "Schwarz",
                "civ",
                {
                    "a3\soft_f_gamma\van_01\data\van_01_ext_black_co.paa",
                    "a3\soft_f_gamma\van_01\data\van_01_tank_red_co.paa"
                }
            }
        };
		materials[] = {
            0, 1
        };
    };

    class I_Truck_02_fuel_F {  //Zamak Fuel
        vItemSpace = 250;
        vFuelSpace = 42000;
        conditions = "license_civ_trucking";
        price_civ = 250000;
        price_cop = 700000;
        price_med = 700000;
        textures[] = {
            {
                "Weiss",
                "civ",
                {
                    "\A3\Soft_F_Beta\Truck_02\data\truck_02_kab_co.paa",
                    "\A3\Soft_F_Beta\Truck_02\data\truck_02_fuel_co.paa"
                }
            },
            {
                "Blau",
                "civ",
                {
                    "a3\soft_f_beta\truck_02\data\truck_02_kab_blue_co.paa",
                    "\A3\Soft_F_Beta\Truck_02\data\truck_02_fuel_co.paa"
                }
            }
        };
		materials[] = {
            0, 1
        };
    };

    class I_Heli_light_03_unarmed_F {  //kein civ
        vItemSpace = 100;
        conditions = "license_civ_rebel || {license_cop_cAir}";
        price_civ = 2000000;
        price_cop = 55000;
        price_med = 200000;
        textures[] = {
            {
                "Polizei",
                "cop",
                {
                    "texture\cop\polizei_hellcat.paa"
                }
            },
            {
                "Rettungsdienst",
                "med",
                {
                    "texture\cop\polizei_hellcat.paa"
                }
            }
        };
		materials[] = {
            0
        };
    };

    class I_G_Van_01_fuel_F {  //Truck Fuel,kein shop
        vItemSpace = 400;
        vFuelSpace = 19500;
        conditions = "license_civ_driver";
        price_civ = 1000000;
        price_cop = 1000000;
        price_med = 1000000;
        textures[] = {
            {
                "Grüne Tarnung",
                "civ",
                {
                    "\A3\soft_f_bootcamp\Van_01\data\van_01_ext_ig_01_co.paa",
                    "\A3\soft_f_bootcamp\van_01\data\van_01_tank_ig_01_co.paa"
                }
            },
            {
                "Weisse Tarnung",
                "civ",
                {
                    "\A3\soft_f_bootcamp\Van_01\data\van_01_ext_ig_02_co.paa",
                    "\A3\soft_f_bootcamp\van_01\data\van_01_tank_ig_02_co.paa"
                }
            },
            {
                "Braune Tarnung",
                "civ",
                {
                    "\A3\soft_f_bootcamp\Van_01\data\van_01_ext_ig_03_co.paa",
                    "\A3\soft_f_bootcamp\van_01\data\van_01_tank_ig_03_co.paa"
                }
            }
        };
		materials[] = {
            0, 1
        };
    };

    class I_C_Van_01_transport_F {  //Truck,kein shop
        vItemSpace = 400;
        conditions = "license_civ_driver";
        price_civ = 1000000;
        price_cop = 1000000;
        price_med = 1000000;
        textures[] = {
            {
                "Grüne Tarnung",
                "civ",
                {
                    "\A3\soft_f_bootcamp\Van_01\data\van_01_ext_ig_01_co.paa",
                    "\A3\soft_f_bootcamp\van_01\data\van_01_adds_ig_01_co.paa"
                }
            },
            {
                "Weisse Tarnung",
                "civ",
                {
                    "\A3\soft_f_bootcamp\Van_01\data\van_01_ext_ig_02_co.paa",
                    "\A3\soft_f_bootcamp\van_01\data\van_01_adds_ig_02_co.paa"
                }
            },
            {
                "Braune Tarnung",
                "civ",
                {
                    "\A3\soft_f_bootcamp\Van_01\data\van_01_ext_ig_03_co.paa",
                    "\A3\soft_f_bootcamp\van_01\data\van_01_adds_ig_03_co.paa"
                }
            }
        };
		
		materials[] = {
            0, 1
        };
    };

    class I_G_Offroad_01_F {
        vItemSpace = 100;
        conditions = "license_civ_driver";
        price_civ = 50000;
        price_cop = 30000;
        price_med = 30000;
        textures[] = {
            {
                "Grüne Tarnung",
                "civ",
                {
                    "\A3\soft_f_bootcamp\Offroad_01\data\offroad_01_ext_ig_01_co.paa",
                }
            },
            {
                "Braune Tarnung",
                "civ",
                {
                    "\A3\soft_f_bootcamp\Offroad_01\data\offroad_01_ext_ig_03_co.paa",
                }
            },
            {
                "Wüsten Tarnung",
                "civ",
                {
                    "\A3\soft_f_bootcamp\Offroad_01\data\offroad_01_ext_ig_06_co.paa",
                }
            }
        };
		materials[] = {
            0
        };
    };

    class B_Truck_01_ammo_F {  //kein shop
        vItemSpace = 700;
        conditions = "";
        price_civ = 1200000;
        price_cop = 1200000;
        price_med = 1200000;
        textures[] = {};
		materials[] = {
            0, 1 ,2
        };
    };

    class B_Truck_01_covered_F {  //Hemtt abgedeckt
        vItemSpace = 800;
        conditions = "license_civ_trucking";
        price_civ = 1100000;
        price_cop = 1100000;
        price_med = 1100000;
        textures[] = {};
		materials[] = {
            0, 1 ,2
        };
    };

    class B_Truck_01_fuel_F {  //Hemtt Fuel
        vItemSpace = 650;
        vFuelSpace = 50000;
        conditions = "license_civ_trucking";
        price_civ = 1200000;
        price_cop = 1400000;
        price_med = 1400000;
        textures[] = {};
		materials[] = {
            0, 1 ,2
        };
    };

    class B_Heli_Attack_01_F {
        vItemSpace = 100;
        conditions = "license_cop_cAir";
        price_civ = 15000000;
        price_cop = 110000;
        price_med = 1500000;
        textures[] = {
            {
                "Polizei",
                "cop",
                {
                    "texture\cop\polizei_blackfoot.paa"
                }
            }
        };
		materials[] = {
            0
        };
    };
	
	class B_APC_Wheeled_01_cannon_F {
        vItemSpace = 100;
        conditions = "";
        price_civ = 15000000;
        price_cop = 1500000;
        price_med = 1500000;
        textures[] = {
            {
                "Polizei",
                "cop",
                {
                    "#(rgb,8,8,3)color(1,0,0,1)"
                }
            }
        };
		materials[] = {
            0
        };
    };
    class O_Truck_03_ammo_F {  //kein shop
        vItemSpace = 1100;
        conditions = "license_civ_trucking";
        price_civ = 1800000;
        price_cop = 1800000;
        price_med = 1800000;
        textures[] = {
            {
                "Braune Tarnung",
                "civ",
                {
                    "a3\soft_f_epc\truck_03\data\truck_03_ext01_co.paa",
                    "a3\soft_f_epc\truck_03\data\truck_03_ext02_co.paa",
                    "a3\soft_f_epc\truck_03\data\truck_03_cargo_co.paa",
                    "a3\structures_f\data\metal\containers\containers_02_set_co.paa"
                }
            },
            {
                "Grüne Tarnung",
                "civ",
                {
                    "a3\soft_f_exp\truck_03\data\truck_03_ext01_ghex_co.paa",
                    "a3\soft_f_exp\truck_03\data\truck_03_ext02_ghex_co.paa",
                    "a3\soft_f_exp\truck_03\data\truck_03_cargo_ghex_co.paa",
                    "a3\structures_f\data\metal\containers\containers_colors_05_co.paa"
                }
            }
        };
		materials[] = {
            0, 1, 2, 3
        };
    };

    class C_Van_02_transport_F {  //Van Transport
        vItemSpace = 150;
        conditions = "license_civ_driver";
        price_civ = 80000;
        price_cop = 25000;
        price_med = 1800000;
        textures[] = {
            {
                "Braun",
                "civ",
                {
                    "a3\soft_f_orange\van_02\data\van_body_syndikat_co.paa"
                }
            },
            {
                "Maskiert",
                "civ",
                {
                    "a3\soft_f_orange\van_02\data\van_body_masked_co.paa"
                }
            },
            {
                "Grün",
                "civ",
                {
                    "a3\soft_f_orange\van_02\data\van_body_green_co.paa"
                }
            },
            {
                "Schwarz",
                "civ",
                {
                    "a3\soft_f_orange\van_02\data\van_body_black_co.paa"
                }
            },
            {
                "Rot",
                "civ",
                {
                    "a3\soft_f_orange\van_02\data\van_body_red_co.paa"
                }
            },
            {
                "Blau",
                "civ",
                {
                    "a3\soft_f_orange\van_02\data\van_body_blue_co.paa"
                }
            },
            {
                "Orange",
                "civ",
                {
                    "a3\soft_f_orange\van_02\data\van_body_orange_co.paa"
                }
            },
            {
                "Weiß",
                "civ",
                {
                    "a3\soft_f_orange\van_02\data\van_body_white_co.paa"
                }
            },
            {
                "AAN",
                "civ",
                {
                    "a3\soft_f_orange\van_02\data\van_body_aan_co.paa"
                }
            }
        };
		materials[] = {
            0
        };
    };

    class C_Van_02_vehicle_F {  //Van Cargo
        vItemSpace = 170;
        conditions = "license_civ_driver";
        price_civ = 110000;
        price_cop = 25000;
        price_med = 1800000;
        textures[] = {
            {
                "Braun",
                "civ",
                {
                    "a3\soft_f_orange\van_02\data\van_body_syndikat_co.paa"
                }
            },
            {
                "Maskiert",
                "civ",
                {
                    "a3\soft_f_orange\van_02\data\van_body_masked_co.paa"
                }
            },
            {
                "Grün",
                "civ",
                {
                    "a3\soft_f_orange\van_02\data\van_body_green_co.paa"
                }
            },
            {
                "Schwarz",
                "civ",
                {
                    "a3\soft_f_orange\van_02\data\van_body_black_co.paa"
                }
            },
            {
                "Rot",
                "civ",
                {
                    "a3\soft_f_orange\van_02\data\van_body_red_co.paa"
                }
            },
            {
                "Blau",
                "civ",
                {
                    "a3\soft_f_orange\van_02\data\van_body_blue_co.paa"
                }
            },
            {
                "Orange",
                "civ",
                {
                    "a3\soft_f_orange\van_02\data\van_body_orange_co.paa"
                }
            },
            {
                "Weiß",
                "civ",
                {
                    "a3\soft_f_orange\van_02\data\van_body_white_co.paa"
                }
            },
            {
                "AAN",
                "civ",
                {
                    "a3\soft_f_orange\van_02\data\van_body_aan_co.paa"
                }
            },
            {
                "Lieferservice",
                "civ",
                {
                    "a3\soft_f_orange\van_02\data\van_body_armazon_co.paa"
                }
            },
            {
                "Fuel",
                "civ",
                {
                    "a3\soft_f_orange\van_02\data\van_body_fuel_co.paa"
                }
            },
            {
                "Blue Pearl",
                "civ",
                {
                    "a3\soft_f_orange\van_02\data\van_body_bluepearl_co.paa"
                }
            },
            {
                "Vrana",
                "civ",
                {
                    "a3\soft_f_orange\van_02\data\van_body_vrana_co.paa"
                }
            },
            {
                "Daltgreen",
                "civ",
                {
                    "a3\soft_f_orange\van_02\data\van_body_daltgreen_co.paa"
                }
            },
            {
                "Redstone",
                "civ",
                {
                    "a3\soft_f_orange\van_02\data\van_body_redstone_co.paa"
                }
            }
        };
		materials[] = {
            0
        };
    };

    class B_GEN_Van_02_transport_F {  //Kein civ
        vItemSpace = 100;
        conditions = "license_civ_driver";
        price_civ = 1800000;
        price_cop = 25000;
        price_med = 1800000;
        textures[] = {
            {
                "Polizei",
                "cop",
                {
                    "texture\cop\polizei_transporter.paa"
                }
            }
        };
		materials[] = {
            0
		};
    };

    class B_GEN_Van_02_vehicle_F {  //kein civ
        vItemSpace = 100;
        conditions = "license_civ_driver";
        price_civ = 1800000;
        price_cop = 25000;
        price_med = 0;
        textures[] = {
            {
                "Polizei",
                "cop",
                {
                    "texture\cop\polizei_transporter.paa"
                }
            },
            {
                "Rettungsdienst",
                "med",
                {
                    "texture\rd\rd_transporter.paa"
                }
			},
            {
                "Einsatzleiter",
                "med",
                {
                    "texture\fw\transporter\fw_transporter.jpg"
                }
            }
        };
        materials[] = {
            0
        };
    };

    class C_Van_02_medevac_F {
        vItemSpace = 100;
        conditions = "license_civ_driver";
        price_civ = 1800000;
        price_cop = 0;
        price_med = 0;
        textures[] = {
            {
                "Rettungsdienst",
                "med",
                {
                    "texture\rd\rd_transporter.paa"
                }
			},
			{
				"Einsatzleiter",
				"med",
				{
					"texture\fw\transporter\fw_transporter.jpg"
				}
            }
        };
        materials[] = {
            0
        };
    };

    class O_Heli_Transport_04_medevac_F {
        vItemSpace = 300;
        conditions = "";
        price_civ = 4500000;
        price_cop = 1800000;
        price_med = 450000;
        textures[] = {
            {
                "Rettungsdienst",
                "med",
                {
                    "texture\rd\medic_taru_1.paa",
                    "texture\rd\medic_taru_2.paa",
                    "texture\rd\medic_taru_3.paa",
                    "texture\rd\medic_taru_4.paa"
                }
            }
        };
		materials[] = {
            0
		};
    };

    class O_Heli_Transport_04_box_F {  //Taru Cargo
        vItemSpace = 300;
        conditions = "license_civ_pilot";
        price_civ = 6100000;
        price_cop = 1800000;
        price_med = 1800000;
        textures[] = {};
		materials[] = {
            0
		};
    };
	
	class B_APC_Tracked_01_CRV_F {  //Bobcat
        vItemSpace = 200;
        conditions = "";
        price_civ = -1;
        price_cop = -1;
        price_med = 1;
        textures[] = {
			{
				"Rettungsdienst",
				"med",
				{
					"texture\fw\bobcat\fw_bobcat_1.jpg"
				}
			}
		};
		materials[] = {
            0
		};
    };
};
