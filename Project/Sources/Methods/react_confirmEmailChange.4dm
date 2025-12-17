//%attributes = {"publishedWeb":true}
ARRAY TEXT:C222($tVnom; 0)
ARRAY TEXT:C222($tVal; 0)
WEB GET VARIABLES:C683($tVnom; $tVal)

var $token : Text
var $user : cs:C1710.UtilisateurEntity
C_OBJECT:C1216($resp)

$token:=KST_web_Lire_param(->$tVnom; ->$tVal; "token")

$user:=ds:C1482.Utilisateur.query("UUID_emailTemp=:1"; $token).first()

If ($user#Null:C1517)
	If ($user.DateEmailExpiration>=Current date:C33(*))
		$user.EMail:=$user.NewEmail
		$user.NewEmail:=Null:C1517
		$user.UUID_emailTemp:=Null:C1517
		$user.DateEmailExpiration:=Null:C1517
		$user.save()
		$resp:=New object:C1471("entete"; "succes"; "message"; "Adresse email mise à jour.")
	Else 
		$resp:=New object:C1471("entete"; "echec"; "message"; "Lien expiré.")
	End if 
Else 
	$resp:=New object:C1471("entete"; "echec"; "message"; "Lien invalide.")
End if 

WEB SEND TEXT:C677(JSON Stringify:C1217($resp); "application/json")
