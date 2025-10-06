//%attributes = {}
$chemin:=Select folder:C670("Dossier de sauvegarde des données")
If ($chemin#"")
	
	For (i; 1; Get last table number:C254)
		$Ref:=New process:C317("Kle_export_Table"; 32000; "Export "+Table name:C256(i); i; $chemin)
	End for 
End if 
