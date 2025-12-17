//%attributes = {"publishedWeb":true}
ARRAY TEXT:C222($tVnom; 0)
ARRAY TEXT:C222($tVal; 0)
WEB GET VARIABLES:C683($tVnom; $tVal)

$deviceUUID:=KST_web_Lire_param(->$tVnom; ->$tVal; "deviceUUID")

If (Length:C16($deviceUUID)=0)
	WEB SEND TEXT:C677(JSON Stringify:C1217(New object:C1471("response"; "deviceUUID manquant")); "application/json")
	QUIT METHOD
End if 

var $uSel : cs:C1710.UtilisateurSelection
$uSel:=ds:C1482.Utilisateur.query("DeviceUUID = :1"; $deviceUUID)

If ($uSel.length>0)
	var $u : cs:C1710.UtilisateurEntity
	$u:=$uSel.first()
	
	C_TEXT:C284($nom; $prenom; $uuid_)
	$nom:=$u.Nom
	$prenom:=$u.Prenom
	$uuid_:=$u.UUID_
	
	var $payload; $param; $token; $resp : Object
	$payload:=New object:C1471("UUID_"; $uuid_; "Nom"; $nom; "Prenom"; $prenom)
	
	$param:=New object:C1471("payload"; $payload)
	If (Length:C16($deviceUUID)>0)
		$param.UUID_Device:=$deviceUUID
	End if 
	
	$token:=react_createToken_Table($param)
	
	$resp:=OB Copy:C1225($token)
	OB SET:C1220($resp; "uuid_user"; $uuid_)
	OB SET:C1220($resp; "nom_user"; ($nom+" "+$prenom))
	
	WEB SEND TEXT:C677(JSON Stringify:C1217($resp); "application/json")
Else 
	WEB SEND TEXT:C677(JSON Stringify:C1217(New object:C1471("response"; "Aucun device associé")); "application/json")
End if 