//%attributes = {}
$process:=Process number:C372("Millesimes")

If ($process#0)
	SHOW PROCESS:C325($process)
	BRING TO FRONT:C326($process)
Else 
	$process:=New process:C317("Proc_Millesimes"; 128000; "Millesimes")
	BRING TO FRONT:C326($process)
End if 