_mode = _this select 0;
if(_mode isEqualTo "")exitwith{}; //Nichts geht nicht!
disableSerialization;
private _display = findDisplay 39494;
switch (_mode) do {
	case "beine": {	ESG_medicSelected = ["Beine", ["legs"]]; };
	case "arme": { ESG_medicSelected = ["Arme", ["arms", "hands"]]; };
	case "torso": { ESG_medicSelected = ["Torso", ["body", "spine1", "spine2", "spine3", "pelvis"]]; };
	case "kopf": { ESG_medicSelected = ["Kopf", ["head", "neck", "face_hub"]]; };
	default { ESG_medicSelected = ["Beine", ["legs"]]; };
};
//playSound "HintExpand";
//hintSilent format ["Auswahl geändert zu %1",ESG_medicSelected select 0];
["Medicsystem", format ["Auswahl geändert zu %1",ESG_medicSelected select 0], false, "fast"] spawn ESG_fnc_notify;
[ESG_medicInteract]spawn ESG_fnc_medicLoadMenu;