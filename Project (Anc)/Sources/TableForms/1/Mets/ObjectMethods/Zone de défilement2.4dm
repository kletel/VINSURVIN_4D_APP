If (cat="")
	QUERY:C277([Association:7]; [Association:7]Categorie:1="@"; *)
Else 
	QUERY:C277([Association:7]; [Association:7]Categorie:1=Cat; *)
End if 
QUERY:C277([Association:7];  & [Association:7]Met:3=Lst{Lst}; *)
QUERY:C277([Association:7];  & ; [Association:7]Langue:5=<>LangueInitiale)
FIRST RECORD:C50([Association:7])
Txt:=""

While (Not:C34(End selection:C36([Association:7])))
	Txt:=Txt+[Association:7]Vin:4+Char:C90(13)
	NEXT RECORD:C51([Association:7])
End while 
