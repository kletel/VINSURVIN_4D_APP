Case of 
	: (Form event code:C388=Sur chargement:K2:1)
		ALL RECORDS:C47([Degustation:12])
		ORDER BY:C49([Degustation:12]Date_Degust:2; <)
		CREATE SET:C116([Degustation:12]; "tmp_degu")
	: (Form event code:C388=Sur fermeture corps:K2:24)
		USE SET:C118("tmp_degu")
		ORDER BY:C49([Degustation:12]Date_Degust:2; <)
End case 