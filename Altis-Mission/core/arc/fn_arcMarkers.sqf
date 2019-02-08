sleep 0.5;
if (visibleMap) then {
		_units=[];
		_text="";
		{
			_unit = _x;
			if((vehicle _unit) isEqualTo _unit) then {
				if(("ItemGPS" in assignedItems _unit)  && !(_unit getVariable["esg_bewusstlos",false]) && !(_x getVariable ["restrained",false])) then {
					_marker = createMarkerLocal [format ["%1_marker",_unit],visiblePosition _unit];
					_marker setMarkerColorLocal "ColorYellow";
					_marker setMarkerTypeLocal "Mil_dot";
					_marker setMarkerTextLocal format ["%1 %2", getText(missionConfigFile >> "CfgFMS" >> "arc" >> ((_unit getvariable ["fms",[[], "not"]]) select 1) >> "kurz"),name _unit];

					_units pushback [_marker, _unit];
				};
			}else{
				_crew = [];
				_crewtemp = crew vehicle _unit;
				{
					if(_x in (units group player) && !(_x getVariable ["restrained",false])) then {
						_crew pushback _x;
					};
				} foreach _crewtemp;
				_text = format ["[%1]", getText(configFile >> "CfgVehicles" >> (typeOf vehicle _unit) >> "displayName")];
				{
					if(!(_x in (units group player)))exitWith{};
					if !((_text find name _x)isEqualTo -1)exitWith{};
					_text = _text + format["%1 %2",getText(missionConfigFile >> "CfgFMS" >> "arc" >> ((_x getvariable ["fms",[[], "not"]]) select 1) >> "kurz"),name _x];
					if(_foreachindex<(count _crew)-1 && _x in (units group player))then{_text=_text+", "};
				} foreach _crew;

				_marker = createMarkerLocal [format ["%1_marker",vehicle _unit],visiblePosition vehicle _unit];
				_marker setMarkerColorLocal "ColorYellow";
				_marker setMarkerTypeLocal "Mil_dot";
				_marker setMarkerTextLocal format ["%1",_text];

				_units pushback [_marker, vehicle _unit];
			};
			_text="";
		} forEach (units group player);

    while {visibleMap} do {
    	{
            private ["_unit"];
            _unit = _x select 1;
            if (!isNil "_unit" && !isNull _unit) then {
                (_x select 0) setMarkerPosLocal (visiblePosition _unit);
            };
        } forEach _units;
        if (!visibleMap) exitWith {};
        sleep 0.02;
    };

    {deleteMarkerLocal (_x select 0);} forEach _units;
    _units = [];
};