/*
*    Format:
*        level: ARRAY (This is for limiting items to certain things)
*            0: Variable to read from
*            1: Variable Value Type (SCALAR / BOOL / EQUAL)
*            2: What to compare to (-1 = Check Disabled)
*            3: Custom exit message (Optional)
*/
class VirtualShops {
    //Virtual Shops
    class market {
        name = "STR_Shops_Market";
        side = "civ";
        license = "";
        conditions = "";
        items[] = { "oelpumpe", "axt", "shovel", "pickaxe", "waterBottle", "tbacon", "redgull", "bandage", "fuelFull", "bier", "apfel", "pfirsich", "olive" };
    };

    class med_market {
        name = "STR_Shops_Market";
        side = "med";
        license = "";
        conditions = "";
        items[] = { "coffee", "tbacon", "donuts", "waterBottle", "fuelFull", "bandage", "akku" };
    };

    class mafia {
        name = "STR_Shops_Rebel";
        side = "civ";
        license = "yakuza";
        conditions = "";
        items[] = { "waterBottle", "tbacon", "redgull", "fuelFull", "bandage", "boltcutter", "blastingcharge", "kabelbinder", "lockpick", "augenbinde" };
    };
	
	class yakuza {
        name = "STR_Shops_Rebel";
        side = "civ";
        license = "yakuza";
        conditions = "";
        items[] = { "waterBottle", "tbacon", "redgull", "fuelFull", "bandage", "boltcutter", "blastingcharge", "kabelbinder", "lockpick", "augenbinde" };
    };
	
	class rocker {
        name = "STR_Shops_Rebel";
        side = "civ";
        license = "yakuza";
        conditions = "";
        items[] = { "waterBottle", "tbacon", "redgull", "fuelFull", "bandage", "boltcutter", "blastingcharge", "kabelbinder", "lockpick", "augenbinde" };
    };

    class gang {
        name = "STR_Shops_Gang";
        side = "civ";
        license = "";
        conditions = "";
        items[] = { "fuelFull", "bandage", "boltcutter", "kabelbinder", "lockpick" };
    };

    class coffee {
        name = "STR_Shops_Coffee";
        side = "civ";
        license = "";
        conditions = "";
        items[] = {  "bandage" };
    };

    class f_station_coffee {
        name = "STR_Shop_Station_Coffee";
        side = "";
        license = "";
        conditions = "";
        items[] = {"fuelFull", "bandage"};
    };

    class cop {
        name = "STR_Shops_Cop";
        side = "cop";
        license = "";
        conditions = "";
        items[] = { "coffee", "tbacon", "donuts", "waterBottle", "redgull", "fuelFull", "bandage", "akku", "spikeStrip" };
    };

    class metall {
        name = "STR_Shops_metall";
        side = "civ";
        license = "";
        conditions = "";
        items[] = { "kupferbarren", "eisenbarren", "gussform" };
    };
    
    class spirit {
        name = "STR_Shops_spirit";
        side = "civ";
        license = "";
        conditions = "";
        items[] = { "ouzo", "rum", "whiskey", "sake" };
    };
    
    class lebensmittelexport {
        name = "STR_Shops_lebensmittelexport";
        side = "civ";
        license = "";
        conditions = "";
        items[] = { "speisalz", "spargelglas", "olivekon", "mehl", "zucker" };
    };
    
    class getraenke {
        name = "STR_Shops_getraenke";
        side = "civ";
        license = "";
        conditions = "";
        items[] = { "bier", "wein", "apfelsaft", "pfirsichsaft" };
    };
    
    //class fisch {
        //name = "STR_Shops_fisch";
        //side = "civ";
        //license = "";
        //conditions = "";
        //items[] = { "fischrauch" };
    //};
    
    class glas {
        name = "STR_Shops_glas";
        side = "civ";
        license = "";
        conditions = "";
        items[] = { "glas" };
    };
    
    //class souvenir {
        //name = "STR_Shops_souvenir";
        //side = "civ";
        //license = "";
        //conditions = "";
        //items[] = { "blattgold", "kunstwerk" };
    //};
    
    class autoindustrie {
        name = "STR_Shops_autoindustrie";
        side = "civ";
        license = "";
        conditions = "";
        items[] = { "motoroil", "benzin", "alu" };
    };
    
    class juwelier {
        name = "STR_Shops_juwelier";
        side = "civ";
        license = "";
        conditions = "";
        items[] = { "gold", "geschliffenediamanten" };
    };
    
    class forschung {
        name = "STR_Shops_forschung";
        side = "civ";
        license = "";
        conditions = "";
        items[] = { "cadmi", "ammoniumnitrat" };
    };
    
    class drogenumschlag {
        name = "STR_Shops_drogenumschlag";
        side = "civ";
        license = "";
        conditions = "";
        items[] = { "heroin", "kokain", "lsd", "marihuana" };
    };
    
    class kraftwerk {
        name = "STR_Shops_kraftwerk";
        side = "civ";
        license = "";
        conditions = "";
        items[] = { "sili", "uranang" };
    };
	
	class baumarkt {
        name = "STR_Shops_baumarkt";
        side = "civ";
        license = "";
        conditions = "";
        items[] = { "holzplatten" };
    };
	
	class baustelle {
        name = "STR_Shops_baustelle";
        side = "civ";
        license = "";
        conditions = "";
        items[] = { "zementsack" };
    };
};

/*
*    CLASS:
*        variable = Variable Name
*        displayName = Item Name
*        weight = Item Weight
*        buyPrice = Item Buy Price
*        sellPrice = Item Sell Price
*        illegal = Illegal Item
*        edible = Item Edible (-1 = Disabled)
*        icon = Item Icon
*        processedItem = Processed Item
*/
class VirtualItems {
    //Virtual Items

    class redgull {
        variable = "redgull";
        displayName = "STR_Item_RedGull";
        weight = 1;
        buyPrice = 10000;
        sellPrice = 0;
        illegal = false;
        edible = 100;
        icon = "icons\ico_redgull.paa";
    };
	
	class augenbinde {
        variable = "augenbinde";
        displayName = "STR_Item_augenbinde";
        weight = 3;
        buyPrice = 15000;
        sellPrice = 0;
        illegal = true;
        edible = -1;
        icon = "icons\ico_augenbinde.paa";
    };

    class coffee {
        variable = "coffee";
        displayName = "STR_Item_Coffee";
        weight = 1;
        buyPrice = 10;
        sellPrice = 0;
        illegal = false;
        edible = 100;
        icon = "icons\ico_coffee.paa";
    };

    class waterBottle {
        variable = "waterBottle";
        displayName = "STR_Item_WaterBottle";
        weight = 1;
        buyPrice = 10;
        sellPrice = 0;
        illegal = false;
        edible = 100;
        icon = "icons\ico_waterBottle.paa";
      };
      class tbacon {
        variable = "tbacon";
        displayName = "STR_Item_TBacon";
        weight = 1;
        buyPrice = 75;
        sellPrice = 25;
        illegal = false;
        edible = 40;
        icon = "icons\ico_tBacon.paa";
    };

    class donuts {
        variable = "donuts";
        displayName = "STR_Item_Donuts";
        weight = 1;
        buyPrice = 120;
        sellPrice = 60;
        illegal = false;
        edible = 30;
        icon = "icons\ico_donuts.paa";
      };
    //Misc
    class pickaxe {
        variable = "pickaxe";
        displayName = "STR_Item_Pickaxe";
        weight = 2;
        buyPrice = 1750;
        sellPrice = 350;
        illegal = false;
        edible = -1;
        icon = "icons\ico_pickaxe.paa";
    };
	
	class shovel {
        variable = "shovel";
        displayName = "STR_Item_Shovel";
        weight = 2;
        buyPrice = 1250;
        sellPrice = 250;
        illegal = false;
        edible = -1;
        icon = "icons\ico_pickaxe.paa";
    };
	
	class oelpumpe {
        variable = "oelpumpe";
        displayName = "STR_Item_oelpumpe";
        weight = 2;
        buyPrice = 4500;
        sellPrice = 450;
        illegal = false;
        edible = -1;
        icon = "icons\ico_pickaxe.paa";
    };
	
	class axt {
        variable = "axt";
        displayName = "STR_Item_axt";
        weight = 2;
        buyPrice = 1150;
        sellPrice = 450;
        illegal = false;
        edible = -1;
        icon = "icons\ico_pickaxe.paa";
    };

    class fuelEmpty {
        variable = "fuelEmpty";
        displayName = "STR_Item_FuelE";
        weight = 2;
        buyPrice = -1;
        sellPrice = 10;
        illegal = false;
        edible = -1;
        icon = "icons\ico_fuelEmpty.paa";
    };

    class fuelFull {
        variable = "fuelFull";
        displayName = "STR_Item_FuelF";
        weight = 5;
        buyPrice = 8500;
        sellPrice = 500;
        illegal = false;
        edible = -1;
        icon = "icons\ico_fuel.paa";
    };

    class spikeStrip {
        variable = "spikeStrip";
        displayName = "STR_Item_SpikeStrip";
        weight = 15;
        buyPrice = 25000;
        sellPrice = 1200;
        illegal = true;
        edible = -1;
        icon = "icons\ico_spikeStrip.paa";
    };

    class lockpick {
        variable = "lockpick";
        displayName = "STR_Item_Lockpick";
        weight = 1;
        buyPrice = 30000;
        sellPrice = 750;
        illegal = true;
        edible = -1;
        icon = "icons\ico_lockpick.paa";
    };

    class goldbar {
        variable = "goldBar";
        displayName = "STR_Item_GoldBar";
        weight = 12;
        buyPrice = -1;
        sellPrice = 275000;
        illegal = true;
        edible = -1;
        icon = "icons\ico_goldBar.paa";
    };

    class blastingcharge {
        variable = "blastingCharge";
        displayName = "STR_Item_BCharge";
        weight = 15;
        buyPrice = 125000;
        sellPrice = 10000;
        illegal = true;
        edible = -1;
        icon = "icons\ico_blastingCharge.paa";
    };

    class boltcutter {
        variable = "boltCutter";
        displayName = "STR_Item_BCutter";
        weight = 5;
        buyPrice = 82500;
        sellPrice = 1000;
        illegal = true;
        edible = -1;
        icon = "icons\ico_boltCutter.paa";
    };

    class defusekit {
        variable = "defuseKit";
        displayName = "STR_Item_DefuseKit";
        weight = 2;
        buyPrice = 2500;
        sellPrice = 0;
        illegal = true;
        edible = -1;
        icon = "icons\ico_defuseKit.paa";
    };

    class storagesmall {
        variable = "storageSmall";
        displayName = "STR_Item_StorageBS";
        weight = 5;
        buyPrice = 250000;
        sellPrice = 50000;
        illegal = false;
        edible = -1;
        icon = "icons\ico_storageSmall.paa";
    };

    class storagebig {
        variable = "storageBig";
        displayName = "STR_Item_StorageBL";
        weight = 10;
        buyPrice = 500000;
        sellPrice = 125000;
        illegal = false;
        edible = -1;
        icon = "icons\ico_storageBig.paa";
    };

	class akku {
		variable = "akku";
        displayName = "STR_Item_mlockp";
        weight = 1;
        buyPrice = 2500;
        sellPrice = 50;
        illegal = false;
        edible = -1;
        icon = "icons\ico_lockpick.paa";
	};

	class bandage {
		variable = "bandage";
        displayName = "STR_Item_bandage";
        weight = 1;
        buyPrice = 150;
        sellPrice = 50;
        illegal = false;
        edible = -1;
        icon="icons\ico_bandage.paa";
	};

    class benzin {
		variable = "benzin";
        displayName = "STR_Item_benzin";
        weight = 3;
        buyPrice = -1;
        sellPrice = 5550;
        illegal = false;
        edible = -1;
        icon="icons\ico_oilProcessed.paa";
	};

    class kabelbinder {
		variable = "kabelbinder";
        displayName = "STR_Item_kabelbinder";
        weight = 4;
        buyPrice = 5000;
        sellPrice = 500;
        illegal = true;
        edible = -1;
        icon="icons\ico_kabelbinder.paa";
	};

    class stein {
		variable = "stein";
        displayName = "STR_Item_stein";
        weight = 4;
        buyPrice = -1;
        sellPrice = -1;
        illegal = false;
        edible = -1;
        icon="icons\ico_rock.paa";
	};

    class zementsack {
		variable = "zementsack";
        displayName = "STR_Item_zementsack";
        weight = 3;
        buyPrice = -1;
        sellPrice = 2250;
        illegal = false;
        edible = -1;
        icon="icons\ico_cement.paa";
	};

    class hopfen {
		variable = "hopfen";
        displayName = "STR_Item_hopfen";
        weight = 3;
        buyPrice = -1;
        sellPrice = -1;
        illegal = false;
        edible = -1;
        icon="icons\ico_rock.paa";
	};

    class bier {
		variable = "bier";
        displayName = "STR_Item_bier";
        weight = 2;
        buyPrice = -1;
        sellPrice = 2100;
        illegal = false;
        edible = -1;
        icon="icons\ico_cement.paa";
	};

    class mohn {
		variable = "mohn";
        displayName = "STR_Item_mohn";
        weight = 5;
        buyPrice = -1;
        sellPrice = -1;
        illegal = true;
        edible = -1;
        icon="icons\ico_rock.paa";
	};

    class heroin {
		variable = "heroin";
        displayName = "STR_Item_heroin";
        weight = 4;
        buyPrice = -1;
        sellPrice = 6000;
        illegal = true;
        edible = -1;
        icon="icons\ico_cement.paa";
	};

    class kokainpflanze {
		variable = "kokainpflanze";
        displayName = "STR_Item_kokainpflanze";
        weight = 5;
        buyPrice = -1;
        sellPrice = -1;
        illegal = true;
        edible = -1;
        icon="icons\ico_rock.paa";
	};

    class kokain {
		variable = "kokain";
        displayName = "STR_Item_kokain";
        weight = 4;
        buyPrice = -1;
        sellPrice = 5900;
        illegal = true;
        edible = -1;
        icon="icons\ico_cement.paa";
	};

    class cannabispflanze {
		variable = "cannabispflanze";
        displayName = "STR_Item_cannabispflanze";
        weight = 5;
        buyPrice = -1;
        sellPrice = -1;
        illegal = true;
        edible = -1;
        icon="icons\ico_rock.paa";
	};

    class cannabis {
		variable = "cannabis";
        displayName = "STR_Item_cannabis";
        weight = 3;
        buyPrice = -1;
        sellPrice = 1825;
        illegal = true;
        edible = -1;
        icon="icons\ico_cement.paa";
	};

    class goldm {
		variable = "goldm";
        displayName = "STR_Item_goldm";
        weight = 3;
        buyPrice = -1;
        sellPrice = 1825;
        illegal = false;
        edible = -1;
        icon="icons\ico_rock.paa";
	};

    class blattgold {
		variable = "blattgold";
        displayName = "STR_Item_blattgold";
        weight = 3;
        buyPrice = -1;
        sellPrice = 1825;
        illegal = false;
        edible = -1;
        icon="icons\ico_cement.paa";
	};

    class apfel {
		variable = "apfel";
        displayName = "STR_Item_apfel";
        weight = 2;
        buyPrice = -1;
        sellPrice = 100;
        illegal = false;
        edible = -1;
        icon="icons\ico_rock.paa";
	};

    class apfelsaft {
		variable = "apfelsaft";
        displayName = "STR_Item_apfelsaft";
        weight = 1;
        buyPrice = -1;
        sellPrice = 150;
        illegal = false;
        edible = -1;
        icon="icons\ico_cement.paa";
	};

    class pfirsich {
		variable = "pfirsich";
        displayName = "STR_Item_pfirsich";
        weight = 2;
        buyPrice = -1;
        sellPrice = 100;
        illegal = false;
        edible = -1;
        icon="icons\ico_rock.paa";
	};

    class pfirsichsaft {
		variable = "pfirsichsaft";
        displayName = "STR_Item_pfirsichsaft";
        weight = 1;
        buyPrice = -1;
        sellPrice = 150;
        illegal = false;
        edible = -1;
        icon="icons\ico_cement.paa";
	};

    class kunstwerk {
		variable = "kunstwerk";
        displayName = "STR_Item_kunstwerk";
        weight = 3;
        buyPrice = -1;
        sellPrice = 1825;
        illegal = false;
        edible = -1;
        icon="icons\ico_cement.paa";
	};

    class fisch {
		variable = "fisch";
        displayName = "STR_Item_fisch";
        weight = 3;
        buyPrice = -1;
        sellPrice = 1825;
        illegal = false;
        edible = -1;
        icon="icons\ico_cement.paa";
	};

    class fischrauch {
		variable = "fischrauch";
        displayName = "STR_Item_fischrauch";
        weight = 3;
        buyPrice = -1;
        sellPrice = 1825;
        illegal = false;
        edible = -1;
        icon="icons\ico_cement.paa";
	};

    class oel {
		variable = "oel";
        displayName = "STR_Item_oel";
        weight = 6;
        buyPrice = -1;
        sellPrice = -1;
        illegal = false;
        edible = -1;
        icon="icons\ico_cement.paa";
	};

    class motor {
		variable = "motor";
        displayName = "STR_Item_motor";
        weight = 3;
        buyPrice = -1;
        sellPrice = 5400;
        illegal = false;
        edible = -1;
        icon="icons\ico_cement.paa";
	};

    class sand {
		variable = "sand";
        displayName = "STR_Item_sand";
        weight = 3;
        buyPrice = -1;
        sellPrice = -1;
        illegal = false;
        edible = -1;
        icon="icons\ico_cement.paa";
	};

    class glas {
		variable = "glas";
        displayName = "STR_Item_glas";
        weight = 2;
        buyPrice = -1;
        sellPrice = 1725;
        illegal = false;
        edible = -1;
        icon="icons\ico_cement.paa";
	};

    class frosch {
		variable = "frosch";
        displayName = "STR_Item_frosch";
        weight = 5;
        buyPrice = -1;
        sellPrice = -1;
        illegal = true;
        edible = -1;
        icon="icons\ico_cement.paa";
	};

    class lsd {
		variable = "lsd";
        displayName = "STR_Item_lsd";
        weight = 4;
        buyPrice = -1;
        sellPrice = 6010;
        illegal = true;
        edible = -1;
        icon="icons\ico_cement.paa";
	};

    class anis {
		variable = "anis";
        displayName = "STR_Item_anis";
        weight = 4;
        buyPrice = -1;
        sellPrice = -1;
        illegal = false;
        edible = -1;
        icon="icons\ico_cement.paa";
	};

    class ouzo {
		variable = "ouzo";
        displayName = "STR_Item_ouzo";
        weight = 3;
        buyPrice = -1;
        sellPrice = 3610;
        illegal = true;
        edible = -1;
        icon="icons\ico_cement.paa";
	};

    class spargel {
		variable = "spargel";
        displayName = "STR_Item_spargel";
        weight = 3;
        buyPrice = -1;
        sellPrice = -1;
        illegal = false;
        edible = -1;
        icon="icons\ico_cement.paa";
	};

    class spargelglas {
		variable = "spargelglas";
        displayName = "STR_Item_spargelglas";
        weight = 2;
        buyPrice = -1;
        sellPrice = 1850;
        illegal = false;
        edible = -1;
        icon="icons\ico_cement.paa";
	};

    class tomate {
		variable = "tomate";
        displayName = "STR_Item_tomate";
        weight = 3;
        buyPrice = -1;
        sellPrice = -1;
        illegal = false;
        edible = -1;
        icon="icons\ico_cement.paa";
	};

    class tomatensaft {
		variable = "tomatensaft";
        displayName = "STR_Item_tomatensaft";
        weight = 3;
        buyPrice = -1;
        sellPrice = -1;
        illegal = false;
        edible = -1;
        icon="icons\ico_cement.paa";
	};

    class olive {
		variable = "olive";
        displayName = "STR_Item_olive";
        weight = 3;
        buyPrice = -1;
        sellPrice = 150;
        illegal = false;
        edible = -1;
        icon="icons\ico_cement.paa";
	};

    class olivenoel {
		variable = "olivenoel";
        displayName = "STR_Item_olivenoel";
        weight = 3;
        buyPrice = -1;
        sellPrice = 1825;
        illegal = false;
        edible = -1;
        icon="icons\ico_cement.paa";
	};

    class goldnugget {
		variable = "goldnugget";
        displayName = "STR_Item_goldnugget";
        weight = 6;
        buyPrice = -1;
        sellPrice = -1;
        illegal = false;
        edible = -1;
        icon="icons\ico_cement.paa";
	};

    class gold {
		variable = "gold";
        displayName = "STR_Item_gold";
        weight = 5;
        buyPrice = -1;
        sellPrice = 5532;
        illegal = false;
        edible = -1;
        icon="icons\ico_cement.paa";
	};

    class kupfer {
		variable = "kupfer";
        displayName = "STR_Item_kupfer";
        weight = 3;
        buyPrice = -1;
        sellPrice = -1;
        illegal = false;
        edible = -1;
        icon="icons\ico_cement.paa";
	};

    class kupferbarren {
		variable = "kupferbarren";
        displayName = "STR_Item_kupferbarren";
        weight = 2;
        buyPrice = -1;
        sellPrice = 1720;
        illegal = false;
        edible = -1;
        icon="icons\ico_cement.paa";
	};

    class eisen {
		variable = "eisen";
        displayName = "STR_Item_eisen";
        weight = 3;
        buyPrice = -1;
        sellPrice = -1;
        illegal = false;
        edible = -1;
        icon="icons\ico_cement.paa";
	};

    class eisenbarren {
		variable = "eisenbarren";
        displayName = "STR_Item_eisenbarren";
        weight = 2;
        buyPrice = -1;
        sellPrice = 2420;
        illegal = false;
        edible = -1;
        icon="icons\ico_cement.paa";
	};

    class turtle {
		variable = "turtle";
        displayName = "STR_Item_turtle";
        weight = 3;
        buyPrice = -1;
        sellPrice = 1825;
        illegal = false;
        edible = -1;
        icon="icons\ico_cement.paa";
	};

    class turtlefleisch {
		variable = "turtlefleisch";
        displayName = "STR_Item_turtlefleisch";
        weight = 3;
        buyPrice = -1;
        sellPrice = 1825;
        illegal = false;
        edible = -1;
        icon="icons\ico_cement.paa";
	};

    class tomatekon {
		variable = "tomatekon";
        displayName = "STR_Item_tomatekon";
        weight = 3;
        buyPrice = -1;
        sellPrice = 1825;
        illegal = false;
        edible = -1;
        icon="icons\ico_cement.paa";
	};

    class fischkon {
		variable = "fischkon";
        displayName = "STR_Item_fischkon";
        weight = 3;
        buyPrice = -1;
        sellPrice = 1825;
        illegal = false;
        edible = -1;
        icon="icons\ico_cement.paa";
	};

    class olivekon {
		variable = "olivekon";
        displayName = "STR_Item_olivekon";
        weight = 2;
        buyPrice = -1;
        sellPrice = 200;
        illegal = false;
        edible = -1;
        icon="icons\ico_cement.paa";
	};

    class getreide {
		variable = "getreide";
        displayName = "STR_Item_getreide";
        weight = 4;
        buyPrice = -1;
        sellPrice = -1;
        illegal = false;
        edible = -1;
        icon="icons\ico_cement.paa";
	};

    class mehl {
		variable = "mehl";
        displayName = "STR_Item_mehl";
        weight = 3;
        buyPrice = -1;
        sellPrice = 2700;
        illegal = false;
        edible = -1;
        icon="icons\ico_cement.paa";
	};

    class holz {
		variable = "holz";
        displayName = "STR_Item_holz";
        weight = 3;
        buyPrice = -1;
        sellPrice = -1;
        illegal = false;
        edible = -1;
        icon="icons\ico_cement.paa";
	};

    class holzplatten {
		variable = "holzplatten";
        displayName = "STR_Item_holzplatten";
        weight = 3;
        buyPrice = -1;
        sellPrice = 1825;
        illegal = false;
        edible = -1;
        icon="icons\ico_cement.paa";
	};

    class kuhkacke {
		variable = "kuhkacke";
        displayName = "STR_Item_kuhkacke";
        weight = 5;
        buyPrice = -1;
        sellPrice = -1;
        illegal = false;
        edible = -1;
        icon="icons\ico_cement.paa";
	};

    class ammoniumnitrat {
		variable = "ammoniumnitrat";
        displayName = "STR_Item_ammoniumnitrat";
        weight = 4;
        buyPrice = -1;
        sellPrice = 5500;
        illegal = true;
        edible = -1;
        icon="icons\ico_cement.paa";
	};

    class diamant {
		variable = "diamant";
        displayName = "STR_Item_diamant";
        weight = 8;
        buyPrice = -1;
        sellPrice = -1;
        illegal = false;
        edible = -1;
        icon="icons\ico_cement.paa";
	};

    class rubin {
		variable = "rubin";
        displayName = "STR_Item_rubin";
        weight = 3;
        buyPrice = -1;
        sellPrice = 1825;
        illegal = false;
        edible = -1;
        icon="icons\ico_cement.paa";
	};

    class sil {
		variable = "sil";
        displayName = "STR_Item_sil";
        weight = 3;
        buyPrice = -1;
        sellPrice = 1825;
        illegal = false;
        edible = -1;
        icon="icons\ico_cement.paa";
	};

    class schmuck {
		variable = "schmuck";
        displayName = "STR_Item_schmuck";
        weight = 3;
        buyPrice = -1;
        sellPrice = 1825;
        illegal = false;
        edible = -1;
        icon="icons\ico_cement.paa";
	};

    class uranang {
		variable = "uranang";
        displayName = "STR_Item_uranang";
        weight = 5;
        buyPrice = -1;
        sellPrice = 20000;
        illegal = false;
        edible = -1;
        icon="icons\ico_cement.paa";
	};

    class uran {
		variable = "uran";
        displayName = "STR_Item_uran";
        weight = 25;
        buyPrice = -1;
        sellPrice = -1;
        illegal = false;
        edible = -1;
        icon="icons\ico_cement.paa";
	};

    class salz {
		variable = "salz";
        displayName = "STR_Item_salz";
        weight = 4;
        buyPrice = -1;
        sellPrice = -1;
        illegal = false;
        edible = -1;
        icon="icons\ico_cement.paa";
	};

    class speisalz {
		variable = "speisalz";
        displayName = "STR_Item_speisalz";
        weight = 3;
        buyPrice = -1;
        sellPrice = 2960;
        illegal = false;
        edible = -1;
        icon="icons\ico_cement.paa";
	};

    class aluerz {
		variable = "aluerz";
        displayName = "STR_Item_aluerz";
        weight =5;
        buyPrice = -1;
        sellPrice = -1;
        illegal = false;
        edible = -1;
        icon="icons\ico_cement.paa";
	};

    class alu {
		variable = "alu";
        displayName = "STR_Item_alu";
        weight = 4;
        buyPrice = -1;
        sellPrice = 3770;
        illegal = false;
        edible = -1;
        icon="icons\ico_cement.paa";
	};

    class silierz {
		variable = "silierz";
        displayName = "STR_Item_silierz";
        weight = 5;
        buyPrice = -1;
        sellPrice = -1;
        illegal = false;
        edible = -1;
        icon="icons\ico_cement.paa";
	};

    class sili {
		variable = "sili";
        displayName = "STR_Item_sili";
        weight = 4;
        buyPrice = -1;
        sellPrice = 3780;
        illegal = false;
        edible = -1;
        icon="icons\ico_cement.paa";
	};

    class cadmierz {
		variable = "cadmierz";
        displayName = "STR_Item_cadmierz";
        weight = 5;
        buyPrice = -1;
        sellPrice = -1;
        illegal = false;
        edible = -1;
        icon="icons\ico_cement.paa";
	};

    class cadmi {
		variable = "cadmi";
        displayName = "STR_Item_cadmi";
        weight = 4;
        buyPrice = -1;
        sellPrice = 3850;
        illegal = false;
        edible = -1;
        icon="icons\ico_cement.paa";
	};
	
	class zuckerrohr {
		variable = "zuckerrohr";
        displayName = "STR_Item_zuckerrohr";
        weight = 4;
        buyPrice = -1;
        sellPrice = -1;
        illegal = false;
        edible = -1;
        icon="icons\ico_cement.paa";
	};
	
	class reis {
		variable = "reis";
        displayName = "STR_Item_Reis";
        weight = 4;
        buyPrice = -1;
        sellPrice = -1;
        illegal = false;
        edible = -1;
        icon="icons\ico_cement.paa";
	};
	
	class trauben {
		variable = "trauben";
        displayName = "STR_Item_trauben";
        weight = 3;
        buyPrice = -1;
        sellPrice = -1;
        illegal = false;
        edible = -1;
        icon="icons\ico_cement.paa";
	};
	
	class marihuana {
		variable = "marihuana";
        displayName = "STR_Item_marihuana";
        weight = 4;
        buyPrice = -1;
        sellPrice = 3025;
        illegal = true;
        edible = -1;
        icon="icons\ico_cement.paa";
	};
	
	class rum {
		variable = "rum";
        displayName = "STR_Item_rum";
        weight = 3;
        buyPrice = -1;
        sellPrice = 4000;
        illegal = true;
        edible = -1;
        icon="icons\ico_cement.paa";
	};
	
	class zucker {
		variable = "zucker";
        displayName = "STR_Item_zucker";
        weight = 3;
        buyPrice = -1;
        sellPrice = 2800;
        illegal = false;
        edible = -1;
        icon="icons\ico_cement.paa";
	};
	
	class whiskey {
		variable = "whiskey";
        displayName = "STR_Item_whiskey";
        weight = 3;
        buyPrice = -1;
        sellPrice = 3600;
        illegal = true;
        edible = -1;
        icon="icons\ico_cement.paa";
	};
	
	class sake {
		variable = "sake";
        displayName = "STR_Item_sake";
        weight = 3;
        buyPrice = -1;
        sellPrice = 3605;
        illegal = true;
        edible = -1;
        icon="icons\ico_cement.paa";
	};
	
	class wein {
		variable = "wein";
        displayName = "STR_Item_wein";
        weight = 2;
        buyPrice = -1;
        sellPrice = 2000;
        illegal = false;
        edible = -1;
        icon="icons\ico_cement.paa";
	};
	
	class gussform {
		variable = "gussform";
        displayName = "STR_Item_gussform";
        weight = 2;
        buyPrice = -1;
        sellPrice = 2460;
        illegal = false;
        edible = -1;
        icon="icons\ico_cement.paa";
	};
	
	class geschliffenediamanten {
		variable = "geschliffenediamanten";
        displayName = "STR_Item_geschliffenediamanten";
        weight = 4;
        buyPrice = -1;
        sellPrice = 6900;
        illegal = false;
        edible = -1;
        icon="icons\ico_cement.paa";
	};
};
