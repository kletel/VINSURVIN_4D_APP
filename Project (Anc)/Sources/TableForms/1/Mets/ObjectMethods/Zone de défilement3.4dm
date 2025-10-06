
v_ref:=Selected list items:C379(Self:C308->)
GET LIST ITEM:C378(Self:C308->; V_Ref; V_Ref_U; $Libelle)
If (V_Ref_U>0)
	cat:=$Libelle
	Rech_asso(Cat)
Else 
	If (V_Ref_U=-9999)
		$ref:=Kle_Demander(Get indexed string:C510(<>strLang; 133)+" :")
		If (Ok=1)
			cat:=""
			QUERY:C277([Association:7]; [Association:7]Vin:4="@"+$ref+"@"; *)
			QUERY:C277([Association:7];  & ; [Association:7]Langue:5=<>LangueInitiale)
			If (Records in selection:C76([Association:7])>0)
				
				ORDER BY:C49([Association:7]Sous_Categorie:2; >; [Association:7]Met:3; >)
				FIRST RECORD:C50([Association:7])
				$Anc:=""
				
				SELECTION TO ARRAY:C260([Association:7]Met:3; Lst)
				
				SELECTION TO ARRAY:C260([Association:7]Sous_Categorie:2; Lst1)
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
			Else 
				Kle_Alerte(Get indexed string:C510(<>strLang; 134))
			End if 
		End if 
	Else 
		cat:="*"+$Libelle
		Rech_asso(Cat)
	End if 
End if 
