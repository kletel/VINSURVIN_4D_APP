$App:=Conv_App([Cave:2]Appellation:2)
QUERY:C277([Association:7]; [Association:7]Vin:4="@"+$App+"@")
If (Records in selection:C76([Association:7])>0)
	
	SELECTION TO ARRAY:C260([Association:7]Met:3; V_T_Met)
	SELECTION TO ARRAY:C260([Association:7]Vin:4; V_T_Vin)
	$ref:=Open form window:C675([Interface:1]; "Associations")
	DIALOG:C40([Interface:1]; "Associations")
	
Else 
	Kle_Alerte(Get indexed string:C510(<>strlang; 185))
End if 
