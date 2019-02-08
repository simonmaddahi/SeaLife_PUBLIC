//returns the players gang in the new system (yakuza/rocker/mafia)
_lizenzen = [license_civ_rocker,license_civ_mafia,license_civ_yakuza];
_istInEinerDerCoolenMegaSuperGangs = true in _lizenzen;
if (!_istInEinerDerCoolenMegaSuperGangs) exitWith {""};
switch (true) do {
	case license_civ_rocker: {
		"Rocker";
	};
	case license_civ_mafia: {
		"Mafia";
	};
	case license_civ_yakuza: {
		"Yakuza";
	};
};