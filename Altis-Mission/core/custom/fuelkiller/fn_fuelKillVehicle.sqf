_vehicle =  [_this,0,Objnull,[Objnull]] call BIS_fnc_param;
if(isNull _vehicle) exitWith {};
if((_vehicle getVariable ["esg_fuelKilled", false])) exitWith {};
_vehicle setVariable ["esg_fuelKilled",true,true];
["<t font='PuristaBold' size = '.8'>Du wirst von einem EMP-System außer Gefecht gesetzt!</t>",-1,-1,4,1,0,789] spawn BIS_fnc_dynamicText;

["EMP-System", "Du wirst von einem EMP-System außer Gefecht gesetzt!", false] spawn ESG_fnc_notify;
while{fuel _vehicle > 0}do {
	if(isNull _vehicle) exitWith {};
	_vehicle setFuel (fuel _vehicle - 0.2);
	sleep 10;
};
_vehicle setVariable ["esg_fuelKilled",false,true];