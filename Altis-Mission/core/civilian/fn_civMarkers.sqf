if(!("ItemGPS" in assignedItems player))exitWith{["Kein GPS","Da du kein GPS hast, wirst du keine Map-Markierungen sehen..", false, "fast"] spawn ESG_fnc_notify;};
markers=[];
((findDisplay 12)displayCtrl 51)ctrlAddEventHandler["Draw",{{(_this select 0)drawIcon _x;}forEach markers;}];
while{true}do{
	sleep 1;
	while{visibleMap}do{
		_units=[];
		_text="";
		{
			_unit=_x;
			if(_x getVariable["esg_bewusstlos",false])exitWith{};
			if(!("ItemGPS" in assignedItems _x))exitWith{};
			if((vehicle _x)!=_unit)then{
				_crew = [];
				_crewtemp = crew vehicle _x;
				{
					if(_x in (units group player)) then {
						_crew pushback _x;
					};
				}foreach _crewtemp;
				{
					if(!(_x in (units group player)))exitWith{};
					if !((_text find name _x)isEqualTo -1)exitWith{};
					_text = _text + format["%1",name _x];
					if(_foreachindex<(count _crew)-1 && _x in (units group player))then{_text=_text+", "};
				}foreach _crew;
				_units pushback[getText(configFile>>"CfgVehicles">>typeOf vehicle _x>>"Icon"),[0,1,1,1],visiblePosition vehicle _x,26,26,direction vehicle _x,format["%1",_text]];
			}else{
				_units pushback[getText(configFile>>"CfgVehicles">>typeOf vehicle _x>>"Icon"),[0,1,1,1],visiblePosition vehicle _x,26,26,direction vehicle _x,format["%1",name _x]];
			};
			_text="";
		}forEach(units group player);
		_marker=[];
		{_marker pushback _x;}foreach _units;
		markers=_marker;
	};
};