/*
*    Format:
*        licenses: ARRAY (This is for limiting spawn to certain things)
*           0: License Name
*           1: License Check Type
*                false: If license isn't set
*                true: If license is set
*           Example:
*                licenses[] = { { "pilot", true }, { "rebel", false } }; //Shows up for players with pilot and without rebel license.
*
*        level: ARRAY (This is for limiting spawn to certain things)
*            0: Variable to read from
*            1: Variable Value Type (SCALAR / BOOL / EQUAL / INVERSE)
*                SCALAR: VALUE => VALUE
*                BOOL: VALUE EXISTS
*                EQUAL: VALUE isEqualTo VALUE
*                INVERSE: VALUE <= VALUE
*            2: What to compare to (-1 = Check Disabled)
*
*/
class CfgSpawnPoints {

    class Altis {
        class Civilian {
			class Sofia {
                displayName = "Sofia [Hauptstadt]";
                spawnMarker = "civ_sofia";
                icon = "\a3\ui_f\data\map\MapControl\watertower_ca.paa";
                conditions = "";
            };
			
			class Flugzeugtraeger {
                displayName = "Flugzeugträger";
                spawnMarker = "flugzeugträger_Spawn";
                icon = "\a3\ui_f\data\map\MapControl\watertower_ca.paa";
                conditions = "";
            };
			
			class Zentum {
                displayName = "(Kommt vor der Beta raus!) Illigalles Zentum!";
                displayName = "(Kommt vor der Beta raus!) Illigalles Zentum!";
                spawnMarker = "illigalles";
                icon = "\a3\ui_f\data\map\MapControl\watertower_ca.paa";
                conditions = "";
            };
			
            class Kavala {
                displayName = "Kavala";
                spawnMarker = "civ_spawn_1";
                icon = "\a3\ui_f\data\map\MapControl\watertower_ca.paa";
				conditions = "license_civ_kavala";
            };

            class Agios {
                displayName = "Agios";
                spawnMarker = "civ_spawn_2";
                icon = "\a3\ui_f\data\map\MapControl\watertower_ca.paa";
                conditions = "license_civ_agios";
            };

            class Athira {
                displayName = "Athira";
                spawnMarker = "civ_spawn_4";
                icon = "\a3\ui_f\data\map\MapControl\watertower_ca.paa";
                conditions = "license_civ_athira";
            };
			
			class yakuza {
                displayName = "Yakuza HQ";
                spawnMarker = "reb_spawn_1";
                icon = "\a3\ui_f\data\map\MapControl\watertower_ca.paa";
                conditions = "license_civ_yakuza";
            };
			
			class team {
                displayName = "Team Spawn";
                spawnMarker = "admin_sawn";
                icon = "\a3\ui_f\data\map\MapControl\fuelstation_ca.paa";
                conditions = "getplayerUID player in ['76561198134533849','76561198269706597']";
            };
        };

        class Cop {
			class HQS {
                displayName = "Hauptdienststelle der Schutzpolizei";
                spawnMarker = "cop_spawn_hq_1";
                icon = "\a3\ui_f\data\map\MapControl\watertower_ca.paa";
                conditions = "";
            };
            class HQL {
                displayName = "Hauptdienststelle des Landesschutzdienstes";
                spawnMarker = "cop_spawn_hq";
                icon = "\a3\ui_f\data\map\MapControl\watertower_ca.paa";
                conditions = "";
            };
            class Pyrgos {
                displayName = "Grenzposten";
                spawnMarker = "cop_spaw";
                icon = "\a3\ui_f\data\map\MapControl\fuelstation_ca.paa";
                conditions = "";
            };
			class Kavala {
                displayName = "Dienststelle Kavala";
                spawnMarker = "cop_spawn_kavala";
                icon = "\a3\ui_f\data\map\MapControl\fuelstation_ca.paa";
                conditions = "";
            };
			class geheim_1 {
                displayName = "Geheimer Spawn";
                spawnMarker = "basti_geheim_1";
                icon = "\a3\ui_f\data\map\MapControl\fuelstation_ca.paa";
                conditions = "getplayerUID player in ['76561198134533849','76561198208681004']";
            };
            class geheim_2 {
                displayName = "Geheimer Spawn";
                spawnMarker = "basti_geheim_2";
                icon = "\a3\ui_f\data\map\MapControl\fuelstation_ca.paa";
                conditions = "getplayerUID player in ['76561198134533849','76561198208681004']";
            };
            class geheim_3 {
                displayName = "Geheimer Spawn";
                spawnMarker = "basti_geheim_3";
                icon = "\a3\ui_f\data\map\MapControl\fuelstation_ca.paa";
                conditions = "getplayerUID player in ['76561198134533849','76561198208681004']";
            };
        };

        class Medic {
			class Pyrgos {
                displayName = "Krankenhaus Sofia [Hauptstadt]";
                spawnMarker = "medic_spawn_kavala";
                icon = "\a3\ui_f\data\map\MapControl\hospital_ca.paa";
                conditions = "";
            };

            class Agios {
                displayName = "Arztpraxis Agios";
                spawnMarker = "medic_spawn_agios";
                icon = "\a3\ui_f\data\map\MapControl\hospital_ca.paa";
                conditions = "";
            };
            class Kavala {
                displayName = "Krankenhaus Flughafen";
                spawnMarker = "medic_spawn_pyrgos";
                icon = "\a3\ui_f\data\map\MapControl\hospital_ca.paa";
                conditions = "";
            };
        };
		
		class ARC {
			class kavala {
                displayName = "Kavala Werkstatt";
                icon = "\a3\ui_f\data\map\MapControl\hospital_ca.paa";
                conditions = "";
				spawnMarker = "arc_spawn_kavala";
			};
		};
    };

};