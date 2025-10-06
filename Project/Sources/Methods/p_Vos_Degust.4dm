//%attributes = {}
$process:=Process number:C372("Vos_Degust")

If ($process#0)
	SHOW PROCESS:C325($process)
	BRING TO FRONT:C326($process)
Else 
	$process:=New process:C317("Proc_Vos_Degust"; 128000; "Vos_Degust")
	BRING TO FRONT:C326($process)
End if 