Case of 
	: (Form event code:C388=Sur chargement:K2:1)
		
		If (<>Flag_demo=True:C214) & ([Cave:2]Ref_Cave:26=0)
			SET QUERY DESTINATION:C396(Vers variable:K19:4; $nb)
			QUERY:C277([Cave:2]; [Cave:2]Nom:1="@")
			SET QUERY DESTINATION:C396(Vers sélection courante:K19:1)
			If ($nb>=15)
				Kle_Alerte(Get indexed string:C510(<>strlang; 187))
				CANCEL:C270
			End if 
		End if 
		
		If ([Cave:2]Ref_Cave:26=0)
			[Cave:2]Ref_Cave:26:=Kle_Crea_Ref(->[Cave:2]; ->[Cave:2]Ref_Cave:26)
			[Cave:2]Pays:24:="France"
			QUERY:C277([Pays:8]; [Pays:8]Nom_Fr:3=[Cave:2]Pays:24)
			[Cave:2]Ref_Pays:27:=[Pays:8]Ref_Pays:1
			Init_Pop_Region([Cave:2]Pays:24)
		End if 
		Kle_Langue
		
		SET WINDOW TITLE:C213(Get indexed string:C510(<>strLang; 172))
		
		//Initialisation de la boîte à onglet.
		LIST TO ARRAY:C288("Enum_Onglet_Cave"; Ong_Cave)
		Ong_Cave{1}:=Get indexed string:C510(<>strLang; 105)
		Ong_Cave{2}:=Get indexed string:C510(<>strLang; 106)
		Ong_Cave{3}:=Get indexed string:C510(<>strLang; 107)
		Ong_Cave{4}:=Get indexed string:C510(<>strLang; 87)
		
		FORM SET INPUT:C55([Degustation:12]; "Saisie_Cave")
		
		ALL RECORDS:C47([Producteur:13])
		ORDER BY:C49([Producteur:13]; [Producteur:13]Societe:2; >)
		SELECTION TO ARRAY:C260([Producteur:13]Societe:2; Lst_Product)
		QUERY:C277([Producteur:13]; [Producteur:13]Ref_Producteur:1=[Cave:2]Ref_Producteur:33)
		
		//Au cas ou 
		//: (<>monaie="FRF")
		//Bt_Frf:=1
		//Bt_Eur:=0
		//OBJET FIXER VISIBLE([Cave]Valeur_Euro;Faux)
		//OBJET FIXER VISIBLE([Cave]Prix_Achat_Euro;Faux)
		//OBJET FIXER VISIBLE([Cave]Valeur;Vrai)
		//OBJET FIXER VISIBLE([Cave]Prix_Achat;Vrai)
		//
		//: (<>monaie="EUR")
		//Bt_Frf:=1
		//Bt_Eur:=0
		//OBJET FIXER VISIBLE([Cave]Valeur_Euro;Vrai)
		//OBJET FIXER VISIBLE([Cave]Prix_Achat_Euro;Vrai)
		//OBJET FIXER VISIBLE([Cave]Valeur;Faux)
		//OBJET FIXER VISIBLE([Cave]Prix_Achat;Faux)
		//Fin de cas 
		//
		//Si (<>Langue=1)
		//OBJET FIXER VISIBLE(*;"Lan_Fr_@";Vrai)
		//Sinon 
		//OBJET FIXER VISIBLE(*;"Lan_Fr_@";Faux)
		//OBJET FIXER FORMATAGE([Cave]Valeur_Euro;"#####,##")
		//OBJET FIXER FORMATAGE([Cave]Prix_Achat_Euro;"#####,##")
		//OBJET FIXER FORMATAGE([Cave]Plus_Value_Eur;"#####,##")
		//Fin de si 
		
		QUERY:C277([Degustation:12]; [Degustation:12]Ref_Cave:7=[Cave:2]Ref_Cave:26)
		Init_Pop_Pays
		
		
		QUERY:C277([Textes:11]; [Textes:11]Type_Enumération:1="Type de vin")
		ORDER BY:C49([Textes:11]; [Textes:11]Positions:2; >)
		SELECTION TO ARRAY:C260(V_L_Type->; pop_Type)
		pop_Type:=1
		
		Init_Pop_Region([Cave:2]Pays:24)
		
		QUERY:C277([Textes:11]; [Textes:11]Type_Enumération:1="Mise en Bouteille")
		ORDER BY:C49([Textes:11]; [Textes:11]Positions:2; >)
		SELECTION TO ARRAY:C260(V_L_Type->; pop_Bouteille)
		pop_Bouteille:=1
		
		QUERY:C277([Textes:11]; [Textes:11]Type_Enumération:1="Flacon")
		ORDER BY:C49([Textes:11]; [Textes:11]Positions:2; >)
		SELECTION TO ARRAY:C260(V_L_Type->; pop_Flacon)
		pop_Flacon:=1
		
		QUERY:C277([Textes:11]; [Textes:11]Type_Enumération:1="Elevage")
		ORDER BY:C49([Textes:11]; [Textes:11]Positions:2; >)
		SELECTION TO ARRAY:C260(V_L_Type->; pop_Elevage)
		pop_Elevage:=1
		
		QUERY:C277([Producteur:13]; [Producteur:13]Ref_Producteur:1=[Cave:2]Ref_Producteur:33)
		
		If ([Cave:2]Valeur:17#0) & ([Cave:2]Prix_Achat:16#0)
			[Cave:2]Plus_Value:42:=([Cave:2]Valeur:17-[Cave:2]Prix_Achat:16)*[Cave:2]Reste_en_Cave:19
		Else 
			[Cave:2]Plus_Value:42:=0
		End if 
		
		If ([Cave:2]Valeur_Euro:23#0) & ([Cave:2]Prix_Achat_Euro:20#0)
			[Cave:2]Plus_Value_Eur:43:=([Cave:2]Valeur_Euro:23-[Cave:2]Prix_Achat_Euro:20)*[Cave:2]Reste_en_Cave:19
		Else 
			[Cave:2]Plus_Value_Eur:43:=0
		End if 
		GOTO OBJECT:C206([Cave:2]Nom:1)
		
	: (Form event code:C388=Sur données modifiées:K2:15)
		
		Case of 
			: (Modified:C32([Cave:2]Qte:7))
				[Cave:2]Reste_en_Cave:19:=[Cave:2]Qte:7-[Cave:2]Dont_Bue:8
				//[Cave]Valeure_Total_Euro:=[Cave]Valeur_Euro*[Cave]Reste_en_Cave
				[Cave:2]Valeur_Total_Fr:22:=[Cave:2]Valeur:17*[Cave:2]Reste_en_Cave:19
				
			: (Modified:C32([Cave:2]Dont_Bue:8))
				[Cave:2]Reste_en_Cave:19:=[Cave:2]Qte:7-[Cave:2]Dont_Bue:8
				//[Cave]Valeure_Total_Euro:=[Cave]Valeur_Euro*[Cave]Reste_en_Cave
				[Cave:2]Valeur_Total_Fr:22:=[Cave:2]Valeur:17*[Cave:2]Reste_en_Cave:19
				
			: (Modified:C32([Cave:2]Prix_Achat_Euro:20))
				//[Cave]Prix_Achat:=Euro converter([Cave]Prix_Achat_Euro;"EUR";"FRF")
				If ([Cave:2]Valeur:17=0)
					[Cave:2]Valeur:17:=[Cave:2]Prix_Achat:16
					//[Cave]Valeur_Euro:=[Cave]Prix_Achat_Euro
				End if 
				//[Cave]Valeure_Total_Euro:=[Cave]Valeur_Euro*[Cave]Reste_en_Cave
				[Cave:2]Valeur_Total_Fr:22:=[Cave:2]Valeur:17*[Cave:2]Reste_en_Cave:19
				
			: (Modified:C32([Cave:2]Prix_Achat:16))
				//[Cave]Prix_Achat_Euro:=Euro converter([Cave]Prix_Achat;"FRF";"EUR")
				If ([Cave:2]Valeur:17=0)
					[Cave:2]Valeur:17:=[Cave:2]Prix_Achat:16
					//[Cave]Valeur_Euro:=[Cave]Prix_Achat_Euro
				End if 
				//[Cave]Valeure_Total_Euro:=[Cave]Valeur_Euro*[Cave]Reste_en_Cave
				[Cave:2]Valeur_Total_Fr:22:=[Cave:2]Valeur:17*[Cave:2]Reste_en_Cave:19
				
				//: (Modified([Cave]Valeur))
				//[Cave]Valeur_Euro:=Euro converter([Cave]Valeur;"FRF";"EUR")
				//  [Cave]Valeure_Total_Euro:=[Cave]Valeur_Euro*[Cave]Reste_en_Cave
				//[Cave]Valeur_Total_Fr:=[Cave]Valeur*[Cave]Reste_en_Cave
				
			: (Modified:C32([Cave:2]Valeur_Euro:23))
				//[Cave]Valeur:=Euro converter([Cave]Valeur_Euro;"EUR";"FRF")
				[Cave:2]Valeure_Total_Euro:21:=[Cave:2]Valeur_Euro:23*[Cave:2]Reste_en_Cave:19
				//[Cave]Valeur_Total_Fr:=[Cave]Valeur*[Cave]Reste_en_Cave
				
		End case 
		
		//If ([Cave]Valeur#0) & ([Cave]Prix_Achat#0)
		//[Cave]Plus_Value:=([Cave]Valeur-[Cave]Prix_Achat)*[Cave]Reste_en_Cave
		//Else 
		//[Cave]Plus_Value:=0
		//End if 
		
		If ([Cave:2]Valeur_Euro:23#0) & ([Cave:2]Prix_Achat_Euro:20#0)
			[Cave:2]Plus_Value_Eur:43:=([Cave:2]Valeur_Euro:23-[Cave:2]Prix_Achat_Euro:20)*[Cave:2]Reste_en_Cave:19
		Else 
			[Cave:2]Plus_Value_Eur:43:=0
		End if 
		
End case 

