/*
	Author: Basti | John Collins
*/

params [
	["_vehicle", objNull, [objNull]],
	["_plate", "", [""]]
];

if (isNull _vehicle || {_plate isEqualTo ""}) exitWith {};

_vehicle setPlateNumber _plate;