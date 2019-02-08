/*
    By Basti | John Collins
*/
private _vehicle = (_this select 0);
if (isNil "_vehicle" || isNull _vehicle || !(_vehicle getVariable "lights")) exitWith {};
private _time = [dayTime, "HH"] call BIS_fnc_timeToString;
private _sun = _time in ["18","19","20","21","22","23","00","01","02","03","04","05"];
private _intensity = 0.5;
private _attenuation = [0,0,0,0,0,0];
private _bright = 0.8;
if(_sun)then {
  _intensity = 0.15;
  _attenuation = [2,3,3,0,2,8];
  _bright = 0.4;
} else {
  _intensity = 50;
  _attenuation = [2,3,3,0,2,10];
  _bright = 5;
};

_lightleft = "#lightpoint" createVehicleLocal getPos _vehicle;
sleep 0.2;
_lightleft setLightColor [0.1, 0.1, 20];
_lightleft setLightBrightness 1;
_lightleft setLightAmbient [0.1,0.1,1];

switch (typeOf _vehicle) do
{
    case "C_Offroad_01_F":
    {
        _lightleft attachTo [_vehicle, [-0.37, 0.0, 0.56]];
    };

    case "B_MRAP_01_F":
    {
        _lightleft attachTo [_vehicle, [-0.8,-0.95,0.6]];
    };

    case "I_MRAP_03_F":
    {
        _lightleft attachTo [_vehicle, [-0.8,2.25,-0.3]];
    };

    case "B_MRAP_01_hmg_F":
    {
        _lightleft attachTo [_vehicle, [-0.8,-0.95,0.05]];
    };

    case "I_Truck_02_covered_F":
    {
        _lightleft attachTo [_vehicle, [-0.8,3.65,-0.9]];
    };

    case "C_SUV_01_F":
    {
        _lightleft attachTo [_vehicle, [-0.7,1.85,-0.5]];
    };

    case "C_Hatchback_01_sport_F":
    {
        _lightleft attachTo [_vehicle, [-0.8,1.6,-0.5]];
    };

    case "C_Hatchback_01_F":
    {
        _lightleft attachTo [_vehicle, [-0.8,1.6,-0.5]];
    };

    case "B_Heli_Light_01_F":
    {
        _lightleft attachTo [_vehicle,[-0.4,-0.15,0.5]];
    };

    case "B_Heli_Transport_01_F":
    {
        _lightleft attachTo [_vehicle, [-0.5, 0.0, 0.81]];
    };

     case "B_Heli_Transport_03_unarmed_F":
     {
       _lightleft attachTo [_vehicle, [-1.8,3.65,-1.6]];
     };

     case "O_Heli_Light_02_unarmed_F":
     {
       _lightleft attachTo [_vehicle, [0,-7.85,-0.1]];
     };
     case "B_Heli_Transport_01_camo_F":
     {
       _lightleft attachTo [_vehicle, [-0.8,-0.35,0.5]];
     };
     case "O_Heli_Transport_04_ammo_black_F":
     {
       _lightleft attachTo [_vehicle,[-3.5,0.25,-0.9]];
     };
     case "O_Heli_Transport_04_black_F":
     {
       _lightleft attachTo [_vehicle,[-3.5,0.25,-0.9]];
     };
     case "I_Heli_light_03_unarmed_F":
     {
       _lightleft attachTo [_vehicle,[-0.6,-0.25,0.8]];
     };
     case "O_Truck_03_repair_F":
     {
       _lightleft attachTo [_vehicle,[-0.7,3.05,1.05]];
     };
     case "O_Truck_03_covered_F":
     {
       _lightleft attachTo [_vehicle,[-0.7,3.25,0.75]];
     };
     case "B_Quadbike_01_F":
     {
       _lightleft attachTo [_vehicle,[-0.07, 1, -0.7]];
     };
	 case "C_Offroad_02_unarmed_F":
     {
       _lightleft attachTo [_vehicle,[-0.5,1.8,-0.4]];
     };
	 case "B_G_Van_02_transport_F":
     {
       _lightleft attachTo [_vehicle,[-0.8,3.8,-0.5]];
     };
	 case "B_T_LSV_01_unarmed_F":
     {
       _lightleft attachTo [_vehicle,[-0.5,2,-0.9]];
     };
	 case "O_MRAP_02_F":
     {
       _lightleft attachTo [_vehicle,[-1.15,-1.6,0.35]];
     };
	 case "C_Plane_Civil_01_racing_F":
     {
       _lightleft attachTo [_vehicle,[-1.85,1.2,-0.75]];
     };
	 case "B_Heli_Attack_01_F":
     {
       _lightleft attachTo [_vehicle,[-0.75,-0.6,0.25]];
     };
	 case "B_T_VTOL_01_infantry_F":
     {
       _lightleft attachTo [_vehicle,[-12.65,5.1,-1.35]];
     };
	 case "B_T_VTOL_01_vehicle_F":
     {
       _lightleft attachTo [_vehicle,[-12.65,5.1,-1.35]];
     };
	 case "B_APC_Wheeled_01_cannon_F":
     {
       _lightleft attachTo [_vehicle,[-1.15, 0.0, 0.0]];
     };
     case "B_GEN_Van_02_transport_F":
     {
       _lightleft attachTo [_vehicle,[-0.4,1.6,-1.522]];
     };
     case "B_GEN_Van_02_vehicle_F":
     {
       _lightleft attachTo [_vehicle,[-0.4,1.6,-1.522]];
     };
     default {_lightleft attachTo [_vehicle, [0, 0.0, 0]];};
};

_lightleft setLightAttenuation _attenuation;
_lightleft setLightIntensity _intensity;
_lightleft setLightFlareSize 0.38;
_lightleft setLightFlareMaxDistance 150;
_lightleft setLightUseFlare true;

_lightright = "#lightpoint" createVehicleLocal getPos _vehicle;
sleep 0.2;
_lightright setLightColor [0.1, 0.1, 20];
_lightright setLightBrightness 1;
_lightright setLightAmbient [0.1,0.1,1];

switch (typeOf _vehicle) do
{
    case "C_Offroad_01_F":
    {
        _lightright attachTo [_vehicle, [0.37, 0.0, 0.56]];
    };

    case "B_MRAP_01_F":
    {
        _lightright attachTo [_vehicle, [0.85,-0.95,0.6]];
    };

    case "B_MRAP_01_hmg_F":
    {
        _lightright attachTo [_vehicle, [0.8,-0.95,0.05]];
    };

    case "I_MRAP_03_F":
    {
        _lightright attachTo [_vehicle, [0.8,2.25,-0.3]];
    };

    case "I_Truck_02_covered_F":
    {
        _lightright attachTo [_vehicle, [0.8,3.65,-0.9]];
    };

    case "C_SUV_01_F":
    {
        _lightright attachTo [_vehicle, [0.7,1.85,-0.5]];
    };

    case "C_Hatchback_01_sport_F":
    {
        _lightright attachTo [_vehicle, [0.8,1.6,-0.5]];
    };

    case "C_Hatchback_01_F":
    {
        _lightright attachTo [_vehicle, [0.8,1.6,-0.5]];
    };

    case "B_Heli_Light_01_F":
    {
        _lightright attachTo [_vehicle,[0.4,-0.15,0.5]];
    };

    case "B_Heli_Transport_01_F":
    {
        _lightright attachTo [_vehicle, [0.5, 0.0, 0.81]];
     };

     case "B_Heli_Transport_03_unarmed_F":
     {
       _lightright attachTo [_vehicle, [1.8,3.65,-1.6]];
     };

     case "O_Heli_Light_02_unarmed_F":
     {
       _lightright attachTo [_vehicle, [0,-0.65,0.9]];
     };
     case "B_Heli_Transport_01_camo_F":
     {
       _lightright attachTo [_vehicle, [0.8,-0.35,0.5]];
     };
     case "O_Heli_Transport_04_ammo_black_F":
     {
       _lightright attachTo [_vehicle,[-3.5,0.25,-0.9]];
     };
     case "O_Heli_Transport_04_black_F":
     {
       _lightright attachTo [_vehicle,[-3.5,0.25,-0.9]];
     };
     case "I_Heli_light_03_unarmed_F":
     {
       _lightright attachTo [_vehicle,[0.6,-0.25,0.8]];
     };
     case "O_Truck_03_repair_F":
     {
       _lightright attachTo [_vehicle,[0.7,3.05,1.05]];
     };
     case "O_Truck_03_covered_F":
     {
       _lightright attachTo [_vehicle,[0.7,3.25,0.75]];
     };
     case "B_Quadbike_01_F":
     {
       _lightright attachTo [_vehicle,[0.07, 1, -0.7]];
     };
	 case "C_Offroad_02_unarmed_F":
     {
       _lightright attachTo [_vehicle,[0.5,1.8,-0.4]];
     };
	 case "B_T_LSV_01_unarmed_F":
     {
       _lightright attachTo [_vehicle,[0.5,2,-0.9]];
     };
	 case "O_MRAP_02_F":
     {
       _lightright attachTo [_vehicle,[1.15,-1.6,0.35]];
     };
	 case "C_Plane_Civil_01_racing_F":
     {
       _lightright attachTo [_vehicle,[1.85,1.2,-0.75]];
     };
	 case "B_Heli_Attack_01_F":
     {
       _lightright attachTo [_vehicle,[0.75,-0.6,0.25]];
     };
	 case "B_T_VTOL_01_infantry_F":
     {
       _lightright attachTo [_vehicle,[12.65,5.1,-1.35]];
     };
	 case "B_T_VTOL_01_vehicle_F":
     {
       _lightright attachTo [_vehicle,[12.65,5.1,-1.35]];
     };
     case "B_G_Van_02_transport_F":
     {
       _lightright attachTo [_vehicle,[0.8,3.8,-0.5]];
     };
	 case "B_APC_Wheeled_01_cannon_F":
     {
       _lightright attachTo [_vehicle,[1.15, 0.0, 0.0]];
     };
     case "B_GEN_Van_02_transport_F":
     {
       _lightright attachTo [_vehicle,[0.4,1.6,-1.522]];
     };
     case "B_GEN_Van_02_vehicle_F":
     {
       _lightright attachTo [_vehicle,[0.4,1.6,-1.522]];
     };
    default {_lightright attachTo [_vehicle, [0, 0.0, 0]];};
};

_lightright setLightAttenuation _attenuation;
_lightright setLightIntensity _intensity;
_lightright setLightFlareSize 0.38;
_lightright setLightFlareMaxDistance 150;
_lightright setLightUseFlare true;

_lightleft setLightDayLight true;
_lightright setLightDayLight true;

_leftRed = true;

for "_i" from 0 to 1 step 0 do {
    if !(alive _vehicle) exitWith {};
    if (!(_vehicle getVariable "lights")) exitWith {};
    if (_leftRed) then
    {
        _leftRed = false;
        _lightright setLightBrightness 0.0;
        sleep 0.02;
        _lightleft setLightBrightness _bright;
    } else {
        _leftRed = true;
        _lightleft setLightBrightness 0.0;
        sleep 0.02;
        _lightright setLightBrightness _bright;
    };
  sleep 0.2;
};
deleteVehicle _lightleft;
deleteVehicle _lightright;