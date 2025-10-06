//%attributes = {"publishedWeb":true}
ARRAY TEXT:C222($tVnom; 0)
ARRAY TEXT:C222($tVal; 0)
WEB GET VARIABLES:C683($tVnom; $tVal)

$uuidTemp:=KST_web_Lire_param(->$tVnom; ->$tVal; "uuidTemp")
$token:=KST_web_Lire_param(->$tVnom; ->$tVal; "token")
If ($uuidTemp#"")
	$user:=ds:C1482.Utilisateur.query("UUID_temporaire=:1"; $uuidTemp).first()
End if 

If (Not:C34(Undefined:C82($user)) || $user#Null:C1517)
	// Vérification de l'expiration
	If ($user.DateExpiration=Current date:C33(*)) & ($user.HeureExpiration>Current time:C178(*))
		$obj:=New object:C1471("entete"; "succes"; "uuidUser"; $user.UUID_; "nomUser"; $user.Nom)
		
	End if 
Else 
	$obj:=New object:C1471("entete"; "echec"; "message"; "Le lien est invalide..")
End if 
$resp:=JSON Stringify:C1217($obj)
WEB SEND TEXT:C677($resp; "application/json")