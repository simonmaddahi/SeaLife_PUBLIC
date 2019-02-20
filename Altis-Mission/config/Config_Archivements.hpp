/*
    Author: Natic
*/
class Archives
  {
    class jail {
          variable = "archiv_jail";
		      titel = "Gefängniswärter";
		      side = "cop";
		      description = "<t size='1'>Knaste: %2 ein <br/>eingeknastet: %1 </t>";          
      
            class level_1 {
                                needed = 100;
                                archiv = "Straßenbulle";
                    };
                    
                      class level_2 {
                                needed = 200;
                                archiv = "Krasser Bulle";
                    };
                    
                    class level_3 {
                                needed = 400;
                                archiv = "Einknaster";
                    };
                    
                    class level_4 {
                                needed = 600;
                                archiv = "Bulle von Kavala";
                    };
                    
                    class level_5 {
                                needed = 1000;
                                archiv = "Bulle von Altis";
                    };
        };
    class ticket {
          variable = "archiv_ticket";
		      titel = "Strafzettel";
		      side = "cop";
		      description = "<t size='1'>Vergebe: %2 Strafzettel <br/>Vergebene Strafzettel: %1 </t>";   
      
          class level_1 {
                                needed = 100;
                                archiv = "Streifenbulle";
                    };
           class level_2 {
                                needed = 300;
                                archiv = "Hüter der Bürger";
                    };
      
            class level_3 {
                                needed = 800;
                                archiv = "Kaufhauscop";
                    };
      
            class level_4 {
                                needed = 2500;
                                archiv = "König der Hüter";
                    };
      
            class level_5 {
                                needed = 5000;
                                archiv = "König der Könige";
                    };
        };
  
     class revived {
          variable = "archiv_revived";
		      titel = "Wiederbelebungen";
		      side = "med";
		      description = "<t size='1'>belebe: %2 Menschen wieder <br/>Wiederbelebungen: %1 </t>";   
       
          class level_1 {
                                needed = 100;
                                archiv = "Sanitäter";
                    };
           class level_2 {
                                needed = 300;
                                archiv = "Zahnfee";
                    };
      
            class level_3 {
                                needed = 800;
                                archiv = "Engel von Kavala";
                    };
      
            class level_4 {
                                needed = 2500;
                                archiv = "Engel von Altis";
                    };
      
            class level_5 {
                                needed = 5000;
                                archiv = "Die Fee von Altis";
                    };
          };
         class repair {
            variable = "archiv_repair";
		        titel = "Reparierungen";
		        side = "med","civ","cop";
		        description = "<t size='1'>Repariere: %2 Fahrzeuge <br/>Reparaturen: %1 </t>";  
           
          class level_1 {
                                needed = 100;
                                archiv = "KFZ-Meister";
                    };
           class level_2 {
                                needed = 800;
                                archiv = "Meister der Reifen";
                    };
      
            class level_3 {
                                needed = 2000;
                                archiv = "Erfahrener Bursche";
                    };
      
            class level_4 {
                                needed = 5000;
                                archiv = "Meister der Autos";
                    };
        };
        
         class robberys {
           variable = "archiv_robberys";
		        titel = "Raubüberfälle";
		        side = "civ";
		        description = "<t size='1'>Überfalle: %2 Banken/Menschen <br/>geleistete Überfälle: %1 </t>";  
           
          class level_1 {
                                needed = 100;
                                archiv = "Krimineller";
                    };
           class level_2 {
                                needed = 500;
                                archiv = "gefaehrlicher Mensch";
                    };
      
            class level_3 {
                                needed = 1000;
                                archiv = "Staatsfeind";
                    };
      
            class level_4 {
                                needed = 2500;
                                archiv = "Feind von Kavala";
                    };
      
            class level_5 {
                                needed = 5000;
                                archiv = "Terorist";
                    };
           };
  
        class buyitems {
              variable = "archiv_buyitems";
		        titel = "Käufe";
		        side = "med","civ","cop";
		        description = "<t size='1'>Kaufe: %2 Items <br/>Anzahl der Käufe: %1 </t>";  
          
          class level_1 {
                                needed = 100;
                                archiv = "Käufer";
                    };
           class level_2 {
                                needed = 500;
                                archiv = "Verhandler";
                    };
      
            class level_3 {
                                needed = 1000;
                                archiv = "Händler";
                    };
      
            class level_4 {
                                needed = 2500;
                                archiv = "Kaufgeil";
                    };
      
            class level_5 {
                                needed = 5000;
                                archiv = "Süchtig nach Kaufen";
                    };
           };
  };
