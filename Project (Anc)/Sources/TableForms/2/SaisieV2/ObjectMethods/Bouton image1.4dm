Kle_Confirmer(Get indexed string:C510(<>strLang; 141))
If (ok=1)
	If (<>Flag_demo=True:C214)
		SET QUERY DESTINATION:C396(Vers variable:K19:4; $nb)
		QUERY:C277([Cave:2]; [Cave:2]Nom:1="@")
		SET QUERY DESTINATION:C396(Vers sélection courante:K19:1)
		If ($nb>=15)
			Kle_Alerte(Get indexed string:C510(<>strlang; 187))
			CANCEL:C270
		End if 
		
	Else 
		
		SAVE RECORD:C53([Cave:2])
		
		DUPLICATE RECORD:C225([Cave:2])
		[Cave:2]Ref_Cave:26:=0
	End if 
	
	
End if 