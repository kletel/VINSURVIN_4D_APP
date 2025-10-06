$n:=Records in set:C195("UserSet")
If ($n=0)
	ALERT:C41(Get indexed string:C510(<>strlang; 178))
Else 
	If ($n=1)
		CONFIRM:C162(Get indexed string:C510(<>strlang; 179))
	Else 
		CONFIRM:C162(Get indexed string:C510(<>strlang; 180)+String:C10($n)+Get indexed string:C510(<>strlang; 181))
	End if 
	If (OK=1)
		CREATE SET:C116(Current form table:C627->; "saved")
		COPY SET:C600("UserSet"; "GlobSet")
		DIFFERENCE:C122("saved"; "GlobSet"; "saved")
		USE SET:C118("UserSet")
		DELETE SELECTION:C66(Current form table:C627->)
		USE SET:C118("saved")
		CLEAR SET:C117("saved")
		CLEAR SET:C117("GlobSet")
	End if 
End if 