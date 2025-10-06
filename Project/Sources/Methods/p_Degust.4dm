//%attributes = {}
$process:=Process number:C372("Dégustation")

If ($process#0)
	SHOW PROCESS:C325($process)
	BRING TO FRONT:C326($process)
Else 
	$process:=New process:C317("Proc_Degustation"; 512000; "Dégustation")
	BRING TO FRONT:C326($process)
End if 