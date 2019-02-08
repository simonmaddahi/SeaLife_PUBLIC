/*
In the shops object init: this call life_fnc_addGangShop
_this is the shop object.
Stig is great
*/

if(isNull _this)exitWith{};
if(typeName _this != "OBJECT")exitWith{};
private _flag = nearestObject [getPos _this, "Land_PaperBox_closed_F"];
if(isNull _flag)exitWith{diag_log "ALARM DAS MIT DER FLAGGE GEHT NICHT!"};
_this setVariable ["flag",_flag];
if(isNull(_this getVariable ["flag",objNull]))exitWith{diag_log "ALARM ARMA IST SCHEISSE"};
_this addAction ["Illegales Zentrum Shop",life_fnc_weaponShopMenu, "gang", 6, true, true, "", "(((_target getVariable [""flag"",objNull]) getVariable [""gangOwner"",""""]) == (call life_fnc_getMyGangExtended)) && ((call life_fnc_getMyGangExtended) != """")", 8];
_this addAction ["Weiterbildung Illegales-Zentrum Shop",life_fnc_weaponShopMenu, "weiterbildung", 6, true, true, "", "(((_target getVariable [""flag"",objNull]) getVariable [""gangOwner"",""""]) == (call life_fnc_getMyGangExtended)) && ((call life_fnc_getMyGangExtended) != """")", 8];
//
_this addAction ["Weiterbildung Illegales-Zentrum Shop",life_fnc_weaponShopMenu, "weiterbildung", 6, true, true, "", "license_civ_weiterbildung", "(((_target getVariable [""flag"",objNull]) getVariable [""gangOwner"",""""]) == (call life_fnc_getMyGangExtended)) && ((call life_fnc_getMyGangExtended) != """")", 8];
//_this addAction ["Gang Shop TEST",life_fnc_weaponShopMenu, "gang", 6, true, true, "", "true", 8];
diag_log "Das Script wird wenigstens ausgefuehrt yo";

//this addAction[localize"STR_Shops_W_Gun",[nil,nil,nil,"gang"]life_fnc_weaponShopMenu,"gun",0,false,false,"",' license_civ_gun && playerSide isEqualTo civilian']; this addAction[localize "STR_Shops_C_Gun",life_fnc_clothingMenu,"gun_clothing",0,false,false,"",' license_civ_gun && playerSide isEqualTo civilian']; this addAction[format ["%1 ($%2)",localize (getText(missionConfigFile >> "Licenses" >> "gun" >> "displayName")), [(getNumber(missionConfigFile >> "Licenses" >> "gun" >> "price"))] call life_fnc_numberText],life_fnc_buyLicense,"gun",0,false,false,"",' !license_civ_gun && playerSide isEqualTo civilian '];