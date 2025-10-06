//%attributes = {}
// Boucle d'attente

C_REAL:C285($1)  //temps en secondes à endormir le process
C_TIME:C306($vv_h1)  //heure à attendre
_O_C_INTEGER:C282($vv_i)  //compteur de boucle

If (Current process:C322=1)  //process principal
	If ($1>1)
		$vv_h1:=Current time:C178+$1
		Repeat 
			$vv_i:=$vv_i+1
			IDLE:C311
		Until (Current time:C178>$vv_h1)
	Else 
		For ($vv_i; 1; 100)
			$vv_h1:=$vv_h1+1
			IDLE:C311
		End for 
	End if 
Else 
	DELAY PROCESS:C323(Current process:C322; Int:C8($1*60))
End if 