/* 
	Author: Natic [naticclips@gmail.com]
	Date: 25.01.2019
	Reclaimer: Nobody is allowed to use/edit this Script without my Permissions
*/
params [
    ["_company", "natic_company", "_switch"]
];
if (_company) exitWith {
	hint format["Da du kein Firmeninhaber bist, wird dir auch keine Lizenz ausgehändigt!"];
} else {
		switch (_switch) do {
		case (_item isEqualTo "company_owner"): { 
		missionNamespace setVariable ["company_owner",true];
       [2] call SOCK_fnc_updatePartial;
   };
};
};