#include "..\..\script_macros.hpp"
/*
    File: fn_removeLicenses.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Used for stripping certain licenses off of civilians as punishment.
*/
private "_state";
_state = param [0,1,[0]];

switch (_state) do {
    //Death while being wanted
    case 0: {
        missionNamespace setVariable [LICENSE_VARNAME("rebel","civ"),false];
        missionNamespace setVariable [LICENSE_VARNAME("driver","civ"),false];
        missionNamespace setVariable [LICENSE_VARNAME("heroin","civ"),false];
        missionNamespace setVariable [LICENSE_VARNAME("marijuana","civ"),false];
        missionNamespace setVariable [LICENSE_VARNAME("cocaine","civ"),false];
    };

    //Jail licenses
    case 1: {
        missionNamespace setVariable [LICENSE_VARNAME("gun","civ"),false];
        missionNamespace setVariable [LICENSE_VARNAME("driver","civ"),false];
        missionNamespace setVariable [LICENSE_VARNAME("rebel","civ"),false];
    };

    //Remove motor vehicle licenses
    case 2: {
        if (missionNamespace getVariable LICENSE_VARNAME("driver","civ") || missionNamespace getVariable LICENSE_VARNAME("pilot","civ") || missionNamespace getVariable LICENSE_VARNAME("trucking","civ") || missionNamespace getVariable LICENSE_VARNAME("boat","civ")) then {
            missionNamespace setVariable [LICENSE_VARNAME("pilot","civ"),false];
            missionNamespace setVariable [LICENSE_VARNAME("driver","civ"),false];
            missionNamespace setVariable [LICENSE_VARNAME("trucking","civ"),false];
            missionNamespace setVariable [LICENSE_VARNAME("boat","civ"),false];
            ["Lizenz-Information","Du hast alle deine Fahrzeug-Lizenzen durch fahrlässige Tötung mit einem Fahrzeug verloren.", false, "fast"] spawn ESG_fnc_notify;
        };
    };

    //Killing someone while owning a gun license
    case 3: {
        if (missionNamespace getVariable LICENSE_VARNAME("gun","civ")) then {
            missionNamespace setVariable [LICENSE_VARNAME("gun","civ"),false];
            ["Lizenz-Information","Du hast deinen Waffenschein wegen Mordes verloren.", false, "fast"] spawn ESG_fnc_notify;
        };
    };

    case 4: {
        if (missionNamespace getVariable LICENSE_VARNAME("driver","civ")) then {
            missionNamespace setVariable [LICENSE_VARNAME("driver","civ"),false];
            ["Lizenz-Information","Dir wurde deine Fahrerlaubnis entzogen.", false, "fast"] spawn ESG_fnc_notify;
        };
    };

    case 5: {
        if (missionNamespace getVariable LICENSE_VARNAME("trucking","civ")) then {
            missionNamespace setVariable [LICENSE_VARNAME("trucking","civ"),false];
            ["Lizenz-Information","Dir wurde deine LKW-Fahrerlaubnis entzogen.", false, "fast"] spawn ESG_fnc_notify;
        };
    };

    case 6: {
        if (missionNamespace getVariable LICENSE_VARNAME("pilot","civ")) then {
            missionNamespace setVariable [LICENSE_VARNAME("pilot","civ"),false];
            ["Lizenz-Information","Dir wurde dein Flugschein entzogen.", false, "fast"] spawn ESG_fnc_notify;
        };
    };

    case 7: {
        if (missionNamespace getVariable LICENSE_VARNAME("boat","civ")) then {
            missionNamespace setVariable [LICENSE_VARNAME("boat","civ"),false];
            ["Lizenz-Information","Dir wurde dein Bootsführerschein entzogen.", false, "fast"] spawn ESG_fnc_notify;
        };
    };

    case 8: {
        if (missionNamespace getVariable LICENSE_VARNAME("gun","civ")) then {
            missionNamespace setVariable [LICENSE_VARNAME("gun","civ"),false];
            ["Lizenz-Information","Dir wurde dein Waffenschein entzogen.", false, "fast"] spawn ESG_fnc_notify;
        };
    };
};

[2] call SOCK_fnc_updatePartial;