//%attributes = {"publishedWeb":true}
ARRAY TEXT:C222($tVnom; 0)
ARRAY TEXT:C222($tVal; 0)
WEB GET VARIABLES:C683($tVnom; $tVal)

$email:=KST_web_Lire_param(->$tVnom; ->$tVal; "email")
$pass:=KST_web_Lire_param(->$tVnom; ->$tVal; "password")

If (Length:C16($Email)=0) | (Length:C16($Pass)=0)
	$obj:=New object:C1471("response"; "Email ou mot de passe manquant")
Else 
	$userListe:=ds:C1482.Utilisateur.query("EMail =:1"; $email)
	If ($userListe.length=1)
		$user:=$userListe.first()
		If ($user.MotDePasse=$pass)
			
			$key_t:=KST_loadcryptokeyobj
			$privatekey:=$key_t.privatekey
			$publickey:=$key_t.publickey
			$header:=New object:C1471("alg"; "RS256"; "typ"; "JWT")  //import plugin jwt de miyako
			$json:=JSON Stringify:C1217($user.toObject())
			$usertxt:=JSON Parse:C1218($json)
			$payload:=$usertxt
			$token:=JWT Sign(JSON Stringify:C1217($header); JSON Stringify:C1217($payload); $privatekey)
			//ASSERT(1=JWT Verify($token; $publickey))
			
			$uuidGen:=Generate UUID:C1066
			$user.UUID_temporaire:=$uuidGen
			$user.DateExpiration:=Current date:C33(*)
			$user.HeureExpiration:=Time:C179(Current time:C178+(1800*5))  //5 h
			$user.save()
			$obj:=New object:C1471("entete"; "succes"; "accessToken"; $token; "uuidUser"; $user.UUID_; "nomUser"; $user.Nom; "uuidTemp"; $uuidGen)
		End if 
		
	End if 
	
	
	
End if 

$resp:=JSON Stringify:C1217($obj)
WEB SEND TEXT:C677($resp; "application/json")