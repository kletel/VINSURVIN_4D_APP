Case of 
	: (Form event code:C388=Sur chargement:K2:1)
		ALL RECORDS:C47([Producteur:13])
		ORDER BY:C49([Producteur:13]; [Producteur:13]Societe:2; >; [Producteur:13]Nom:3; >)
		CREATE SET:C116([Producteur:13]; "Tmp_Prod")
		
	: (Form event code:C388=Sur fermeture corps:K2:24)
		USE SET:C118("Tmp_Prod")
		ORDER BY:C49([Producteur:13]; [Producteur:13]Societe:2; >; [Producteur:13]Nom:3; >)
End case 