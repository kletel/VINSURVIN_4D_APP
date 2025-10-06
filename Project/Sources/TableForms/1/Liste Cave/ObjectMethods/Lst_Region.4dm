
Case of 
	: (Form event code:C388=Sur clic:K2:4)
		If (Self:C308->>0)
			If (Self:C308->=1)
				QUERY:C277([Cave:2]; [Cave:2]Cave:40=<>CategorieCave)
			Else 
				V_Cave_Init_Region:=Self:C308->{Self:C308->}
				QUERY SELECTION:C341([Cave:2]; [Cave:2]Région:5=V_Cave_Init_Region)
				
			End if 
			
			Cave_Init_enum
			calcul_Valeure
		End if 
End case 