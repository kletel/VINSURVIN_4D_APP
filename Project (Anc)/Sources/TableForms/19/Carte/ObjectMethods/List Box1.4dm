Case of 
	: (Form event code:C388=Sur clic:K2:4)
		If (Self:C308->{Self:C308->}#"")
			QUERY:C277([Localisation_Carte:19]; [Localisation_Carte:19]Localisation:2=Self:C308->{Self:C308->})
			//Ô14500;5Ô (Carte;Table(->[Localisation_Carte]);Champ(->[Localisation_Carte]Carte2_))
			//Ô14500;24Ô (Carte2;1;1)  //Règles
			//Ô14500;24Ô (Carte2;2;0)  //Quadrillage
			//Ô14500;24Ô (Carte2;3;1)  //Saut de page
			//Ô14500;24Ô (Carte2;4;1)  //Coordonnées
			//Ô14500;24Ô (Carte2;8;1)  //Cadre Zone
			//Ô14500;24Ô (Carte2;9;0)  //Zone impression
			//Ô14500;24Ô (Carte2;10;0)  //Feuille papier
			//Ô14500;24Ô (Carte2;11;1)  //Fond gris
			//Ô14500;24Ô (Carte2;12;1)  //Case zoom
			//Ô14500;24Ô (Carte2;7;0)  //Case zoom
			//ch_F(Carte2;11;11;1;1;1)
			//LIRE RECT OBJET(Carte2;$gau;$haut;$droit;$bas)
			//‘14000;34‘ (Carte2;$droit-$gau;$bas-$haut)
			
		End if 
End case 