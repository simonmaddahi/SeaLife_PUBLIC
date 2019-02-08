/* 
	Author: Natic [naticclips@gmail.com]
	Date: 04.01.2019
	Reclaimer: Nobody is allowed to use/edit this Script without my Permissions
	
	Description: Take care and look!
*/
private ["_veh","_skin","_markerList];

_markerList = ["comp_car_spawn"];
{

profileNamespace getVariabel ["natic_company_security",true];

if (!natic_company_security) then {	
		
		_veh = "C_Offroad_01_F" createVehicle getMarkerPos _x; 
		[_veh, true, true, true] call bis_fnc_initVehicle;
		[getPlayerUID player,playerSide,_veh,1] remoteExecCall ["TON_fnc_keyManagement",RSERV];
		["Dir wurde ein Taxi Fahrzeug zuverfügung gestellt!",[0, 0, 0, 1], [108,100,64,1], "Info"] spawn life_fnc_createNotification;
	};
		
} forEach _markerList	

//Das Fahrzeug muss noch einen Skin bekommen
//Der Spieler muss als owner gesetzt werden!
