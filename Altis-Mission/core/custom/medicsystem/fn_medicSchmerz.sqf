
/*
	Author: Natic
	
	Description: Check it for yourself :)
*/

["Information", "Ein Mitarbeiter des Rettungsdienstes hat dir eine Schmerztablette verabreicht.", false, "fast"] spawn ESG_fnc_notify;
player setdamage 0;
life_thirst = 100;
life_hunger = 100;
"chromAberration" ppEffectEnable true; 
"radialBlur" ppEffectEnable true; 
enableCamShake true; 
for "_i" from 0 to 7 do 
{ 
	"chromAberration" ppEffectAdjust [random 0.25,random 0.25,true]; 
	"chromAberration" ppEffectCommit 1;    
	"radialBlur" ppEffectAdjust  [random 0.02,random 0.02,0.15,0.15]; 
 	"radialBlur" ppEffectCommit 1; 
	addcamShake[random 3, 1, random 3]; 
	sleep 1; 
}; 
"chromAberration" ppEffectAdjust [0,0,true]; 
"chromAberration" ppEffectCommit 5; 
"radialBlur" ppEffectAdjust  [0,0,0,0]; 
"radialBlur" ppEffectCommit 5; 
sleep 6; 

"chromAberration" ppEffectEnable false; 
"radialBlur" ppEffectEnable false; 
resetCamShake;
call life_fnc_hudUpdate;
