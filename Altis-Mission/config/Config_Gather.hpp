class CfgGather {
    class Resources {
		class mohn {
            amount = 2;
            zones[] = { "Mohnfeld" };
            item = "";
            zoneSize = 20;
        };
		class pfirsich {
            amount = 2;
            zones[] = { "Pfirsichbaeume_1","Pfirsichbaeume_2","Pfirsichbaeume" };
            item = "";
            zoneSize = 20;
        };
		class apfel {
            amount = 2;
            zones[] = { "Apfelbaeume_1","Apfelbaeume_2","Apfelbaeume" };
            item = "";
            zoneSize = 20;
        };
		class olive {
            amount = 2;
            zones[] = { "Olivenbaeume","Olivenbaeume_1","Olivenbaeume_2" };
            item = "";
            zoneSize = 20;
        };
		class cannabispflanze {
            amount = 2;
            zones[] = { "Cannabisplantage" };
            item = "";
            zoneSize = 20;
        };
		class frosch {
            amount = 2;
            zones[] = { "Froschsumpf" };
            item = "";
            zoneSize = 20;
        };
		class zuckerrohr {
            amount = 2;
            zones[] = { "Zuckerrohrplantage" };
            item = "";
            zoneSize = 20;
        };
		class getreide {
            amount = 2;
            zones[] = { "Getreidefeld" };
            item = "";
            zoneSize = 20;
        };
		class anis {
            amount = 2;
            zones[] = { "Anispflanzen" };
            item = "";
            zoneSize = 20;
        };
		class reis {
            amount = 2;
            zones[] = { "Reisaehren" };
            item = "";
            zoneSize = 20;
        };
		class hopfen {
            amount = 2;
            zones[] = { "Hopfenfeld" };
            item = "";
            zoneSize = 20;
        };
		class kokainpflanze {
            amount = 2;
            zones[] = { "Kokainfeld" };
            item = "";
            zoneSize = 20;
        };
       class spargel {
            amount = 2;
            zones[] = { "Spargelfeld" };
            item = "";
            zoneSize = 20;
        };
		class trauben {
            amount = 2;
            zones[] = { "Weinreben" };
            item = "";
            zoneSize = 20;
        };
    };

/*
This block can be set using percent,if you want players to mine only one resource ,just leave it as it is.
Example:
        class copper_unrefined
    {
            amount = 2;
        zones[] = { "copper_mine" };
        item = "pickaxe";
        mined[] = { "copper_unrefined" };
This will make players mine only copper_unrefined
Now let's go deeper
Example 2:
        class copper_unrefined
    {
            amount = 2;
        zones[] = { "copper_mine" };
        item = "pickaxe";
        mined[] = { {"copper_unrefined",0,25},{"iron_unrefined",25,95},{"diamond_uncut",95,100} };
    };
    This will give :
    25(±1)% to copper_unrefined;
    70(±1)% to iron_unrefined;
    5%(±1)% to diamond_uncut;

                                                         ! Watch Out !
 If percents are used,you MUST put more than 1 resource in the mined parameter
 mined[] = { {"copper_unrefined",0,25} }; NOT OK (But the script will work)
 mined[] = { {"copper_unrefined",0,45 },{"iron_unrefined",45} };  NOT OK (The script won't work )
 mined[] = { {"copper_unrefined",0,45},{"copper_unrefined",80,100} }; NOT OK
 mined[] = { "copper_unrefined" }; OK
 mined[] = { {"copper_unrefined",0,35} , { "iron_unrefined" ,35,100 } }; OK
*/

    class Minerals {
        class kupfer {
            amount = 2;
            zones[] = { "Kupfervorkommen" };
            item = "pickaxe";
            mined[] = {"kupfer"};
            zoneSize = 20;
        };
		class sand {
            amount = 2;
            zones[] = { "Sandmine" };
            item = "shovel";
            zoneSize = 20;
            mined[] = {"sand"};
        };
		class kuhkacke {
            amount = 2;
            zones[] = { "Kuhscheisse" };
            item = "shovel";
            zoneSize = 20;
            mined[] = {"kuhkacke"};
        };
		class holz {
            amount = 2;
            zones[] = { "Wald" };
            item = "axt";
            zoneSize = 20;
            mined[] = {"holz"};
        };
		class oel {
            amount = 2;
            zones[] = { "Erdoelvorkommen" };
            item = "oelpumpe";
            zoneSize = 20;
            mined[] = {"oel"};
        };
		class eisen {
            amount = 2;
            zones[] = { "Eisenfloetz" };
            item = "pickaxe";
            zoneSize = 20;
            mined[] = {"eisen"};
        };
		class diamant {
            amount = 2;
            zones[] = { "Edelmetallmine" };
            item = "pickaxe";
            zoneSize = 20;
            mined[] = {"diamant"};
        };
		class salz {
            amount = 2;
            zones[] = { "Salzmine" };
            item = "pickaxe";
            zoneSize = 20;
            mined[] = {"salz"};
        };
		class goldnugget {
            amount = 2;
            zones[] = { "Goldmine" };
            item = "pickaxe";
            zoneSize = 20;
            mined[] = {"goldnugget"};
        };
		class stein {
            amount = 2;
            zones[] = { "Steinbruch" };
            item = "pickaxe";
            zoneSize = 20;
            mined[] = {"stein"};
        };
		class cadmierz {
            amount = 2;
            zones[] = { "Cadmiumablagerung" };
            item = "pickaxe";
            zoneSize = 20;
            mined[] = {"cadmierz"};
        };
		class aluerz {
            amount = 2;
            zones[] = { "Aluminiumvorkommen" };
            item = "pickaxe";
            zoneSize = 20;
            mined[] = {"aluerz"};
        };
		class silierz {
            amount = 2;
            zones[] = { "Siliciumablagerung" };
            item = "pickaxe";
            zoneSize = 20;
            mined[] = {"silierz"};
        };
		class uran {
            amount = 2;
            zones[] = { "Uranablagerung" };
            item = "pickaxe";
            zoneSize = 20;
            mined[] = {"uran"};
        };
    };
};
