Case of 
	: (Self:C308->=2)
		$pays:=Kle_Demander(Get indexed string:C510(<>strLang; 52))  // Demande du pays a ajouter
		
		If (Ok=1)
			CREATE RECORD:C68([Pays:8])
			[Pays:8]Nom_Fr:3:=$pays
			SAVE RECORD:C53([Pays:8])
			[Cave:2]Ref_Pays:27:=[Pays:8]Ref_Pays:1
			[Cave:2]Pays:24:=$pays
			Init_Pop_Region($pays)
			Init_Pop_Pays
		End if 
		
	: (Self:C308->>3)
		Kle_Langue
		
		[Cave:2]Pays:24:=Self:C308->{Self:C308->}
		QUERY:C277([Pays:8]; V_L_pays->=Self:C308->{Self:C308->})
		[Cave:2]Ref_Pays:27:=[Pays:8]Ref_Pays:1
		Init_Pop_Region(Self:C308->{Self:C308->})
		
End case 
Self:C308->:=1
