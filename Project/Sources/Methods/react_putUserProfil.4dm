//%attributes = {"publishedWeb":true}
ARRAY TEXT:C222($tVnom; 0)
ARRAY TEXT:C222($tVal; 0)
WEB GET VARIABLES:C683($tVnom; $tVal)

var $uuid_user : Text
var $token : Text
var $champsModifJSON : Text
var $user : cs:C1710.UtilisateurEntity
C_OBJECT:C1216($resp; $objChamps)

$uuid_user:=KST_web_Lire_param(->$tVnom; ->$tVal; "UUID_user")
$token:=KST_web_Lire_param(->$tVnom; ->$tVal; "token")
$champsModifJSON:=KST_web_Lire_param(->$tVnom; ->$tVal; "champsModif")

var $verifToken : Object
$verifToken:=react_verifToken_Table($token)

If (Not:C34($verifToken.validate))
	$resp:=New object:C1471("error"; "Non authentifié")
Else 
	If ($uuid_user#"")
		$user:=ds:C1482.Utilisateur.query("UUID_ = :1"; $uuid_user).first()
	End if 
	
	If ($user#Null:C1517)
		$objChamps:=JSON Parse:C1218($champsModifJSON)
		
		If (OB Is defined:C1231($objChamps; "Prenom"))
			$user.Prenom:=$objChamps.Prenom
		End if 
		If (OB Is defined:C1231($objChamps; "Nom"))
			$user.Nom:=$objChamps.Nom
		End if 
		If (OB Is defined:C1231($objChamps; "Email"))
			$user.EMail:=$objChamps.Email
		End if 
		If (OB Is defined:C1231($objChamps; "Telephone"))
			$user.Telephone:=$objChamps.Telephone
		End if 
		If (OB Is defined:C1231($objChamps; "Societe"))
			$user.Societe:=$objChamps.Societe
		End if 
		If (OB Is defined:C1231($objChamps; "Adresse"))
			$user.Adresse1:=$objChamps.Adresse
		End if 
		If (OB Is defined:C1231($objChamps; "CodePostal"))
			$user.CodePostal:=$objChamps.CodePostal
		End if 
		If (OB Is defined:C1231($objChamps; "Etat"))
			$user.Etat:=$objChamps.Etat
		End if 
		If (OB Is defined:C1231($objChamps; "Pays"))
			$user.Pays:=$objChamps.Pays
		End if 
		If (OB Is defined:C1231($objChamps; "Ville"))
			$user.Ville:=$objChamps.Ville
		End if 
		If (OB Is defined:C1231($objChamps; "NumLicence"))
			$user.NumLicence:=$objChamps.NumLicence
		End if 
		If (OB Is defined:C1231($objChamps; "RemarqueProfile"))
			$user.RemarqueProfile:=$objChamps.RemarqueProfile
		End if 
		
		$user.save()
		
		$resp:=New object:C1471("UUID"; $user.UUID_; "Prenom"; $user.Prenom; "Nom"; $user.Nom; "Email"; $user.EMail; "Societe"; $user.Societe; "Adresse"; $user.Adresse1; "CodePostal"; $user.CodePostal; "Etat"; $user.Etat; "Pays"; $user.Pays; "Ville"; $user.Ville; "NumLicence"; $user.NumLicence; "RemarqueProfile"; $user.RemarqueProfile; "Telephone"; $user.Telephone)
	Else 
		$resp:=New object:C1471("error"; "Utilisateur introuvable")
	End if 
End if 

WEB SEND TEXT:C677(JSON Stringify:C1217($resp); "application/json")
