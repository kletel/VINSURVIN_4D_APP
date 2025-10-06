//%attributes = {"publishedWeb":true}
ARRAY TEXT:C222($tVnom; 0)
ARRAY TEXT:C222($tVal; 0)
WEB GET VARIABLES:C683($tVnom; $tVal)

$uuid_user:=KST_web_Lire_param(->$tVnom; ->$tVal; "UUID_User")
$uuid_met:=KST_web_Lire_param(->$tVnom; ->$tVal; "UUID_Met")
$action:=KST_web_Lire_param(->$tVnom; ->$tVal; "action")
$boolValue:=C_BOOLEAN:C305(KST_web_Lire_param(->$tVnom; ->$tVal; "bool"))

$token:=KST_web_Lire_param(->$tVnom; ->$tVal; "token")
$verifToken:=react_verifToken_K($token)

If ($verifToken.validate)
	$RecetteUser:=ds:C1482.Recette_Utilisateur.query("UUID_Utilisateur=:1 and UUID_Recette =:2"; $uuid_user; $uuid_met)
	If ($RecetteUser.length>0)
		$RecetteUserEntity:=ds:C1482.Recette_Utilisateur.query("UUID_Utilisateur=:1 and UUID_Recette =:2"; $uuid_user; $uuid_met).first()
	Else 
		$RecetteUserEntity:=ds:C1482.Recette_Utilisateur.new()
	End if 
	$RecetteUserEntity.UUID_Utilisateur:=$uuid_user
	$RecetteUserEntity.UUID_Recette:=$uuid_met
	
	If ($action="favori")
		$RecetteUserEntity.Favori:=$boolValue
	End if 
	If ($action="enregistrer")
		$RecetteUserEntity.Enregistrer:=$boolValue
	End if 
	
	If (($RecetteUserEntity.imageBase64="") || ($RecetteUserEntity.imageBase64=Null:C1517))
		$recette:=ds:C1482.Recette.query("UUID_ =:1"; $uuid_met).first()
		$RecetteUserEntity.imageBase64:=$recette.imageBase64
	End if 
	$RecetteUserEntity.save()
	
	
	
	$obj:=New object:C1471("entete"; "succes")
	//$obj:=Créer objet("entete"; "succes"; "msg"; $UUIDuser; "nomUser"; $nomUser)
	$resp:=JSON Stringify:C1217($obj)
	WEB SEND TEXT:C677($resp; "application/json")
End if 