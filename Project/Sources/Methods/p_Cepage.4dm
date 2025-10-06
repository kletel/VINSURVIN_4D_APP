//%attributes = {}
$rep:=Process number:C372("Les cépages")
If ($rep#0)
	SHOW PROCESS:C325($rep)
	BRING TO FRONT:C326($rep)
Else 
	$rep:=New process:C317("Proc_Cepage"; 64000; "Les cépages")
	BRING TO FRONT:C326($rep)
End if 