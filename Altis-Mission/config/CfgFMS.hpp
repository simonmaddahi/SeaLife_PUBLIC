//Funkmeldesystem Behörden
class CfgFMS {
  //Polizei
  class cop {
    //Streife
    class ZL {
      //Streifenname
      name = "Leitstelle";
      //Streifenkürzel in eckigen Klammern
      kurz = "[Leitstelle]";
      //Eine Beschreibung, darf gerne länger sein
      gebiet = "10 = Sofia / 20 = Grenze / 30 = Pygros / 40 = Highway / 50 = Alpha Landesschutzdienst / 60 = Zivilpolizei";
      //Min. Rang
      rang = "Polizeikommissar-Anwärter";
    };
    class ZJO { //Zentrale
      name = "Zentrale - Juliet Ost";
      kurz = "[Zentrale - Juliet Ost]";
      gebiet = "Juliet Ost";
      rang = "Polizeikommissar-Anwärter";
    };
	class SDL { //Zentrale
      name = "Zentrale - Juliet West";
      kurz = "[Zentrale - Juliet West]";
      gebiet = "Juliet West";
      rang = "Polizeikommissar-Anwärter";
    };
	class SO_1 { //Sofia
      name = "Streife 10-01";
      kurz = "[10-01]";
      gebiet = "Sofia Stadt";
      rang = "Polizeikommissar-Anwärter";
    };
	class SO_2 { //Sofia
      name = "Streife 10-02";
      kurz = "[10-02]";
      gebiet = "Sofia Stadt";
      rang = "Polizeikommissar-Anwärter";
    };
	class SO_3 { //Sofia
      name = "Streife 10-03";
      kurz = "[10-03]";
      gebiet = "Sofia Stadt";
      rang = "Polizeikommissar-Anwärter";
    };
	class GZ_1 { //Grenzposten
      name = "Streife 20-01";
      kurz = "[20-01]";
      gebiet = "Grenzposten";
      rang = "Polizeikommissar-Anwärter";
    };
	class GZ_2 { //Grenzposten
      name = "Streife 20-02";
      kurz = "[20-02]";
      gebiet = "Grenzposten";
      rang = "Polizeikommissar-Anwärter";
    };
	class PYR_1 { //Pygros
      name = "Streife 30-01";
      kurz = "[30-01]";
      gebiet = "Pygros Stadt";
      rang = "Polizeikommissar-Anwärter";
    };
	class PYR_2 { //Pygros
      name = "Streife 30-02";
      kurz = "[30-02]";
      gebiet = "Pygros Stadt";
      rang = "Polizeikommissar-Anwärter";
    };
	class HWP_1 { //HighwayPatrol
      name = "Streife 40-01";
      kurz = "[40-01]";
      gebiet = "Highway Patrol";
      rang = "Polizeikommissar-Anwärter";
    };
	class HWP_2 { //HighwayPatrol
      name = "Streife 40-02";
      kurz = "[40-02]";
      gebiet = "Highway Patrol";
      rang = "Polizeikommissar-Anwärter";
    };
	class Alpha_1 { //Landesschutzdienst
      name = "Streife 50-01";
      kurz = "[50-01]";
      gebiet = "Alles außerhalb der Grenze";
      rang = "Polizeikommissar-Anwärter";
    };
	class Alpha_2 { //Landesschutzdienst
      name = "Streife 50-02";
      kurz = "[50-02]";
      gebiet = "Alles außerhalb der Grenze";
      rang = "Polizeikommissar-Anwärter";
    };
	class Alpha_3 { //Landesschutzdienst
      name = "Streife 50-03";
      kurz = "[50-03]";
      gebiet = "Alles außerhalb der Grenze";
      rang = "Polizeikommissar-Anwärter";
    };
	class Alpha_4 { //Landesschutzdienst
      name = "Streife 50-04";
      kurz = "[50-04]";
      gebiet = "Alles außerhalb der Grenze";
      rang = "Polizeikommissar-Anwärter";
    };
	class ZivPol_1 { //Zivilpolizei
      name = "Zivilpolizei";
      kurz = "[ZivPol]";
      gebiet = "Alles";
      rang = "Polizeikommissar-Anwärter";
    };
	class SONDER_1 { //Sondereinsatz
      name = "Sondereinsatz";
      kurz = "[Sondereinsatz]";
      gebiet = "Bundeszentralbank / Geiselnahme";
      rang = "Polizeikommissar-Anwärter";
    };
    class not {
      name = "Nicht eingeloggt";
      kurz = "[Nicht Eingeteilt]";
      gebiet = "Du bist nicht eingeloggt. Melde dich bei der Leitstelle für eine Einteilung.";
      rang = "Polizeikommissar-Anwärter";
    };
    class default {
      name = "-/-";
      kurz = "[-/-]";
      gebiet = "-/-";
      rang = "-/-";
    };
  };

  //Medics
  class medic {
    class LEIT {
      name = "Leitstelle";
      kurz = "[LEIT]";
      gebiet = "Diese regelt den Streifendienst und beaufsichtigt Tätigkeiten.";
      rang = "Rettungshelfer";
    };

    // Kavala
    class ALPHA {
      name = "Truppe Alpha";
      kurz = "[Alpha]";
      gebiet = "Kavala";
      rang = "Rettungshelfer";
    };
    class BRAVO {
      name = "Truppe Bravo";
      kurz = "[Bravo]";
      gebiet = "Kavala";
      rang = "Rettungshelfer";
    };

    // Flughafen
    class CHARLIE {
      name = "Truppe Charlie";
      kurz = "[Charlie]";
      gebiet = "Flughafen";
      rang = "Rettungshelfer";
    };
    class DELTA {
      name = "Truppe Delta";
      kurz = "[Delta]";
      gebiet = "Flughafen";
      rang = "Rettungshelfer";
    };
    class ECHO {
      name = "Truppe Echo";
      kurz = "[Echo]";
      gebiet = "Flughafen";
      rang = "Rettungshelfer";
    };

    // Pyrgos
    class FOXTROT {
      name = "Truppe Foxtrot";
      kurz = "[Foxtrot]";
      gebiet = "Pyrgos";
      rang = "Rettungshelfer";
    };
    class GOLF {
      name = "Truppe Golf";
      kurz = "[Golf]";
      gebiet = "Pyrgos";
      rang = "Rettungshelfer";
    };

    // Sofia
    class HOTEL {
      name = "Truppe Hotel";
      kurz = "[Hotel]";
      gebiet = "Sofia";
      rang = "Rettungshelfer";
    };
    class INDIA {
      name = "Truppe India";
      kurz = "[India]";
      gebiet = "Sofia";
      rang = "Rettungshelfer";
    };

    class not_medic {
      name = "Nicht eingeloggt";
      kurz = "[Nicht Eingeteilt]";
      gebiet = "Du bist nicht eingeloggt. Melde dich bei der Leitstelle für eine Einteilung.";
      rang = "Rettungshelfer";
    };
    class default_medic {
      name = "-/-";
      kurz = "[-/-]";
      gebiet = "-/-";
      rang = "-/-";
    };
  };
};
