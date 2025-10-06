Kle_Confirmer(Get indexed string:C510(<>strlang; 194)+V_L_Lexique_Nom->+"'")
If (Ok=1)
	DELETE RECORD:C58([Vocabulaire:5])
	Rech:=""
	QUERY:C277([Vocabulaire:5]; V_L_Lexique_Nom->#"")
	ORDER BY:C49([Vocabulaire:5]; V_L_Lexique_Nom->; >)
	SELECTION TO ARRAY:C260(V_L_Lexique_Nom->; Lst)
	Txt:=""
	Ti_Texte:=""
	
End if 