If (Size of array:C274(Z_Rech_1_1)>1)
	DELETE FROM ARRAY:C228(Z_Rech_1_1; po; 1)
	DELETE FROM ARRAY:C228(Z_Rech_2_1; po; 1)
	DELETE FROM ARRAY:C228(Z_Rech_1; po; 1)
	DELETE FROM ARRAY:C228(Z_Rech_2; po; 1)
	DELETE FROM ARRAY:C228(Z_Rech_3; po; 1)
	po:=po-1
	If (po<1)
		po:=1
	End if 
	
	Z_Rech_1:=po
	Z_Rech_2:=po
	Z_Rech_3:=po
End if 
