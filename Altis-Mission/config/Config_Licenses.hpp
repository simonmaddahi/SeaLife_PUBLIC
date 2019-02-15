/*
*    class:
*        variable = Variable Name
*        displayName = License Name
*        price = License Price
*        illegal = Illegal License
*        side = side indicator
*/
class Licenses {
    //Civilian Licenses
    class driver {
        variable = "driver";
        displayName = "Fahrerlaubnis";
        price = 3000;
        illegal = false;
        side = "civ";
    };

    class boat {
        variable = "boat";
        displayName = "Bootsführerschein";
        price = 12000;
        illegal = false;
        side = "civ";
    };

    class pilot {
        variable = "pilot";
        displayName = "Flugschein";
        price = 175000;
        illegal = false;
        side = "civ";
    };

    class trucking {
        variable = "trucking";
        displayName = "LKW-Führerschein";
        price = 20000;
        illegal = false;
        side = "civ";
    };

    class gun {
        variable = "gun";
        displayName = "Waffenschein";
        price = 55000;
        illegal = false;
        side = "civ";
    };

    class dive {
        variable = "dive";
        displayName = "Taucherausbildung";
        price = 7500;
        illegal = false;
        side = "civ";
    };

    class home {
        variable = "home";
        displayName = "Eigentümerlizenz";
        price = 750000;
        illegal = false;
        side = "civ";
    };
	
	class rocker {
        variable = "rocker";
        displayName = "Rocker-Mitgliedschaft";
        price = 750000;
        illegal = true;
        side = "civ";
    };
	
	class mafia {
        variable = "mafia";
        displayName = "Mafia-Mitgliedschaft";
        price = 750000;
        illegal = true;
        side = "civ";
    };
	
	class yakuza {
        variable = "yakuza";
        displayName = "Yakuza-Mitgliedschaft";
        price = 750000;
        illegal = true;
        side = "civ";
    };
	
	class kavala {
        variable = "kavala";
        displayName = "Wohnrecht in Kavala";
        price = 750000;
        illegal = false;
        side = "civ";
    };
	
	class athira {
        variable = "athira";
        displayName = "Wohnrecht in Athira";
        price = 750000;
        illegal = false;
        side = "civ";
    };
	
	class agios {
        variable = "agios";
        displayName = "Wohnrecht in Agios Dionysios";
        price = 750000;
        illegal = false;
        side = "civ";
    };
	
	class flughafen {
        variable = "flughafen";
        displayName = "Wohnrecht in Flughafen";
        price = 750000;
        illegal = false;
        side = "civ";
    };
	
    class venox {
        variable = "venox";
        displayName = "Venox-Mitgliedschaft";
        price = 7500000;
        illegal = false;
        side = "civ";
    };
	
	class ktm2 {
        variable = "ktm2";
        displayName = "KTM-Mitgliedschaft";
        price = 8000;
        illegal = false;
        side = "civ";
    };
	
	class premium1 {
        variable = "premium1";
        displayName = "Premium-LVL 1";
        price = 7500000;
        illegal = false;
        side = "civ";
    };
	
	class premium2 {
        variable = "premium2";
        displayName = "Premium-LVL 2";
        price = 7500000;
        illegal = false;
        side = "civ";
    };
	
	class premium3 {
        variable = "premium3";
        displayName = "Premium-LVL 3";
        price = 7500000;
        illegal = false;
        side = "civ";
    };
	
	class premiumvip {
        variable = "premiumvip";
        displayName = "Premium-VIP";
        price = 7500000;
        illegal = false;
        side = "civ";
    };
	
	class beta {
        variable = "beta";
        displayName = "Beta-Teilnehmmer";
        price = 7500000;
        illegal = false;
        side = "civ";
    };
	class premiumbeta {
        variable = "premiumbeta";
        displayName = "Premium-Beta";
        price = 7500000;
        illegal = false;
        side = "civ";
    };
	
	class team {
        variable = "team";
        displayName = "SeaLife-Mitgliedschaft";
        price = 7500000;
        illegal = false;
        side = "civ";
    };

    //Cop Licenses
    class cAir {
        variable = "cAir";
        displayName = "Polizei Flugschein";
        price = 15000;
        illegal = false;
        side = "cop";
    };

    class cg {
        variable = "cg";
        displayName = "Polizei Bootsschein";
        price = 8000;
        illegal = false;
        side = "cop";
    };
	
	class ktm {
        variable = "ktm";
        displayName = "KTM-Mitgliedschaft";
        price = 8000;
        illegal = false;
        side = "cop";
    };

    //Medic Licenses
    class mAir {
        variable = "mAir";
        displayName = "Rettungsdienst Flugschein";
        price = 15000;
        illegal = false;
        side = "med";
    };

    /////////////////////// FARMING SACHEN UND SO //////////////////////////////////////

    class drogenherstellung {
        variable = "drogenherstellung";
        displayName = "Drogenherstellung";
        price = 375000;
        illegal = true;
        side = "civ";
    };

    class entsafter {
        variable = "entsafter";
        displayName = "Entsafter";
        price = 50000;
        illegal = false;
        side = "civ";
    };

    class foodclub {
        variable = "foodclub";
        displayName = "Food Club";
        price = 100000;
        illegal = false;
        side = "civ";
    };

    class schnapsherstellung {
        variable = "schnapsherstellung";
        displayName = "Schnapsherstellung";
        price = 375000;
        illegal = true;
        side = "civ";
    };

    class genussmittel {
        variable = "genussmittel";
        displayName = "Genussmittel";
        price = 100000;
        illegal = false;
        side = "civ";
    };

    class metallurgie {
        variable = "metallurgie";
        displayName = "Metallurgie";
        price = 30000;
        illegal = false;
        side = "civ";
    };

    class baustoffe {
        variable = "baustoffe";
        displayName = "Baustoffe";
        price = 75000;
        illegal = false;
        side = "civ";
    };

    class sonderprodukte {
        variable = "sonderprodukte";
        displayName = "Sonderprodukte";
        price = 175000;
        illegal = true;
        side = "civ";
    };

    class ausstatter {
        variable = "ausstatter";
        displayName = "Ausstatter";
        price = 50000;
        illegal = false;
        side = "civ";
    };

    class gefahrenstoff {
        variable = "gefahrenstoff";
        displayName = "Gefahrenstoff";
        price = 150000;
        illegal = false;
        side = "civ";
    };

    class weiterfuehrende_metallurgie {
        variable = "weiterfuehrende_metallurgie";
        displayName = "Weiterführende Metallurgie";
        price = 25000;
        illegal = false;
        side = "civ";
    };

    class strahlenforscher {
        variable = "strahlenforscher";
        displayName = "Strahlenforscher";
        price = 515000;
        illegal = true;
        side = "civ";
    };
};
