Case of 
	: (Self:C308->=2)
		ALL RECORDS:C47([Localisation_Carte:19])
		Modif_Image
		ALL RECORDS:C47([Localisation_Carte:19])
		ORDER BY:C49([Localisation_Carte:19]; [Localisation_Carte:19]Localisation:2; >)
		SELECTION TO ARRAY:C260([Localisation_Carte:19]Localisation:2; Popup_Cave)
		INSERT IN ARRAY:C227(Popup_Cave; 1; 3)
		Popup_Cave{1}:="Sélectionnez votre cave"
		Popup_Cave{2}:="Gérer votre cave"
		Popup_Cave{3}:="-"
		Popup_Cave:=1
		
	: (Self:C308->>3)
		QUERY:C277([Localisation_Carte:19]; [Localisation_Carte:19]Localisation:2=Self:C308->{Self:C308->})
		//[Cave]Carte_:=[Localisation_Carte]Carte2_
		//ch_CHAMP VERS ZONE ([Cave]Carte_CH_x;Table(->[Localisation_Carte]);Champ(->[Localisation_Carte]Carte2_))
		//ch_CHAMP VERS ZONE (Carte;Table(->[Localisation_Carte]);Champ(->[Localisation_Carte]Carte2_))
		
		//REDESSINER FENETRE(Fenetre formulaire courant)
End case 
