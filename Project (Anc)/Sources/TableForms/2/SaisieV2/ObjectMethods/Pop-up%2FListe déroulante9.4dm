Case of 
		
	: (Form event code:C388=Sur chargement:K2:1)
		
		QUERY:C277([Textes:11]; [Textes:11]Type_Enumération:1="Douceur")
		ORDER BY:C49([Textes:11]; [Textes:11]Texte_Fr:3; >)
		SELECTION TO ARRAY:C260([Textes:11]Texte_Fr:3; pop_Douc)
		
		INSERT IN ARRAY:C227(pop_Douc; 1; 2)
		ARRAY TEXT:C222(pop_Douc; 1)
		pop_Douc{1}:="Douceur"
		//pop_Douc{2}:="-"
		
		pop_Douc:=1
		
		
	: (Form event code:C388=Sur clic:K2:4)
		If (pop_Douc>2)
			[Cave:2]Douceur:60:=pop_Douc{pop_Douc}
			pop_Douc:=1
		End if 
		
End case 