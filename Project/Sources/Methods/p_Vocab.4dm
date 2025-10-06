//%attributes = {}
$process:=Process number:C372("Vocabulaire")
If ($process#0)
	SHOW PROCESS:C325($process)
	BRING TO FRONT:C326($process)
Else 
	$process:=New process:C317("Proc_Vocab"; 128000; "Vocabulaire")
	BRING TO FRONT:C326($process)
End if 