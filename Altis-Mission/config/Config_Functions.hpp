class CfgFunctions {
	class Socket_Reciever {
		tag = "SOCK";
		class SQL_Socket {
			file = "core\session";
			class dataQuery {};
			class insertPlayerInfo {};
			class requestReceived {};
			class syncData {};
			class updatePartial {};
			class updateRequest {};
		};
	};

	class SpyGlass {
	    tag = "SPY";
	    class Functions {
	        file = "SpyGlass";
	        class cookieJar{};
	        class notifyAdmins{};
	        class observe{};
	    };
	};

	class ESG_Custom {
		tag = "ESG";

		class Skripte {
			file="core\custom";
			class oldmsg {};
			class suchetelefon {};
			class telefonswitch {};
			class patdown {};
			class bandage {};
			class infoMenu {};
			class hinsetzen {};
			class aufstehen {};
			class spawnIntro {};
			class augenbinde {};
			class drogeneffekte {};
			class setGangRank {};
			class hitter {};
			class handleAutoSteig {};
			class changePlate {};
			class setPlate {};
			class insuranceBuy {};
			class restrainAnimSelect {};
			class searchPlayers {};
			class getLicenses {};
			class notify {};
		};

		class loadout {
			file="core\custom\loadout";
			class getLoadout {};
			class loadoutLaden {};
			class loadoutReceived {};
			class loadoutUpdateRequest {};
			class insertLoadout {};
			class dataLoadout {};
			class getLoadoutPrice {};
			class loadout_lbchange {};
		};

		class ausweis {
			file="core\custom\ausweis";
			class ausweis_creation {};
			class ausweisrecall {};
			class ausweis_get {};
			class ausweis_zeigen {};
		};

		class medicsystem {
			file="core\custom\medicsystem";
			class getback {};
			class clientgetback {};
			class stabilise {};
			class respawnhim {};
			class medicLoadMenu {};
			class medicChangeTeil {};
			class medicSchmerz {};
			class medicCallMedic {};
		};

		class fuelkiller {
			file = "core\custom\fuelkiller";
			class fuelKillVehicle {};
			class openFuelKiller {};
			class sendFuelKiller {};
			class warnVehicle {};
		};
		
		class fms {
			file="core\custom\fms";
			class fmsLogin {};
			class fmsData {};
			class fmsMain {};
		};
		
		class skillsystem {
			file="core\custom\skillsystem";
			class skilladd {};
			class skilltime {};
			class loadSkillMenu {};
			class updateSkillMenu {};
		};
		
		class sos {
			file = "core\custom\SOS";
			class sosbutton {};
			class sosMarker {};
		};
		
		class zmenu {
			file = "core\custom\ZMenu";
			class updateZMenu {};
		};
	};

	class Life_Client_Core {
		tag = "life";

		class Master_Directory {
			file = "core";
			class initCiv {};
			class initCop {};
			class initMedic {};
			class initArc {};
			class setupActions {};
			class setupEVH {};
			class survival {};
			class welcomeNotification {};
			class initmapfilter {};
		};

		class Actions {
			file = "core\actions";
			class arrestAction {};
			class buyLicense {};
			class captureHideout {};
			class catchFish {};
			class dpFinish {};
			class dropFishingNet {};
			class escortAction {};
			class gather {};
			class getDPMission {};
			class gutAnimal {};
			class healHospital {};
			class impoundAction {};
			class mine {};
			class newsBroadcast {};
			class packupSpikes {};
			class pickupItem {};
			class pickupMoney {};
			class postBail {};
			class processAction {};
			class pulloutAction {};
			class putInCar {};
			class removeContainer {};
			class repairTruck {};
			class restrainAction {};
			class robAction {};
			class searchAction {};
			class searchVehAction {};
			class seizePlayerAction {};
			class serviceChopper {};
			class stopEscorting {};
			class storeVehicle {};
			class surrender {};
			class ticketAction {};
			class unrestrain {};
			class robShops {};
			class istBaum {};
			class robKleinBank {};
		};

		class Admin {
			file = "core\admin";
			class adminCompensate {};
			class adminDebugCon {};
			class adminFreeze {};
			class admingetID {};
			class adminGodMode {};
			class adminid {};
			class admininfo {};
			class adminMarkers {};
			class adminMenu {};
			class adminQuery {};
			class adminSpectate {};
			class adminTeleport {};
			class adminTpHere {};
		};

		class Civilian {
			file = "core\civilian";
			class civLoadout {};
			class civMarkers {};
			class demoChargeTimer {};
			class freezePlayer {};
			class jail {};
			class jailMe {};
			class knockedOut {};
			class knockoutAction {};
			class removeLicenses {};
			class robPerson {};
			class robReceive {};
			class tazed {};
			class civInteractionMenu {};
		};

		class Config {
			file = "core\config";
			class houseConfig {};
			class itemWeight {};
			class vehicleAnimate {};
			class vehicleWeightCfg {};
		};

		class Cop {
			file = "core\cop";
			class bountyReceive {};
			class containerInvSearch {};
			class copInteractionMenu {};
			class copInteractionMenu2 {};
			class copLights {};
			class copLoadout {};
			class copMarkers {};
			class copSearch {};
			class copSiren {};
			class copSiren2 {};
			class doorAnimate {};
			class fedCamDisplay {};
			class licenseCheck {};
			class licensesRead {};
			class questionDealer {};
			class radar {};
			class repairDoor {};
			class restrain {};
			class searchClient {};
			class seizeClient {};
			class sirenLights {};
			class spikeStripEffect {};
			class ticketGive {};
			class ticketPaid {};
			class ticketPay {};
			class ticketPrompt {};
			class vehInvSearch {};
			class wantedGrab {};
			class jailtime_cop {};
			class copInteractionMenuFlex {};
		};

		class Dialog_Controls {
			file = "dialog\function";
			class bankDeposit {};
			class bankTransfer {};
			class bankWithdraw {};
			class displayHandler {};
			class gangDeposit {};
			class gangWithdraw {};
			class garageLBChange {};
			class impoundMenu {};
			class progressBar {};
			class safeFix {};
			class safeInventory {};
			class safeOpen {};
			class safeTake {};
			class sellGarage {};
			class setMapPosition {};
			class spawnConfirm {};
			class spawnMenu {};
			class spawnPointCfg {};
			class spawnPointSelected {};
			class unimpound {};
			class vehicleGarage {};
			class wireTransfer {};
		};
		
		class ARC {
			file = "core\arc";
			class arcMarkers {};
			class arcLoadout {};
		};

		class Functions {
			file = "core\functions";
			class AAN {};
			class accType {};
			class actionKeyHandler {};
			class animSync {};
			class calWeightDiff {};
			class clearVehicleAmmo {};
			class dropItems {};
			class escInterupt {};
			class fetchCfgDetails {};
			class fetchDeadGear {};
			class fetchVehInfo {};
			class isDamaged {};
			class giveDiff {};
			class handleDamage {};
			class handleInv {};
			class handleItem {};
			class hideObj {};
			class hudSetup {};
			class hudUpdate {};
			class inventoryClosed {};
			class inventoryOpened {};
			class isUIDActive {};
			class UIDToObj {};
			class keyHandler {};
			class loadDeadGear {};
			class loadGear {};
			class nearATM {};
			class nearestDoor {};
			class nearUnits {};
			class numberText {};
			class onFired {};
			class onTakeItem {};
			class playerSkins {};
			class playerTags {};
			class postNewsBroadcast {};
			class pullOutVeh {};
			class pushObject {};
			class receiveItem {};
			class receiveMoney {};
			class revealObjects {};
			class saveGear {};
			class searchPosEmpty {};
			class simDisable {};
			class stripDownPlayer {};
			class tazeSound {};
			class teleport {};
			class whereAmI {};
			class globalSound {};
			class halojump {};
			class ladeSpieler {};
			class mapfilter {};
			class injuredmenu {};
			class seatBelt {};
		};

		class Gangs {
			file = "core\gangs";
			class createGang {};
			class gangCreated {};
			class gangDisband {};
			class gangDisbanded {};
			class gangInvite {};
			class gangInvitePlayer {};
			class gangKick {};
			class gangLeave {};
			class gangMenu {};
			class gangNewLeader {};
			class gangUpgrade {};
			class initGang {};
			class handleDBGang {};
			class gangHouseMenu {};
			class gangKontoMenu {};
			class gangTransferMoney {};
			class gangRanksMenu {};
			class updateGangRanks {};
		};

		class Housing {
			file = "core\housing";
			class buyHouse {};
			class buyHouseGarage {};
			class containerMenu {};
			class copBreakDoor {};
			class copHouseOwner {};
			class garageRefund {};
			class getBuildingPositions {};
			class houseMenu {};
			class initHouses {};
			class lightHouse {};
			class lightHouseAction {};
			class lockHouse {};
			class lockupHouse {};
			class placeContainer {};
			class PlayerInBuilding {};
			class raidHouse {};
			class sellHouse {};
			class sellHouseGarage {};
		};

		class Items {
			file = "core\items";
			class blastingCharge {};
			class boltcutter {};
			class defuseKit {};
			class flashbang {};
			class jerrycanRefuel {};
			class jerryRefuel {};
			class lockpick {};
			class placestorage {};
			class spikeStrip {};
			class storageBox {};
		};

		class Medical_System {
			file = "core\medical";
			class deathScreen {};
			class medicLights {};
			class medicLoadout {};
			class medicMarkers {};
			class medMarkers {};
			class medicRequest {};
			class medicSiren {};
			class medicSiren2 {};
			class medicSirenLights {};
			class onPlayerKilled {};
			class onPlayerRespawn {};
			class requestMedic {};
			class respawned {};
			class revived {};
			class revivePlayer {};
			class medInteractionMenu {};
			class akku {};
			class icons {};
			class injured {};
		};

		class Network {
			file = "core\functions\network";
			class broadcast {};
			class corpse {};
			class jumpFnc {};
			class say3D {};
			class setFuel {};
			class soundDevice {};
		};

		class Player_Menu {
			file = "core\pmenu";
			class cellphone {};
			class giveItem {};
			class giveMoney {};
			class keyDrop {};
			class keyGive {};
			class keyMenu {};
			class p_openMenu {};
			class p_updateMenu {};
			class pardon {};
			class removeItem {};
			class s_onChar {};
			class s_onCheckedChange {};
			class s_onSliderChange {};
			class settingsMenu {};
			class updateViewDistance {};
			class useItem {};
			class wantedAddP {};
			class wantedInfo {};
			class wantedList {};
			class wantedMenu {};
		};

		class Shops {
			file = "core\shops";
			class atmMenu {};
			class buyClothes {};
			class changeClothes {};
			class chopShopMenu {};
			class chopShopSelection {};
			class chopShopSell {};
			class clothingFilter {};
			class clothingFix {};
			class clothingMenu {};
			class fuelLBchange {};
			class fuelStatOpen {};
			class levelCheck {};
			class vehicleShop3DPreview {};
			class vehicleShopBuy {};
			class vehicleShopEnd3DPreview {};
			class vehicleShopInit3DPreview {};
			class vehicleShopLBChange {};
			class vehicleShopMenu {};
			class virt_buy {};
			class virt_menu {};
			class virt_sell {};
			class virt_sellAll {};
			class virt_update {};
			class weaponShopAccs {};
			class weaponShopBuySell {};
			class weaponShopFilter {};
			class weaponShopMags {};
			class weaponShopMenu {};
			class weaponShopSelection {};
		};
		
		class allianceapps_locker {
			file = "core\locker";
			class locker_db_sync {};
			class locker_initlocker {};
			class locker_changedialog {};
			class locker_terminate {};
			class locker_putinout {};
			class locker_buylocker {};
			class locker_inoutfunctions {};
			class locker_weightfetcher {};
			class locker_updateLevel {};
			class locker_converter {};
		}; 
		
		class allianceapps_locker_pages {
			file = "core\locker\changedialog";
			class locker_gear {};
			class locker_items {};
			class locker_virt {};
			class locker_weapons {};
		};

		class Vehicle {
			file = "core\vehicle";
			class addVehicle2Chain {};
			class colorVehicle {};
			class deviceMine {};
			class FuelRefuelcar {};
			class fuelStore {};
			class fuelSupply {};
			class lockVehicle {};
			class openInventory {};
			class vehiclecolor3DRefresh {};
			class vehicleOwners {};
			class vehicleWeight {};
			class vehInventory {};
			class vehStoreItem {};
			class vehTakeItem {};
			class vehStoreItemAll {};
			class vehTakeItemAll {};
			class vInteractionMenu {};
		};
	};
};
