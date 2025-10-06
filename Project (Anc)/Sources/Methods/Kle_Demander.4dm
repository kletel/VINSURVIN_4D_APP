//%attributes = {}
V_Titre:=$1
V_Saisie:=""
$ref:=Open form window:C675([Interface:1]; "Kle_Demander"; Form dialogue modal déplaçable:K39:8)
DIALOG:C40([Interface:1]; "Kle_Demander")
If (Ok=1)
	$0:=V_Saisie
Else 
	$0:=""
End if 

