C_DATE:C307(x_Date)
C_TEXT:C284(B_Serie; x_Divers)
C_REAL:C285(x_Etat; x_Ref)

Verif_Code(->B_Serie; ->x_Etat; ->x_Ref; ->x_Date; ->x_Divers)

If (x_Etat=-1)
	Kle_Alerte(Get indexed string:C510(<>strlang; 183))
Else 
	Kle_Alerte(Get indexed string:C510(<>strlang; 184))
	QUERY:C277([Interface:1]; [Interface:1]Rubrique1:1="Serie")
	If (Records in selection:C76([Interface:1])=0)
		CREATE RECORD:C68([Interface:1])
	End if 
	[Interface:1]Serie:2:=B_Serie
	[Interface:1]Rubrique1:1:="Serie"
	SAVE RECORD:C53([Interface:1])
End if 