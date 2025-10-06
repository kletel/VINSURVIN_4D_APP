$rep:=Kle_Demander(Get indexed string:C510(<>strLang; 63))  //Plat à rechercher
If (Ok=1)
	QUERY:C277([Degustation:12]; [Degustation:12]Plats:5="@"+$Rep+"@")
	
	CREATE SET:C116([Degustation:12]; "tmp_degu")
	ORDER BY:C49([Degustation:12]; [Degustation:12]Plats:5; >)
End if 