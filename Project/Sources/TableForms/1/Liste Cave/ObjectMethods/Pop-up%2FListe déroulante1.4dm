Case of 
	: (Self:C308->=1)
		$rep:=Kle_Demander(Get indexed string:C510(<>strLang; 157))
		If (ok=1)
			INSERT IN ARRAY:C227(pop_Cave; Size of array:C274(pop_Cave)+1; 1)
			pop_Cave{Size of array:C274(pop_Cave)}:=$rep
			<>CategorieCave:=$rep
			pop_Cave:=Size of array:C274(pop_Cave)
			
			INSERT IN ARRAY:C227(pop_Cave2; Size of array:C274(pop_Cave2)+1; 1)
			pop_Cave2{Size of array:C274(pop_Cave2)}:=$rep
			<>CategorieCave:=$rep
			pop_Cave2:=Size of array:C274(pop_Cave2)
			
			QUERY:C277([Cave:2]; [Cave:2]Cave:40=<>CategorieCave)
			ORDER BY:C49([Cave:2]; [Cave:2]Nom:1; >)
			calcul_Valeure
		End if 
		
	: (Self:C308->=2)
		Kle_Confirmer(Get indexed string:C510(<>strlang; 194))
		If (Ok=1)
			QUERY:C277([Cave:2]; [Cave:2]Cave:40=<>CategorieCave)
			DELETE SELECTION:C66([Cave:2])
			DELETE FROM ARRAY:C228(pop_Cave; pop_Cave; 1)
			
			MESSAGES OFF:C175
			ALL RECORDS:C47([Cave:2])
			ORDER BY:C49([Cave:2]; [Cave:2]Cave:40; >)
			DISTINCT VALUES:C339([Cave:2]Cave:40; Pop_Cave)
			DISTINCT VALUES:C339([Cave:2]Cave:40; Pop_Cave2)
			
			INSERT IN ARRAY:C227(Pop_Cave; 1; 3)
			Pop_Cave{1}:=Get indexed string:C510(<>strLang; 278)
			Pop_Cave{2}:=Get indexed string:C510(<>strLang; 279)
			Pop_Cave{3}:="-"
			MESSAGES OFF:C175
			//TOUT SELECTIONNER([Cave])
			If (Size of array:C274(Pop_Cave)>3)
				QUERY:C277([Cave:2]; [Cave:2]Cave:40=Pop_Cave{4})
				Pop_Cave:=4
				<>CategorieCave:=Pop_Cave{Pop_Cave}
			Else 
				INSERT IN ARRAY:C227(Pop_Cave; 4; 1)
				Pop_Cave{4}:=Get indexed string:C510(<>strLang; 156)
				Pop_Cave:=4
				<>CategorieCave:=Pop_Cave{Pop_Cave}
				ALL RECORDS:C47([Cave:2])
			End if 
			
			QUERY:C277([Cave:2]; [Cave:2]Cave:40=<>CategorieCave)
			
			ORDER BY:C49([Cave:2]; [Cave:2]Nom:1; >)
			calcul_Valeure
			
		End if 
		
	: (Self:C308->=3)
		$rep:=Kle_Demander(Get indexed string:C510(<>strLang; 344))
		If (ok=1)
			Pop_Cave:=Find in array:C230(Pop_Cave; <>CategorieCave)
			pop_Cave{pop_Cave}:=$rep
			QUERY:C277([Cave:2]; [Cave:2]Cave:40=<>CategorieCave)
			If (Records in selection:C76([Cave:2])>0)
				FIRST RECORD:C50([Cave:2])
				
				Repeat 
					[Cave:2]Cave:40:=$rep
					SAVE RECORD:C53([Cave:2])
					NEXT RECORD:C51([Cave:2])
				Until (End selection:C36([Cave:2]))
			End if 
			QUERY:C277([Interface:1]; [Interface:1]Rubrique1:1="Cave_Defaut")
			If (Records in selection:C76([Interface:1])=1)
				[Interface:1]cavedefaut:8:=$rep
				SAVE RECORD:C53([Interface:1])
			End if 
			
			<>CategorieCave:=$rep
			//CHERCHER([Cave];[Cave]Cave=◊CategorieCave)
			//TRIER([Cave];[Cave]Nom;>)
			//calcul_Valeure 
			[Cave:2]Cave:40:=<>CategorieCave
		End if 
	: (Self:C308->>4)
		<>CategorieCave:=Self:C308->{Self:C308->}
		QUERY:C277([Cave:2]; [Cave:2]Cave:40=<>CategorieCave)
		ORDER BY:C49([Cave:2]; [Cave:2]Nom:1; >)
		QUERY:C277([Interface:1]; [Interface:1]Rubrique1:1="Cave_Defaut"; *)
		QUERY:C277([Interface:1];  & ; [Interface:1]cavedefaut:8=Pop_Cave{Pop_Cave})
		If (Records in selection:C76([Interface:1])=1)
			cochecavedefaut:=1
		Else 
			cochecavedefaut:=0
		End if 
		Cave_Init_enum
		calcul_Valeure
End case 
