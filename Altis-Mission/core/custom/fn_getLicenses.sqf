/*
	Author: Basti | John Collins
*/

params [
	["_cop", objNull, [objNull]],
	["_id", 0, [0]]
];

if (isNull _cop || {isNil "_cop"}) exitWith {};

private _arr = [];

_arr pushback (license_civ_driver);
_arr pushback (license_civ_trucking);
_arr pushback (license_civ_pilot);
_arr pushback (license_civ_boat);
_arr pushback (license_civ_gun);

ESG_getOtherLicense = _arr;

_id publicVariableClient "ESG_getOtherLicense";

ESG_getOtherLicense = nil;