
MESSAGES OFF:C175

QUERY:C277([Cave:2]; [Cave:2]Nom:1="@"; *)
For (i; 1; Size of array:C274(Z_Rech_1))
	If (Z_Rech_1_1{i}>0) & (Z_Rech_2_1{i}>0)
		
		//Determination du nom du champ
			
		If (Z_Rech_1_1{i}>0)
			$NomChamp:=Z_Rech_1_1{i}
		Else 
			$NomChamp:=0
		End if 
		
		If ($NomChamp=9) | ($NomChamp=7) | ($NomChamp=8) | ($NomChamp=15) | ($NomChamp=16) | ($NomChamp=17) | ($NomChamp=19)
			//Numérique
				
			Case of 
				: (Z_Rech_2_1{i}=1)
					QUERY:C277([Cave:2];  & ; Field:C253(2; $NomChamp)->=Num:C11(Z_Rech_3{i}); *)
				: (Z_Rech_2_1{i}=2)
					QUERY:C277([Cave:2];  & ; Field:C253(2; $NomChamp)->#Num:C11(Z_Rech_3{i}); *)
				: (Z_Rech_2_1{i}=3)
					QUERY:C277([Cave:2];  & ; Field:C253(2; $NomChamp)->>Num:C11(Z_Rech_3{i}); *)
				: (Z_Rech_2_1{i}=4)
					QUERY:C277([Cave:2];  & ; Field:C253(2; $NomChamp)->>=Num:C11(Z_Rech_3{i}); *)
				: (Z_Rech_2_1{i}=5)
					QUERY:C277([Cave:2];  & ; Field:C253(2; $NomChamp)-><Num:C11(Z_Rech_3{i}); *)
				: (Z_Rech_2_1{i}=6)
					QUERY:C277([Cave:2];  & ; Field:C253(2; $NomChamp)-><=Num:C11(Z_Rech_3{i}); *)
			End case 
			
		Else 
			
			If ($NomChamp=10)
				//Date       
					
				Case of 
					: (Z_Rech_2_1{i}=1)
						QUERY:C277([Cave:2];  & ; Field:C253(2; $NomChamp)->=Date:C102(Z_Rech_3{i}); *)
					: (Z_Rech_2_1{i}=2)
						QUERY:C277([Cave:2];  & ; Field:C253(2; $NomChamp)->#Date:C102(Z_Rech_3{i}); *)
					: (Z_Rech_2_1{i}=3)
						QUERY:C277([Cave:2];  & ; Field:C253(2; $NomChamp)->>Date:C102(Z_Rech_3{i}); *)
					: (Z_Rech_2_1{i}=4)
						QUERY:C277([Cave:2];  & ; Field:C253(2; $NomChamp)->>=Date:C102(Z_Rech_3{i}); *)
					: (Z_Rech_2_1{i}=5)
						QUERY:C277([Cave:2];  & ; Field:C253(2; $NomChamp)-><Date:C102(Z_Rech_3{i}); *)
					: (Z_Rech_2_1{i}=6)
						QUERY:C277([Cave:2];  & ; Field:C253(2; $NomChamp)-><=Date:C102(Z_Rech_3{i}); *)
				End case 
			Else 
				//Chaine   
					
				Case of 
					: (Z_Rech_2_1{i}=1)
						QUERY:C277([Cave:2];  & ; Field:C253(2; $NomChamp)->=Z_Rech_3{i}; *)
					: (Z_Rech_2_1{i}=2)
						QUERY:C277([Cave:2];  & ; Field:C253(2; $NomChamp)->#Z_Rech_3{i}; *)
					: (Z_Rech_2_1{i}=3)
						QUERY:C277([Cave:2];  & ; Field:C253(2; $NomChamp)->>Z_Rech_3{i}; *)
					: (Z_Rech_2_1{i}=4)
						QUERY:C277([Cave:2];  & ; Field:C253(2; $NomChamp)->>=Z_Rech_3{i}; *)
					: (Z_Rech_2_1{i}=5)
						QUERY:C277([Cave:2];  & ; Field:C253(2; $NomChamp)-><Z_Rech_3{i}; *)
					: (Z_Rech_2_1{i}=6)
						QUERY:C277([Cave:2];  & ; Field:C253(2; $NomChamp)-><Z_Rech_3{i}; *)
					: (Z_Rech_2_1{i}=7)
						QUERY:C277([Cave:2];  & ; Field:C253(2; $NomChamp)->="@"+Z_Rech_3{i}+"@"; *)
					: (Z_Rech_2_1{i}=8)
						QUERY:C277([Cave:2];  & ; Field:C253(2; $NomChamp)-><"@"+Z_Rech_3{i}+"@"; *)
				End case 
			End if 
		End if 
	End if 
	
End for 
QUERY:C277([Cave:2])
CANCEL:C270


ORDER BY:C49([Cave:2]; [Cave:2]Nom:1; >)
calcul_Valeure