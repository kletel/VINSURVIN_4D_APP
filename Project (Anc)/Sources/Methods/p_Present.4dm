//%attributes = {}
If (<>Present#0)
	SHOW PROCESS:C325(<>Present)
	BRING TO FRONT:C326(<>Present)
Else 
	<>Present:=New process:C317("Proc_Present"; 128000; "Presentation")
	BRING TO FRONT:C326(<>Present)
End if 