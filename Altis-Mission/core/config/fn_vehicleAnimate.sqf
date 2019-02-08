/*
    File: fn_vehicleAnimate.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Pass what you want to be animated.
*/
private ["_vehicle","_animate","_state"];
_vehicle = [_this,0,objNull,[objNull]] call BIS_fnc_param;
if (isNull _vehicle) exitWith {}; //FUCK
_animate = [_this,1,"",["",[]]] call BIS_fnc_param;
_preset = [_this,2,false,[false]] call BIS_fnc_param;

if (!_preset) then
{
    if (count _animate > 1) then
    {
        {
            _vehicle animate[_x select 0,_x select 1];
        } forEach _animate;
    }
        else
    {
        _vehicle animate[_animate select 0,_animate select 1];
    };
}
    else
{
    switch (_animate) do
    {
        case "civ_littlebird":
        {
            _vehicle animate ["addDoors",1];
            _vehicle animate ["addBenches",0];
            _vehicle animate ["addTread",0];
            _vehicle animate ["AddCivilian_hide",1];
            _vehicle lockCargo [2,true];
            _vehicle lockCargo [3,true];
            _vehicle lockCargo [4,true];
            _vehicle lockCargo [5,true];
        };

        case "service_truck":
        {
            _vehicle animate ["HideServices", 0];
            _vehicle animate ["HideDoor3", 1];
        };

        case "med_offroad":
        {
            private _toAnim = false;
            private _type = typeOf _vehicle;
            switch (_type) do {
                case "C_Van_02_medevac_F": {
                    _toAnim = ["Door_1_source",0,"Door_2_source",0,"Door_3_source",0,"Door_4_source",0,"Hide_Door_1_source",0,"Hide_Door_2_source",0,"Hide_Door_3_source",0,"Hide_Door_4_source",0,"lights_em_hide",0,"ladder_hide",1,"spare_tyre_holder_hide",1,"spare_tyre_hide",1,"reflective_tape_hide",0,"roof_rack_hide",0,"LED_lights_hide",0,"sidesteps_hide",1,"rearsteps_hide",0,"side_protective_frame_hide",0,"front_protective_frame_hide",1,"beacon_front_hide",0,"beacon_rear_hide",0];
                };
                case "B_GEN_Van_02_vehicle_F": {
                    _toAnim = ["Enable_Cargo",1,"Door_1_source",0,"Door_2_source",0,"Door_3_source",0,"Door_4_source",0,"Hide_Door_1_source",0,"Hide_Door_2_source",0,"Hide_Door_3_source",0,"Hide_Door_4_source",0,"lights_em_hide",0,"ladder_hide",0,"spare_tyre_holder_hide",1,"spare_tyre_hide",1,"reflective_tape_hide",0,"roof_rack_hide",1,"LED_lights_hide",0,"sidesteps_hide",1,"rearsteps_hide",0,"side_protective_frame_hide",0,"front_protective_frame_hide",0,"beacon_front_hide",0,"beacon_rear_hide",0];
                };

                case "C_Offroad_01_F": {
                    _toAnim = ["HideDoor1",0,"HideDoor2",0,"HideDoor3",0,"HideBackpacks",1,"HideBumper1",1,"HideBumper2",0,"HideConstruction",0,"hidePolice",0,"HideServices",1,"BeaconsStart",0,"BeaconsServicesStart",0];
                };

                case "C_Offroad_02_unarmed_F": {
                    _toAnim = ["hideLeftDoor",0,"hideRightDoor",0,"hideRearDoor",0,"hideBullbar",0,"hideFenders",0,"hideHeadSupportRear",0,"hideHeadSupportFront",0,"hideRollcage",1,"hideSeatsRear",0,"hideSpareWheel",0];
                };
            };
            //_vehicle animate ["HidePolice", 0];
            //_vehicle animate ["HideBumper1", 0];
            [
                _vehicle,
                false, 
                _toAnim
            ] call BIS_fnc_initVehicle;

            _vehicle setVariable ["lights",false,true];
			_vehicle setVariable ["medcar",true,true];
        };

        case "cop_offroad":
        {
            private _toAnim = false;
            private _type = typeOf _vehicle;
            switch (_type) do {
                case "B_GEN_Van_02_transport_F": {
                    _toAnim = ["Door_1_source",0,"Door_2_source",0,"Door_3_source",0,"Door_4_source",0,"Hide_Door_1_source",0,"Hide_Door_2_source",0,"Hide_Door_3_source",0,"Hide_Door_4_source",0,"lights_em_hide",0,"ladder_hide",1,"spare_tyre_holder_hide",1,"spare_tyre_hide",1,"reflective_tape_hide",0,"roof_rack_hide",1,"LED_lights_hide",0,"sidesteps_hide",1,"rearsteps_hide",0,"side_protective_frame_hide",0,"front_protective_frame_hide",0,"beacon_front_hide",0,"beacon_rear_hide",0];
                };
                case "B_GEN_Van_02_vehicle_F": {
                    _toAnim = ["Enable_Cargo",1,"Door_1_source",0,"Door_2_source",0,"Door_3_source",0,"Door_4_source",0,"Hide_Door_1_source",0,"Hide_Door_2_source",0,"Hide_Door_3_source",0,"Hide_Door_4_source",0,"lights_em_hide",0,"ladder_hide",0,"spare_tyre_holder_hide",1,"spare_tyre_hide",1,"reflective_tape_hide",0,"roof_rack_hide",1,"LED_lights_hide",0,"sidesteps_hide",1,"rearsteps_hide",0,"side_protective_frame_hide",0,"front_protective_frame_hide",0,"beacon_front_hide",0,"beacon_rear_hide",0];
                };

                case "C_Offroad_01_F": {
                    _toAnim = ["HideDoor1",0,"HideDoor2",0,"HideDoor3",0,"HideBackpacks",1,"HideBumper1",1,"HideBumper2",0,"HideConstruction",0,"hidePolice",0,"HideServices",1,"BeaconsStart",0,"BeaconsServicesStart",0];
                };

                case "C_Offroad_02_unarmed_F": {
                    _toAnim = ["hideLeftDoor",0,"hideRightDoor",0,"hideRearDoor",0,"hideBullbar",0,"hideFenders",0,"hideHeadSupportRear",0,"hideHeadSupportFront",0,"hideRollcage",1,"hideSeatsRear",0,"hideSpareWheel",0];
                };
            };
            //_vehicle animate ["HidePolice", 0];
            //_vehicle animate ["HideBumper1", 0];
            [
                _vehicle,
                false, 
                _toAnim
            ] call BIS_fnc_initVehicle;
            _vehicle setVariable ["lights",false,true];
			_vehicle setVariable ["copcar",true,true];
        };
    };
};