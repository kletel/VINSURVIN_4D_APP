Case of 
	: (Form event code:C388=Sur chargement:K2:1)  //` | (Evenement formulaire=Sur activation )
		//Carte_CH:=ch_Hors ecran 
		FORM GOTO PAGE:C247(1)
		//ch_CHAMP VERS ZONE (Carte;Table(->[Cave]);Champ(->[Cave]Carte_))
		//ch_FIXER AFFICHAGE (Carte;1;1)  `Règles
		//ch_FIXER AFFICHAGE (Carte;2;0)  `Quadrillage
		//ch_FIXER AFFICHAGE (Carte;3;1)  `Saut de page
		//ch_FIXER AFFICHAGE (Carte;4;1)  `Coordonnées
		//ch_FIXER AFFICHAGE (Carte;8;1)  `Cadre Zone
		//ch_FIXER AFFICHAGE (Carte;9;0)  `Zone impression
		//ch_FIXER AFFICHAGE (Carte;10;0)  `Feuille papier
		//ch_FIXER AFFICHAGE (Carte;11;1)  `Fond gris
		//ch_FIXER AFFICHAGE (Carte;12;1)  `Case zoom
		//ch_FIXER AFFICHAGE (Carte;7;0)  `Case zoom
		
		DEFAULT TABLE:C46([Cave:2])
		If (<>Flag_demo=True:C214) & ([Cave:2]Ref_Cave:26=0)
			$nb:=0
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
		ARRAY TEXT:C222(Ong_Cave; 5)
		Ong_Cave{1}:=Get indexed string:C510(<>strLang; 105)
		Ong_Cave{2}:=Get indexed string:C510(<>strLang; 106)
		Ong_Cave{3}:=Get indexed string:C510(<>strLang; 107)
		Ong_Cave{4}:=Get indexed string:C510(<>strLang; 87)
		Ong_Cave{5}:="Cépages"
		
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
		//OBJET FIXER VISIBLE([Cave]Plus_Value_Eur;Faux)
		//OBJET FIXER VISIBLE([Cave]Valeur;Vrai)
		//OBJET FIXER VISIBLE([Cave]Prix_Achat;Vrai)
		//OBJET FIXER VISIBLE([Cave]Plus_Value;Vrai)
		//
		//: (<>monaie="EUR")
		//Bt_Frf:=1
		//Bt_Eur:=0
		//OBJET FIXER VISIBLE([Cave]Valeur_Euro;Vrai)
		//OBJET FIXER VISIBLE([Cave]Prix_Achat_Euro;Vrai)
		//OBJET FIXER VISIBLE([Cave]Plus_Value_Eur;Vrai)
		//OBJET FIXER VISIBLE([Cave]Valeur;Faux)
		//OBJET FIXER VISIBLE([Cave]Prix_Achat;Faux)
		//OBJET FIXER VISIBLE([Cave]Plus_Value;Faux)
		//
		//Fin de cas 
		
		//Si (<>Langue=1)
		//OBJET FIXER VISIBLE(*;"Lan_Fr_@";Vrai)
		//Sinon 
		//OBJET FIXER VISIBLE(*;"Lan_Fr_@";Faux)
		//OBJET FIXER FORMATAGE([Cave]Valeur_Euro;"#####,##")
		//OBJET FIXER FORMATAGE([Cave]Prix_Achat_Euro;"#####,##")
		//OBJET FIXER FORMATAGE([Cave]Plus_Value_Eur;"#####,##")
		//Fin de si 
		
		//Si ([Cave]Valeur#0) & ([Cave]Prix_Achat#0)
		//[Cave]Plus_Value:=([Cave]Valeur-[Cave]Prix_Achat)*[Cave]Reste_en_Cave
		//Sinon 
		//[Cave]Plus_Value:=0
		//Fin de si 
		
		If ([Cave:2]Valeur_Euro:23#0) & ([Cave:2]Prix_Achat_Euro:20#0)
			[Cave:2]Plus_Value_Eur:43:=([Cave:2]Valeur_Euro:23-[Cave:2]Prix_Achat_Euro:20)*[Cave:2]Reste_en_Cave:19
		Else 
			[Cave:2]Plus_Value_Eur:43:=0
		End if 
		
		
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
		
		Init_Zone_Draw
		ALL RECORDS:C47([Localisation_Carte:19])
		ORDER BY:C49([Localisation_Carte:19]; [Localisation_Carte:19]Localisation:2; >)
		SELECTION TO ARRAY:C260([Localisation_Carte:19]Localisation:2; Popup_Cave)
		INSERT IN ARRAY:C227(Popup_Cave; 1; 3)
		Popup_Cave{1}:="Sélectionnez votre cave"
		Popup_Cave{2}:="Gérer votre cave"
		Popup_Cave{3}:="-"
		GOTO OBJECT:C206([Cave:2]Nom:1)
		
	: (Form event code:C388=Sur redimensionnement:K2:27)
		Init_Zone_Draw
		
	: (Form event code:C388=Sur données modifiées:K2:15)
		
		Case of 
			: (Modified:C32([Cave:2]Qte:7))
				[Cave:2]Reste_en_Cave:19:=[Cave:2]Qte:7-[Cave:2]Dont_Bue:8
				[Cave:2]Valeure_Total_Euro:21:=[Cave:2]Valeur_Euro:23*[Cave:2]Reste_en_Cave:19
				//[Cave]Valeur_Total_Fr:=[Cave]Valeur*[Cave]Reste_en_Cave
				
			: (Modified:C32([Cave:2]Dont_Bue:8))
				[Cave:2]Reste_en_Cave:19:=[Cave:2]Qte:7-[Cave:2]Dont_Bue:8
				[Cave:2]Valeure_Total_Euro:21:=[Cave:2]Valeur_Euro:23*[Cave:2]Reste_en_Cave:19
				//[Cave]Valeur_Total_Fr:=[Cave]Valeur*[Cave]Reste_en_Cave
				
			: (Modified:C32([Cave:2]Prix_Achat_Euro:20))
				//[Cave]Prix_Achat:=Euro converter([Cave]Prix_Achat_Euro;"EUR";"FRF")
				If ([Cave:2]Valeur:17=0)
					//[Cave]Valeur:=[Cave]Prix_Achat
					[Cave:2]Valeur_Euro:23:=[Cave:2]Prix_Achat_Euro:20
				End if 
				[Cave:2]Valeure_Total_Euro:21:=[Cave:2]Valeur_Euro:23*[Cave:2]Reste_en_Cave:19
				//[Cave]Valeur_Total_Fr:=[Cave]Valeur*[Cave]Reste_en_Cave
				
			: (Modified:C32([Cave:2]Prix_Achat:16))
				//[Cave]Prix_Achat_Euro:=Euro converter([Cave]Prix_Achat;"FRF";"EUR")
				If ([Cave:2]Valeur:17=0)
					//[Cave]Valeur:=[Cave]Prix_Achat
					[Cave:2]Valeur_Euro:23:=[Cave:2]Prix_Achat_Euro:20
				End if 
				[Cave:2]Valeure_Total_Euro:21:=[Cave:2]Valeur_Euro:23*[Cave:2]Reste_en_Cave:19
				//[Cave]Valeur_Total_Fr:=[Cave]Valeur*[Cave]Reste_en_Cave
				
			: (Modified:C32([Cave:2]Valeur:17))
				//[Cave]Valeur_Euro:=Euro converter([Cave]Valeur;"FRF";"EUR")
				[Cave:2]Valeure_Total_Euro:21:=[Cave:2]Valeur_Euro:23*[Cave:2]Reste_en_Cave:19
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
		
	: (Form event code:C388=Sur fermeture corps:K2:24)
		QUERY:C277([Degustation:12]; [Degustation:12]Ref_Cave:7=[Cave:2]Ref_Cave:26)
		
	: (Form event code:C388=Sur validation:K2:3)
		//Ô14500;8Ô (Carte;-1;2;45;3)
		//Ô14500;11Ô (Carte)
End case 

