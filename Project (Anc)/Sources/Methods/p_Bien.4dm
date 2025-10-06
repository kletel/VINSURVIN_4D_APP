//%attributes = {}
$process:=Process number:C372("Bien_Gerer")

If ($process#0)
	SHOW PROCESS:C325($process)
	BRING TO FRONT:C326($process)
Else 
	$process:=New process:C317("Proc_Bien_Gerer"; 128000; "Bien_Gerer")
	BRING TO FRONT:C326($process)
End if 