If (cat="")
	QUERY:C277([Association:7]; [Association:7]Categorie:1="@"; *)
Else 
	If (Substring:C12(Cat; 1; 1)="*")
		QUERY:C277([Association:7]; [Association:7]Sous_Categorie:2=Substring:C12(Cat; 2); *)
	Else 
		QUERY:C277([Association:7]; [Association:7]Categorie:1=Cat; *)
	End if 
End if 
QUERY:C277([Association:7];  & [Association:7]Met:3=Lst{Lst}; *)
QUERY:C277([Association:7];  & ; [Association:7]Langue:5=<>LangueInitiale)
FIRST RECORD:C50([Association:7])
Txt:=""

// Affichage des vins proposés 
While (Not:C34(End selection:C36([Association:7])))
	Txt:=Txt+[Association:7]Vin:4+Char:C90(13)
	NEXT RECORD:C51([Association:7])
End while 

// Affichage des vins en cave

SELECTION TO ARRAY:C260([Association:7]Vin:4; $Vins)
CREATE EMPTY SET:C140([Cave:2]; "Tmp")
For ($i; 1; Size of array:C274($Vins))
	QUERY:C277([Cave:2]; [Cave:2]Appellation:2="@"+Conv_App($Vins{$i})+"@")
	CREATE SET:C116([Cave:2]; "Tmp2")
	UNION:C120("Tmp"; "Tmp2"; "Tmp")
End for 
USE SET:C118("Tmp")

CLEAR SET:C117("Tmp")
CLEAR SET:C117("Tmp2")

Txt2:=""
FIRST RECORD:C50([Cave:2])
While (Not:C34(End selection:C36([Cave:2])))
	Txt2:=Txt2+[Cave:2]Nom:1+" - "+[Cave:2]Appellation:2+" - "+[Cave:2]Millesime:6+" - "+[Cave:2]Type:4+Char:C90(13)
	
	NEXT RECORD:C51([Cave:2])
End while 

