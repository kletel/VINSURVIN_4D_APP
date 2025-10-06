$rep:=Kle_Demander(Get indexed string:C510(<>strLang; 61))  //Occasion à rechercher
If (Ok=1)
	QUERY:C277([Degustation:12]; [Degustation:12]Occasion:4="@"+$Rep+"@")
	
	CREATE SET:C116([Degustation:12]; "tmp_degu")
	ORDER BY:C49([Degustation:12]; [Degustation:12]Occasion:4; >)
End if 