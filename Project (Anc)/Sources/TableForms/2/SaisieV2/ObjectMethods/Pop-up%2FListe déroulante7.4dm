
Case of 
		
	: (Form event code:C388=Sur chargement:K2:1)
		Init_Pop_Couleur
		
	: (Form event code:C388=Sur clic:K2:4)
		If (pop_Coul>=2)
			[Cave:2]Couleur:54:=pop_Coul{pop_Coul}
			pop_Coul:=1
		End if 
		
	: (Form event code:C388=Sur double clic:K2:5)
		LOAD RECORD:C52()
		
	: (Form event code:C388=Sur nouvelle sélection:K2:29)
		LOAD RECORD:C52()
		
		
End case 



