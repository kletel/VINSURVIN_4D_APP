//%attributes = {"publishedWeb":true}
ARRAY TEXT:C222($tVnom; 0)
ARRAY TEXT:C222($tVal; 0)
WEB GET VARIABLES:C683($tVnom; $tVal)
var $uuid : Text
C_OBJECT:C1216($resp)
var $user : cs:C1710.UtilisateurEntity

$uuid:=KST_web_Lire_param(->$tVnom; ->$tVal; "UUID_user")

If ($uuid#"")
	$user:=ds:C1482.Utilisateur.query("UUID_ = :1"; $uuid).first()
End if 

If ($user#Null:C1517)
	$resp:=New object:C1471("UUID"; $user.UUID_; "Prenom"; $user.Prenom; "Nom"; $user.Nom; "Email"; $user.EMail; "Societe"; $user.Societe; "Adresse"; $user.Adresse1; "CodePostal"; $user.CodePostal; "Etat"; $user.Etat; "Pays"; $user.Pays; "Ville"; $user.Ville; "NumLicence"; $user.NumLicence; "RemarqueProfile"; $user.RemarqueProfile; "Telephone"; $user.Telephone)
Else 
	$resp:=New object:C1471("error"; "Non authentifié")
End if 

WEB SEND TEXT:C677(JSON Stringify:C1217($resp); "application/json")
