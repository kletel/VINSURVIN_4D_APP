Case of 
	: (<>Langue=1) | (<>Langue=3)  //français
		QUERY:C277([Cave:2])
		If (ok=1)
			QUERY SELECTION:C341([Cave:2]; [Cave:2]Cave:40=<>CategorieCave)
			
			ORDER BY:C49([Cave:2]; [Cave:2]Nom:1; >)
			calcul_Valeure
		End if 
	: (<>Langue=2)  //Danois
		$ref:=Open form window:C675([Interface:1]; "Recherche")
		DIALOG:C40([Interface:1]; "Recherche")
		If (ok=1)
			ORDER BY:C49([Cave:2]; [Cave:2]Nom:1; >)
			calcul_Valeure
		End if 
End case 
