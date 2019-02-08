/*
*   class:
*       MaterialsReq (Needed to process) = Array - Format -> {{"ITEM CLASS",HOWMANY}}
*       MaterialsGive (Returned items) = Array - Format -> {{"ITEM CLASS",HOWMANY}}
*       Text (Progess Bar Text) = Localised String
*       NoLicenseCost (Cost to process w/o license) = Scalar
*
*   Example for multiprocess:
*
*   class Example {
*       MaterialsReq[] = {{"cocaine_processed",1},{"heroin_processed",1}};
*       MaterialsGive[] = {{"diamond_cut",1}};
*       Text = "STR_Process_Example";
*       //ScrollText = "Process Example";
*       NoLicenseCost = 4000;
*   };
*/

class ProcessAction {
    class zement {
        MaterialsReq[] = {{"stein",1}};
        MaterialsGive[] = {{"zementsack",1}};
        Text = "STR_Process_zement";
        license = "Baustoffe";
        NoLicenseCost = 5000;
    };

    class bier {
        MaterialsReq[] = {{"hopfen",1}};
        MaterialsGive[] = {{"bier",1}};
        Text = "STR_Process_bier";
        license = "genussmittel";
        NoLicenseCost = 5000;
    };

    class heroin {
        MaterialsReq[] = {{"mohn",1}};
        MaterialsGive[] = {{"heroin",1}};
        Text = "STR_Process_heroin";
        license = "drogenherstellung";
        NoLicenseCost = 10000;
    };

    class kokain {
        MaterialsReq[] = {{"kokainpflanze",1}};
        MaterialsGive[] = {{"kokain",1}};
        Text = "STR_Process_kokain";
        license = "drogenherstellung";
        NoLicenseCost = 10000;
    };
	
	class cannabis {
        MaterialsReq[] = {{"cannabispflanze",1}};
        MaterialsGive[] = {{"marihuana",1}};
        Text = "STR_Process_cannabis";
        license = "drogenherstellung";
        NoLicenseCost = 10000;
    };
	
	class apfelsaft {
        MaterialsReq[] = {{"apfel",1}};
        MaterialsGive[] = {{"apfelsaft",1}};
        Text = "STR_Process_apfelsaft";
        license = "entsafter";
        NoLicenseCost = 5000;
    };
	
	class pfisichsaft {
        MaterialsReq[] = {{"pfirsich",1}};
        MaterialsGive[] = {{"pfisichsaft",1}};
        Text = "STR_Process_pfirsichsaft";
        license = "entsafter";
        NoLicenseCost = 5000;
    };
	
	class raffbenzin {
        MaterialsReq[] = {{"oel",1}};
        MaterialsGive[] = {{"benzin",1}};
        Text = "STR_Process_benzin";
        license = "gefahrenstoff";
        NoLicenseCost = 5000;
    };
	
	class raff {
        MaterialsReq[] = {{"oel",1}};
        MaterialsGive[] = {{"motoroil",1}};
        Text = "STR_Process_raff";
        license = "gefahrenstoff";
        NoLicenseCost = 5000;
    };
	
	class glas {
        MaterialsReq[] = {{"sand",1}};
        MaterialsGive[] = {{"glas",1}};
        Text = "STR_Process_glas";
        license = "baustoffe";
        NoLicenseCost = 5000;
    };
	
	class lsd {
        MaterialsReq[] = {{"frosch",1}};
        MaterialsGive[] = {{"lsd",1}};
        Text = "STR_Process_lsd";
        license = "drogenherstellung";
        NoLicenseCost = 10000;
    };

    class hauer {
        MaterialsReq[] = {{"stein",1}};
        MaterialsGive[]= {{"kunstwerk",1}};
        Text = "STR_Process_hauer";
        license = "hauer";
        NoLicenseCost = 5000;
    };
	
	class schnaps {
        MaterialsReq[] = {{"anis",1}};
        MaterialsGive[] = {{"ouzo",1}};
        Text = "STR_Process_schnapps";
        license = "schnapsherstellung";
        NoLicenseCost = 10000;
    };
	
	class spargel {
        MaterialsReq[] = {{"spargel",1}};
        MaterialsGive[] = {{"spargelglas",1}};
        Text = "STR_Process_spargel";
        license = "foodclub";
        NoLicenseCost = 5000;
    };
	
	class olive {
        MaterialsReq[] = {{"olive",1}};
        MaterialsGive[] = {{"olivekon",1}};
        Text = "STR_Process_olivekon";
        license = "foodclub";
        NoLicenseCost = 5000;
    };
	
	class goldclean {
        MaterialsReq[] = {{"goldnugget",1}};
        MaterialsGive[] = {{"gold",1}};
        Text = "STR_Process_gold";
        license = "weiterfuehrende_metallurgie";
        NoLicenseCost = 5000;
    };
	
	class kupfer {
        MaterialsReq[] = {{"kupfer",1}};
        MaterialsGive[] = {{"kupferbarren",1}};
        Text = "STR_Process_kupfer";
        license = "metallurgie";
        NoLicenseCost = 5000;
    };
	
	class eisen {
        MaterialsReq[] = {{"eisen",1}};
        MaterialsGive[] = {{"eisenbarren",1}};
        Text = "STR_Process_eisen";
        license = "metallurgie";
        NoLicenseCost = 5000;
    };
	
	class gussform {
        MaterialsReq[] = {{"eisen",1}};
        MaterialsGive[] = {{"gussform",1}};
        Text = "STR_Process_gussform";
        license = "metallurgie";
        NoLicenseCost = 5000;
    };
	
	class getreide {
        MaterialsReq[] = {{"getreide",1}};
        MaterialsGive[] = {{"mehl",1}};
        Text = "STR_Process_mehl";
        license = "foodclub";
        NoLicenseCost = 5000;
    };
	
	class holz {
        MaterialsReq[] = {{"holz",1}};
        MaterialsGive[] = {{"holzplatten",1}};
        Text = "STR_Process_holzplatten";
        license = "ausstatter";
        NoLicenseCost = 5000;
    };
	
	class kuhkacke {
        MaterialsReq[] = {{"kuhkacke",1}};
        MaterialsGive[] = {{"ammoniumnitrat",1}};
        Text = "STR_Process_ammoniumnitrat";
        license = "sonderprodukte";
        NoLicenseCost = 5000;
    };
	
	class schmuck_dia {
        MaterialsReq[] = {{"diamant",1}};
        MaterialsGive[] = {{"geschliffenediamanten",1}};
        Text = "STR_Process_schmuck";
        license = "weiterfuehrende_metallurgie";
        NoLicenseCost = 5000;
    };
	
	class uran {
        MaterialsReq[] = {{"uran",1}};
        MaterialsGive[] = {{"uranang",1}};
        Text = "STR_Process_uran";
        license = "strahlenforscher";
        NoLicenseCost = 50000;
    };
	
	class salz {
        MaterialsReq[] = {{"salz",1}};
        MaterialsGive[] = {{"speisalz",1}};
        Text = "STR_Process_speisalz";
        license = "foodclub";
        NoLicenseCost = 5000;
    };
	
	class alu {
        MaterialsReq[] = {{"aluerz",1}};
        MaterialsGive[] = {{"alu",1}};
        Text = "STR_Process_alu";
        license = "weiterfuehrende_metallurgie";
        NoLicenseCost = 5000;
    };
	
	class sili {
        MaterialsReq[] = {{"silierz",1}};
        MaterialsGive[] = {{"sili",1}};
        Text = "STR_Process_sili";
        license = "weiterfuehrende_metallurgie";
        NoLicenseCost = 5000;
    };
	
	class cadmi {
        MaterialsReq[] = {{"cadmierz",1}};
        MaterialsGive[] = {{"cadmi",1}};
        Text = "STR_Process_cadmi";
        license = "weiterfuehrende_metallurgie";
        NoLicenseCost = 5000;
    };
	
	class rum {
        MaterialsReq[] = {{"zuckerrohr",1}};
        MaterialsGive[] = {{"rum",1}};
        Text = "STR_Process_rum";
        license = "schnapsherstellung";
        NoLicenseCost = 5000;
    };
	
	class zucker {
        MaterialsReq[] = {{"zuckerrohr",1}};
        MaterialsGive[] = {{"zucker",1}};
        Text = "STR_Process_zucker";
        license = "foodclub";
        NoLicenseCost = 5000;
    };
	
	class mehl {
        MaterialsReq[] = {{"getreide",1}};
        MaterialsGive[] = {{"mehl",1}};
        Text = "STR_Process_mehl";
        license = "foodclub";
        NoLicenseCost = 5000;
    };
	
	class ouzo {
        MaterialsReq[] = {{"anis",1}};
        MaterialsGive[] = {{"ouzo",1}};
        Text = "STR_Process_ouzo";
        license = "schnapsherstellung";
        NoLicenseCost = 5000;
    };
	
	class sake {
        MaterialsReq[] = {{"reis",1}};
        MaterialsGive[] = {{"sake",1}};
        Text = "STR_Process_sake";
        license = "schnapsherstellung";
        NoLicenseCost = 5000;
    };
	
	class whiskey {
        MaterialsReq[] = {{"getreide",1}};
        MaterialsGive[] = {{"whiskey",1}};
        Text = "STR_Process_whiskey";
        license = "schnapsherstellung";
        NoLicenseCost = 5000;
    };
	
	class wein {
        MaterialsReq[] = {{"trauben",1}};
        MaterialsGive[] = {{"wein",1}};
        Text = "STR_Process_wein";
        license = "genussmittel";
        NoLicenseCost = 5000;
    };
};
