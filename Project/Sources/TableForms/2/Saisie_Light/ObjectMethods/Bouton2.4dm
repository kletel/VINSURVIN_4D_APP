Kle_Confirmer(Get indexed string:C510(<>strLang; 140))
If (ok=1)
	DELETE RECORD:C58([Degustation:12])
	QUERY:C277([Degustation:12]; [Degustation:12]Ref_Cave:7=[Cave:2]Ref_Cave:26)
End if 
