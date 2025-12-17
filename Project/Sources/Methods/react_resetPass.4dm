//%attributes = {"publishedWeb":true}
ARRAY TEXT:C222($tVnom; 0)
ARRAY TEXT:C222($tVal; 0)
WEB GET VARIABLES:C683($tVnom; $tVal)


// Entrée : token reçu dans l'URL
C_TEXT:C284($tokenURL; $tokenHash)
$uuidTemp:=KST_web_Lire_param(->$tVnom; ->$tVal; "token")
$nouveauPass:=KST_web_Lire_param(->$tVnom; ->$tVal; "pass")
var $utilisateur : cs:C1710.UtilisateurEntity
$utilisateur:=ds:C1482.Utilisateur.query("UUID_temporaire=:1"; $uuidTemp).first()

If ($utilisateur#Null:C1517)
	// Vérification de l'expiration
	If ($utilisateur.DateExpiration=Current date:C33(*)) & ($utilisateur.HeureExpiration>Current time:C178(*))
		$utilisateur.MotDePasse:=$nouveauPass
		$utilisateur.save()
		$obj:=New object:C1471("entete"; "succes"; "message"; "Mot de passe modifié avec succès !")
	Else 
		$obj:=New object:C1471("entete"; "echec"; "message"; "Le lien a expiré.")
	End if 
Else 
	$obj:=New object:C1471("entete"; "echec"; "message"; "Le lien est invalide..")
End if 
$resp:=JSON Stringify:C1217($obj)XML DECODE:C1091
WEB SEND TEXT:C677($resp; "application/json")