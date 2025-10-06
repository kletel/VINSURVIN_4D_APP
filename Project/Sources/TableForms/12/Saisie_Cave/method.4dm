Case of 
	: (Form event code:C388=Sur chargement:K2:1)
		
		If (<>Flag_demo=True:C214) & ([Degustation:12]Ref_Cave:7=0)
			SET QUERY DESTINATION:C396(Vers variable:K19:4; $nb)
			QUERY:C277([Degustation:12]; [Degustation:12]Convives:3="@")
			SET QUERY DESTINATION:C396(Vers sélection courante:K19:1)
			If ($nb>=15)
				Kle_Alerte(Get indexed string:C510(<>strlang; 187))
				CANCEL:C270
			End if 
		End if 
		
		[Degustation:12]Ref_Cave:7:=[Cave:2]Ref_Cave:26
		If ([Degustation:12]Date_Degust:2=!00-00-00!)
			[Degustation:12]Date_Degust:2:=Current date:C33
		End if 
		
		
	: (Form event code:C388=Sur données modifiées:K2:15)
		
		If (Modified:C32([Degustation:12]Nb_Bouteille:8))
			[Cave:2]Dont_Bue:8:=[Cave:2]Dont_Bue:8-Old:C35([Degustation:12]Nb_Bouteille:8)+[Degustation:12]Nb_Bouteille:8
			[Cave:2]Reste_en_Cave:19:=[Cave:2]Qte:7-[Cave:2]Dont_Bue:8
			[Cave:2]Valeure_Total_Euro:21:=[Cave:2]Valeur_Euro:23*[Cave:2]Reste_en_Cave:19
			[Cave:2]Valeur_Total_Fr:22:=[Cave:2]Valeur:17*[Cave:2]Reste_en_Cave:19
		End if 
		
End case 