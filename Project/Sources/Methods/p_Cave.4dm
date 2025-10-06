//%attributes = {}
$rep:=Process number:C372("Gestion de la Cave")
If ($rep#0)
	SHOW PROCESS:C325($rep)
	BRING TO FRONT:C326($rep)
Else 
	$rep:=New process:C317("Proc_Cave"; 512000; "Gestion de la Cave")
	BRING TO FRONT:C326($rep)
End if 