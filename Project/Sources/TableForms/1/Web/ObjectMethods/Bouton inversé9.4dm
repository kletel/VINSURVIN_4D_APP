If (V_Sites>0)
	$ref:=Open form window:C675([Sites:15]; "Entrée")
	MODIFY RECORD:C57([Sites:15]; *)
	V_Texte:=[Sites:15]Texte:3
End if 
