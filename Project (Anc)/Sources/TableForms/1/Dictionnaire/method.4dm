Case of 
	: (Form event code:C388=Sur chargement:K2:1)
		Kle_Langue
		Rech:=""
		QUERY:C277([Vocabulaire:5]; V_L_Lexique_Nom->#"")
		ORDER BY:C49([Vocabulaire:5]; V_L_Lexique_Nom->; >)
		SELECTION TO ARRAY:C260(V_L_Lexique_Nom->; Lst)
		Txt:=""
		Ti_Texte:=""
		
End case 