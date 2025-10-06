If (<>ModeUtilisation=0)
	Kle_Confirmer(Get indexed string:C510(<>strlang; 195)+Char:C90(13)+Get indexed string:C510(<>strlang; 196))
	If (Ok=1)
		Mode_Expert
		p_Vos_Degust
	End if 
Else 
	p_Vos_Degust
End if 
