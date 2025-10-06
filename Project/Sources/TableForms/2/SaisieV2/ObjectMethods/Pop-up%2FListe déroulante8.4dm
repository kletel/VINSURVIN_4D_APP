Case of 
		
	: (Self:C308->=2)
		$reg:=Kle_Demander(Get indexed string:C510(<>strLang; 54))  // Demande ajouter une région
		
		If (Ok=1)
			CREATE RECORD:C68([Region:9])
			[Region:9]Nom_Fr:2:=$reg
			[Region:9]Ref_Pays:10:=[Cave:2]Ref_Pays:27
			SAVE RECORD:C53([Region:9])
			[Cave:2]Ref_Region:28:=[Region:9]Ref_Region:1
			[Cave:2]Région:5:=$reg
			Init_Pop_Region([Cave:2]Pays:24)
			Self:C308->:=1
		End if 
		
		
	: (Self:C308->>3)
		Kle_Langue
		
		[Cave:2]Région:5:=Self:C308->{Self:C308->}
		QUERY:C277([Region:9]; V_L_region->=[Cave:2]Région:5; *)
		QUERY:C277([Region:9];  & ; [Region:9]Ref_Pays:10=[Cave:2]Ref_Pays:27)
		[Cave:2]Ref_Region:28:=[Region:9]Ref_Region:1
		pop_Region:=1
		
End case 