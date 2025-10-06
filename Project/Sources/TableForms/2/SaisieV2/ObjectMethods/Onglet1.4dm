Case of 
		
	: (Self:C308->=3)
		
		If ([Cave:2]Ref_Producteur:33=0)
			OBJECT SET VISIBLE:C603(*; "Pr_@"; False:C215)
		Else 
			OBJECT SET VISIBLE:C603(*; "Pr_@"; True:C214)
		End if 
		
	: (Self:C308->=5)
		FORM GOTO PAGE:C247(6)
		QUERY:C277([Cépages:6]; [Cépages:6]Texte:3#"")
		//ch_FIXER AFFICHAGE (Carte;1;1)  `Règles
		//ch_FIXER AFFICHAGE (Carte;2;1)  `Quadrillage
		//ch_FIXER AFFICHAGE (Carte;3;1)  `Saut de page
		//ch_FIXER AFFICHAGE (Carte;4;1)  `Coordonnées
		//ch_FIXER AFFICHAGE (Carte;8;1)  `Cadre Zone
		//ch_FIXER AFFICHAGE (Carte;9;0)  `Zone impression
		//ch_FIXER AFFICHAGE (Carte;10;0)  `Feuille papier
		//ch_FIXER AFFICHAGE (Carte;11;1)  `Fond gris
		//ch_FIXER AFFICHAGE (Carte;12;1)  `Case zoom
		//ch_FIXER AFFICHAGE (Carte;7;0)  `Case zoom
		//REDESSINER FENETRE(Fenetre formulaire courant)
		REDRAW:C174(Carte)
		
End case 
