//%attributes = {}
$process:=Process number:C372("Producteur")

If ($process#0)
	SHOW PROCESS:C325($process)
	BRING TO FRONT:C326($process)
Else 
	$process:=New process:C317("Proc_Producteur"; 128000; "Producteur")
	BRING TO FRONT:C326($process)
End if 