//%attributes = {}
$process:=Process number:C372("Association Mets-Vins")
If ($process#0)
	SHOW PROCESS:C325($process)
	BRING TO FRONT:C326($process)
Else 
	$process:=New process:C317("Proc_Mets"; 128000; "Association Mets-Vins")
	BRING TO FRONT:C326($process)
End if 