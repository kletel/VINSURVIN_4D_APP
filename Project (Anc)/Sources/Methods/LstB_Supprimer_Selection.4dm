//%attributes = {}
For ($i; 1; Size of array:C274(Get pointer:C304($2)->))
	If (Get pointer:C304($2)->{$i}=True:C214)
		QUERY:C277($1->; Field:C253(Table:C252($1); 1)->=Get pointer:C304($2+"1")->{$i})
		If (Records in selection:C76($1->)=1)
			DELETE SELECTION:C66($1->)
		Else 
			ALERT:C41("Err")
		End if 
	End if 
End for 
QUERY WITH ARRAY:C644(Field:C253(Table:C252($1); 1)->; Get pointer:C304($2+"1")->)
LstB_Affiche_Selection(->[Cave:2]; "Colonne")
//
//Boucle ($i;1;Nombre de champs(Table($1)))
//SELECTION VERS TABLEAU(Champ(Table($1);$i)->;Pointeur vers($2+Chaine($i))->)
//Fin de boucle 
