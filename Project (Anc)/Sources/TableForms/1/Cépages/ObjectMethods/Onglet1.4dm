Case of 
	: (Self:C308->=1)
		QUERY:C277([Cépages:6]; [Cépages:6]Vin:1="@Blanc@"; *)
		QUERY:C277([Cépages:6];  & ; [Cépages:6]Langue:9=<>Langue)
		ORDER BY:C49([Cépages:6]; [Cépages:6]Cepage:2; >)
		SELECTION TO ARRAY:C260([Cépages:6]Cepage:2; Lst_Nom_Cepage)
		
	: (Self:C308->=2)
		QUERY:C277([Cépages:6]; [Cépages:6]Vin:1="@Rou@"; *)
		QUERY:C277([Cépages:6];  & ; [Cépages:6]Langue:9=<>Langue)
		ORDER BY:C49([Cépages:6]; [Cépages:6]Cepage:2; >)
		SELECTION TO ARRAY:C260([Cépages:6]Cepage:2; Lst_Nom_Cepage)
		
	: (Self:C308->=3)
		$Rep:=Kle_Demander(Get indexed string:C510(<>strLang; 19))  //Cépage recherché
		QUERY:C277([Cépages:6]; [Cépages:6]Cepage:2="@"+$rep+"@"; *)
		QUERY:C277([Cépages:6];  & ; [Cépages:6]Langue:9=<>Langue)
		ORDER BY:C49([Cépages:6]; [Cépages:6]Cepage:2; >)
		SELECTION TO ARRAY:C260([Cépages:6]Cepage:2; Lst_Nom_Cepage)
End case 
