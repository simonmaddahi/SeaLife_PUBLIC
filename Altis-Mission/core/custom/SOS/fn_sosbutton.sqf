private ["_marker"];
if(playerside != west)exitWith{};
if(ESG_sos_cooldown)exitWith{["SOS-Notruf", "Chill mal! Nicht so schnell!", true, "fast"] spawn ESG_fnc_notify;};
ESG_sos_cooldown = true;
["SOS-Notruf", format["<t align='center' font='PuristaBold' size='2' color='#ff0000'>SOS-Alarm</t><br/><br/><t align='center' size='1.5'>%3<br/><br/>%1 hat den SOS Knopf betätigt. Dringend Unterstützung benötigt!<br/><br/>Position: %2<br/><br/>%3</t>",player getVariable["realname",name player], mapGridPosition player,'============'], false, "fast"] remoteExecCall ["ESG_fnc_notify", west];
"alarm" remoteExec["playsound", west];
[player]remoteExec["ESG_fnc_sosMarker",west];
0 spawn {
  	sleep 90;
	["SOS-Notruf", "Deine SOS-Markierung wurde gelöscht.", false, "fast"] spawn ESG_fnc_notify;
  	sleep 60;
  	ESG_sos_cooldown = false;
};
