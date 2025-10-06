$rep:=Kle_Demander(Get indexed string:C510(<>strLang; 131))
If (Ok=1)
	QUERY:C277([Vocabulaire:5]; [Vocabulaire:5]Nom:1="@"+$rep+"@")
	ORDER BY:C49([Vocabulaire:5]Nom:1; >)
	SELECTION TO ARRAY:C260([Vocabulaire:5]Nom:1; Lst)
	Txt:=""
End if 