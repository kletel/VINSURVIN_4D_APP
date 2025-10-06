//%attributes = {"publishedWeb":true}
ARRAY TEXT:C222($tVnom; 0)
ARRAY TEXT:C222($tVal; 0)
WEB GET VARIABLES:C683($tVnom; $tVal)

$token:=KST_web_Lire_param(->$tVnom; ->$tVal; "token")
$uuidTemp:=KST_web_Lire_param(->$tVnom; ->$tVal; "uuidTemp")
$user:=ds:C1482.Utilisateur.query("UUID_temporaire=:1"; $uuidTemp).first()
$host:=react_getHttpField("Host")
If ($user#Null:C1517)
	// Vérification de l'expiration
	If ($user.DateExpiration=Current date:C33(*)) & ($user.HeureExpiration>Current time:C178(*))
		Case of 
			: ($host="@vinsurvin.vitissia.fr@")
				$obj:=New object:C1471("entete"; "succes"; "lien"; "https://vinsurvin.vitissia.fr"+"/login?tokenTemp="+$uuidTemp+"&token="+$token)
			: (($host="@localhost@") || ($host="127.0.0.1"))
				$obj:=New object:C1471("entete"; "succes"; "lien"; "http://localhost:3000"+"/login?tokenTemp="+$uuidTemp+"&token="+$token)
		End case 
	Else 
		//$obj:=Créer objet("entete"; "echec"; "message"; "Le lien a expiré.")
		If ($token.payload#Null:C1517 && Not:C34(Undefined:C82($token.payload)))
			$user:=ds:C1482.Utilisateur.query("UUID_:1"; $token.payload.UUID_).first()
			$uuidGen:=Generate UUID:C1066
			$user.UUID_temporaire:=$uuidGen
			$user.DateExpiration:=Current date:C33(*)
			$user.HeureExpiration:=Time:C179(Current time:C178+(1800*5))  //5 h
			$user.save()
			$obj:=New object:C1471("entete"; "succes"; "lien"; "/login?tokenTemp="+$uuidGen)
		End if 
	End if 
Else 
	$obj:=New object:C1471("entete"; "echec"; "message"; "Token est invalide..")
End if 
$resp:=JSON Stringify:C1217($obj)
WEB SEND TEXT:C677($resp; "application/json")