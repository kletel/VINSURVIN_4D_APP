
$rep:=Pop up menu:C542(Get indexed string:C510(<>strLang; 236))

//Au cas ou 
//: (◊ModeUtilisation=0)
//  `";Fiche simple;Fiche détallée;(-;Impresson personnalis"+"ée")
//: (◊ModeUtilisation=1)
//Fin de cas 

// $rep:=Pop up menu("Liste simple;Liste détaillée;Fiche simple;Fiche détallée;(-;Impresson personnalis"+"ée;Etiquettes")
Case of 
	: ($rep=1)
		
		Case of 
			: (<>ModeUtilisation=0)
				FORM SET OUTPUT:C54([Cave:2]; "Impression")
				PRINT SELECTION:C60([Cave:2])
			: (<>ModeUtilisation=1)
				FORM SET OUTPUT:C54([Cave:2]; "Impression2")
				PRINT SELECTION:C60([Cave:2])
		End case 
		
	: ($Rep=2)
		
		Case of 
			: (<>ModeUtilisation=0)
				FORM SET OUTPUT:C54([Cave:2]; "Imp_Simple")
				PRINT SELECTION:C60([Cave:2])
			: (<>ModeUtilisation=1)
				FORM SET OUTPUT:C54([Cave:2]; "Imp")
				PRINT SELECTION:C60([Cave:2])
		End case 
		
		
	: ($Rep=3)
		QR REPORT:C197([Cave:2]; Char:C90(1); False:C215; True:C214; True:C214)
		
	: ($Rep=4)
		//FORMULAIRE SORTIE([Cave];"Impression")
		PRINT LABEL:C39([Cave:2]; Char:C90(1))
		
	: ($Rep=6)
End case 
