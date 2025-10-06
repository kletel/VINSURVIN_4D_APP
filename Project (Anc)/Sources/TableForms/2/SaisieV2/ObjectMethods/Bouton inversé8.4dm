$rep:=Pop up menu:C542(Get indexed string:C510(<>strlang; 235))
Case of 
		//: ($Rep=1)
		
		//FORMULAIRE ENTREE([Cave];"Imp_simple")
		
		//FORMULAIRE SORTIE([Cave];"Imp_simple")
		
		//IMPRIMER ENREGISTREMENT([Cave])
		
		//FORMULAIRE ENTREE([Cave];"Saisie")
		
		//FORMULAIRE SORTIE([Cave];"Liste")
		
		
	: ($Rep=1)
		FORM SET INPUT:C55([Cave:2]; "Imp")
		FORM SET OUTPUT:C54([Cave:2]; "Imp")
		PRINT RECORD:C71([Cave:2])
		FORM SET INPUT:C55([Cave:2]; "Saisie")
		FORM SET OUTPUT:C54([Cave:2]; "Liste")
		
	: ($Rep=2)
		FORM SET INPUT:C55([Cave:2]; "Imp_Vierge")
		FORM SET OUTPUT:C54([Cave:2]; "Imp_Vierge")
		PRINT RECORD:C71([Cave:2])
		FORM SET INPUT:C55([Cave:2]; "Saisie")
		FORM SET OUTPUT:C54([Cave:2]; "Liste")
		
	: ($Rep=3)
		ALL RECORDS:C47([Etiquettes:16])
		DELETE SELECTION:C66([Etiquettes:16])
		FORM SET INPUT:C55([Etiquettes:16]; "Formulaire1")
		FORM SET OUTPUT:C54([Etiquettes:16]; "Formulaire1")
		$nb:=Num:C11(Kle_Demander(Get indexed string:C510(<>strlang; 199)))
		If (Ok=1) & ($nb>0)
			For ($i; 1; $Nb)
				CREATE RECORD:C68([Etiquettes:16])
				[Etiquettes:16]Appellation:5:=[Cave:2]Appellation:2
				[Etiquettes:16]Appo_Max:9:=[Cave:2]Apogee_Max:29
				[Etiquettes:16]Appo_Min:8:=[Cave:2]Apogee:9
				[Etiquettes:16]Millesime:6:=[Cave:2]Millesime:6
				[Etiquettes:16]Nom:1:=[Cave:2]Nom:1
				[Etiquettes:16]Pays:3:=[Cave:2]Pays:24
				[Etiquettes:16]Prix:7:=[Cave:2]Prix_Achat_Euro:20
				[Etiquettes:16]Region:4:=[Cave:2]Région:5
				[Etiquettes:16]Type:2:=[Cave:2]Type:4
				[Etiquettes:16]Casier:10:=[Cave:2]Casier:32
				SAVE RECORD:C53([Etiquettes:16])
				
			End for 
			ALL RECORDS:C47([Etiquettes:16])
			PRINT LABEL:C39([Etiquettes:16])
		End if 
		
		
End case 
