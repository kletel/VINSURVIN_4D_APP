//%attributes = {"publishedWeb":true}
ARRAY TEXT:C222($tVnom; 0)
ARRAY TEXT:C222($tVal; 0)
WEB GET VARIABLES:C683($tVnom; $tVal)

var $uuid_user : Text
var $token : Text
C_OBJECT:C1216($resp; $objChamps)

$uuid_user:=KST_web_Lire_param(->$tVnom; ->$tVal; "UUID_user")
$token:=KST_web_Lire_param(->$tVnom; ->$tVal; "token")

var $verifToken : Object
$verifToken:=react_verifToken_Table($token)

If (Not:C34($verifToken.validate))
	$resp:=New object:C1471("error"; "Non authentifié")
Else 
	If ($uuid_user#"")
		$user:=ds:C1482.Utilisateur.query("UUID_ = :1"; $uuid_user).first()
		$user.Suppression:=True:C214
		$user.save()
	End if 
End if 

WEB SEND TEXT:C677(JSON Stringify:C1217(New object:C1471("entete"; "succes"; "message"; "Profil supprimé avec succes")); "application/json")
