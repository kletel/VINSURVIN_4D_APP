Kle_Confirmer(Get indexed string:C510(<>strLang; 140))
If (ok=1)
	DELETE RECORD:C58([Cave:2])
End if 
UNLOAD RECORD:C212([Cave:2])
ACCEPT:C269