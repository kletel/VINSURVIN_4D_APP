//%attributes = {"publishedWeb":true}
ARRAY TEXT:C222($tVnom; 0)
ARRAY TEXT:C222($tVal; 0)
WEB GET VARIABLES:C683($tVnom; $tVal)

$Email:=KST_web_Lire_param(->$tVnom; ->$tVal; "email")
$Pass:=KST_web_Lire_param(->$tVnom; ->$tVal; "password")

If (Length:C16($Email)=0) | (Length:C16($Pass)=0)
	$obj:=New object:C1471("response"; "Email ou mot de passe manquant")
Else 
	QUERY:C277([Utilisateur:17]; [Utilisateur:17]EMail:10=$Email)
	If ([Utilisateur:17]MotDePasse:15=$Pass)
		$UUIDuser:=[Utilisateur:17]UUID_:16
		$nomUser:=[Utilisateur:17]Nom:1+" "+[Utilisateur:17]Prenom:2
		$userselection:=Selection to JSON:C1234([Utilisateur:17])
		
		$tabuser:=JSON Parse:C1218($userselection)
		$usertxt:=$tabuser[0]
		
		$param:=New object:C1471("payload"; $usertxt)
		//$token:=react_createToken_K($param)
		$token:=react_createToken_Table($param)
		
		
		
		//$obj:=Créer objet("accessToken"; $token; "uuidUser"; $UUIDuser; "nomUser"; $nomUser)
		//$obj:=New object("accessToken"; $token)
		
	Else 
		$obj:=New object:C1471("response"; "Identifiants incorrect")
	End if 
	
	
	
End if 

//$resp:=JSON Stringify($obj)
$resp:=JSON Stringify:C1217($token)

WEB SEND TEXT:C677($resp; "application/json")
