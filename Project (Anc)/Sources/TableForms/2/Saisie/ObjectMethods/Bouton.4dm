ARRAY PICTURE:C279(Lst_Od_AR1; 0)
_O_ARRAY STRING:C218(80; Lst_Od_AR2; 0)
ARRAY LONGINT:C221(Lst_Od_AR3; 0)
ARRAY BOOLEAN:C223(Lst_Od_AR; 0)
ALL RECORDS:C47([Odeur_Aromes:21])
DISTINCT VALUES:C339([Odeur_Aromes:21]Titre:2; $titre)
SORT ARRAY:C229($titre; >)
LstH_OD_AR:=New list:C375
For ($i; 1; Size of array:C274($titre))
	QUERY:C277([Odeur_Aromes:21]; [Odeur_Aromes:21]Titre:2=$Titre{$i})
	ORDER BY:C49([Odeur_Aromes:21]Nom:1; >)
	//AJOUTER A LISTE(
	
	//AJOUTER A LISTE(LstH_OD_AR
	
	ORDER BY:C49([Odeur_Aromes:21]Titre:2; >; [Odeur_Aromes:21]Nom:1; >)
	$Ti:=""
	FIRST RECORD:C50([Odeur_Aromes:21])
	
	
	
	While (Not:C34(End selection:C36([Odeur_Aromes:21])))
		$ligne:=Size of array:C274(Lst_Od_AR1)+1
		If ($Ti#[Odeur_Aromes:21]Titre:2)
			LISTBOX INSERT ROWS:C913(Lst_Od_AR; $ligne)
			Lst_Od_AR2{$ligne}:=[Odeur_Aromes:21]Titre:2
			Lst_Od_AR_Fond{$ligne}:=0x00C01839
			$Ti:=[Odeur_Aromes:21]Titre:2
		End if 
		
		$ligne:=Size of array:C274(Lst_Od_AR1)+1
		LISTBOX INSERT ROWS:C913(Lst_Od_AR; $ligne)
		Lst_Od_AR2{$ligne}:=[Odeur_Aromes:21]Nom:1
		
		NEXT RECORD:C51([Odeur_Aromes:21])
	End while 
End for 