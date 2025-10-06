Case of 
	: (Form event code:C388=Sur chargement:K2:1)
		ARRAY TEXT:C222(<>t_Termes_Categorie; 1)
		<>t_Termes_Categorie{1}:="String Langue"
		If (Is new record:C668([Termes:22]))
			Gen_NumerAuto(->[Termes:22])
			[Termes:22]Categorie:9:=<>t_Termes_Categorie
			$id:=[Termes:22]ID_Termes:1
			
			PUSH RECORD:C176([Termes:22])
			QUERY:C277([Termes:22]; [Termes:22]Categorie:9=<>t_Termes_Categorie)
			ORDER BY:C49([Termes:22]; [Termes:22]Valeur_Numerique:8; <)
			FIRST RECORD:C50([Termes:22])
			$num:=[Termes:22]Valeur_Numerique:8
			POP RECORD:C177([Termes:22])
			
			[Termes:22]Valeur_Numerique:8:=$num+1
			[Termes:22]Termes_Langue1:10:=""
			[Termes:22]Termes_Langue2:11:=""
			[Termes:22]Termes_Langue3:12:=""
			[Termes:22]Termes_Langue4:13:=""
			[Termes:22]Termes_Langue5:14:=""
			[Termes:22]Termes_Langue6:15:=""
			[Termes:22]Termes_Langue7:16:=""
			[Termes:22]Termes_Langue8:17:=""
			[Termes:22]Termes_Langue9:18:=""
			[Termes:22]Termes_Langue10:19:=""
			
			
		Else 
			<>t_Termes_Categorie:=[Termes:22]Categorie:9
		End if 
		
		
End case 