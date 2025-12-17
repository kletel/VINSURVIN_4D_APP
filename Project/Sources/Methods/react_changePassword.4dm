//%attributes = {}
var $user : cs:C1710.UtilisateurEntity
var $body : Object
var $current; $new : Text

$body:=JSON Parse:C1218(WEB GET BODY)
$current:=$body.currentPassword
$new:=$body.newPassword

$user:=GetUserFromJWT()

If ($user#Null:C1517)
	If (Do_VerifyPassword($current; $user.MotDePasse))
		If (Length:C16($new)>=10)
			$user.MotDePasse:=Do_HashPassword($new)
			$user.save()
			$resp:=New object:C1471("entete"; "succes"; "message"; "Mot de passe modifié.")
		Else 
			$resp:=New object:C1471("entete"; "echec"; "message"; "Mot de passe trop faible.")
		End if 
	Else 
		$resp:=New object:C1471("entete"; "echec"; "message"; "Mot de passe actuel incorrect.")
	End if 
Else 
	$resp:=New object:C1471("entete"; "echec"; "message"; "Non authentifié.")
End if 

WEB SEND TEXT:C677(JSON Stringify:C1217($resp); "application/json")
