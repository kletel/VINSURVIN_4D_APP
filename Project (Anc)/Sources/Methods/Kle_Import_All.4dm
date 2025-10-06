//%attributes = {}
$chemin:=Select folder:C670("Dossier de restauration des données")
If ($chemin#"")
	
	For (i; 1; Get last table number:C254)
		$Ref:=New process:C317("Kle_Import_Table"; 32000; "Import "+Table name:C256(i); i; $chemin+Table name:C256(i)+".Exp")
	End for 
End if 
