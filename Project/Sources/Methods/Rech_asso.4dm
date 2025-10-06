//%attributes = {}
If (Substring:C12($1; 1; 1)="*")
	QUERY:C277([Association:7]; [Association:7]Sous_Categorie:2=Substring:C12($1; 2); *)
	QUERY:C277([Association:7];  & ; [Association:7]Langue:5=<>LangueInitiale)
	
Else 
	QUERY:C277([Association:7]; [Association:7]Categorie:1=$1; *)
	QUERY:C277([Association:7];  & ; [Association:7]Langue:5=<>LangueInitiale)
End if 

ORDER BY:C49([Association:7]Sous_Categorie:2; >; [Association:7]Met:3; >)
FIRST RECORD:C50([Association:7])
$Anc:=""

If (Size of array:C274(Lst)>0)
	DELETE FROM ARRAY:C228(Lst; 1; Size of array:C274(Lst))
	DELETE FROM ARRAY:C228(Lst1; 1; Size of array:C274(Lst1))
End if 
While (Not:C34(End selection:C36([Association:7])))
	If ($Anc#[Association:7]Met:3)
		INSERT IN ARRAY:C227(Lst1; Size of array:C274(Lst1)+1; 1)
		INSERT IN ARRAY:C227(Lst; Size of array:C274(Lst)+1; 1)
		Lst{Size of array:C274(Lst)}:=[Association:7]Met:3
		Lst1{Size of array:C274(Lst1)}:=[Association:7]Sous_Categorie:2
		$Anc:=[Association:7]Met:3
	End if 
	NEXT RECORD:C51([Association:7])
End while 
Lst:=0
Lst1:=0
Txt:=""