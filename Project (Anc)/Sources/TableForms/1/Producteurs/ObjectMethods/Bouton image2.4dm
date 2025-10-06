//$ref:=Pop up menu("Impression simple;Impression détaillée")
Case of 
	: (<>ModeUtilisation=0)
		FORM SET OUTPUT:C54([Producteur:13]; "Impression")
		PRINT SELECTION:C60([Producteur:13])
		
	: (<>ModeUtilisation=1)
		FORM SET OUTPUT:C54([Producteur:13]; "Imp")
		PRINT SELECTION:C60([Producteur:13])
		
End case 

FORM SET OUTPUT:C54([Producteur:13]; "Sortie")

