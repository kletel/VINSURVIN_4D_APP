Case of 
	: (Form event code:C388=Sur chargement:K2:1)
		If ([Localisation_Carte:19]_Ref:1=0)
			//[Localisation_Carte]_Ref:=[Cave]Ref_Cave
		End if 
		ALL RECORDS:C47([Localisation_Carte:19])
		
		
		If (Records in selection:C76([Localisation_Carte:19])=0)
			CREATE RECORD:C68([Localisation_Carte:19])
			[Localisation_Carte:19]Localisation:2:="Nouvelle cave"
			SAVE RECORD:C53([Localisation_Carte:19])
			ALL RECORDS:C47([Localisation_Carte:19])
		End if 
		ORDER BY:C49([Localisation_Carte:19]; [Localisation_Carte:19]Localisation:2; >)
		SELECTION TO ARRAY:C260([Localisation_Carte:19]Localisation:2; Lst_Local1)
		FIRST RECORD:C50([Localisation_Carte:19])
		//‘14000;126‘ (Carte2)
		//
		//‘14000;143‘ (Carte2;1;0)  `Règles
		//‘14000;143‘ (Carte2;2;0)  `Quadrillage
		//‘14000;143‘ (Carte2;3;0)  `Saut de page
		//‘14000;143‘ (Carte2;4;0)  `Coordonnées
		//‘14000;143‘ (Carte2;8;0)  `Cadre Zone
		//‘14000;143‘ (Carte2;9;0)  `Zone impression
		//‘14000;143‘ (Carte2;10;0)  `Feuille papier
		//‘14000;143‘ (Carte2;11;0)  `Fond gris
		//‘14000;143‘ (Carte2;12;0)  `Case zoom
		//‘14000;143‘ (Carte2;7;0)  `Case zoom
		//‘14000;92‘ (Carte2;11;11;1;1;1)
		//LIRE RECT OBJET(Carte2;$gau;$haut;$droit;$bas)
		//‘14000;34‘ (Carte2;$droit-$gau;$bas-$haut)
		
	: (Form event code:C388=Sur données modifiées:K2:15)
		
	: (Form event code:C388=Sur validation:K2:3)
		//‘14000;125‘ (Carte2;-1)
End case 

