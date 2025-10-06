$de:=Kle_Demander(Get indexed string:C510(<>strLang; 43)+" :")
If (Ok=1)
	QUERY SELECTION:C341([Appellation:3]; [Appellation:3]Pays:3="@"+$de+"@")
	ORDER BY:C49([Appellation:3]; [Appellation:3]Appellation:1; >)
	SELECTION TO ARRAY:C260([Appellation:3]Appellation:1; ZL1; [Appellation:3]Region:2; ZL2; [Appellation:3]Pays:3; ZL3)
End if 