//%attributes = {"publishedWeb":true}
ARRAY TEXT:C222($tVnom; 0)
ARRAY TEXT:C222($tVal; 0)
WEB GET VARIABLES:C683($tVnom; $tVal)

$Email:=KST_web_Lire_param(->$tVnom; ->$tVal; "email")
$Pass:=KST_web_Lire_param(->$tVnom; ->$tVal; "password")
$deviceUUID:=KST_web_Lire_param(->$tVnom; ->$tVal; "deviceUUID")

If (Length:C16($Email)=0) | (Length:C16($Pass)=0)
	$obj:=New object:C1471("response"; "Email ou mot de passe manquant")
Else 
	QUERY:C277([Utilisateur:17]; [Utilisateur:17]EMail:10=$Email)
	
	If ([Utilisateur:17]MotDePasse:15=$Pass & [Utilisateur:17]Suppression:26=False:C215)
		//If ([Utilisateur]MotDePasse=$Pass)
		
		$UUIDuser:=[Utilisateur:17]UUID_:16
		$nomUser:=[Utilisateur:17]Nom:1+" "+[Utilisateur:17]Prenom:2
		
		If (Length:C16($deviceUUID)>0)
			[Utilisateur:17]DeviceUUID:21:=$deviceUUID
			SAVE RECORD:C53([Utilisateur:17])
		End if 
		
		$userselection:=Selection to JSON:C1234([Utilisateur:17])
		$tabuser:=JSON Parse:C1218($userselection)
		$usertxt:=$tabuser[0]
		
		$param:=New object:C1471("payload"; $usertxt)
		If (Length:C16($deviceUUID)>0)
			$param.UUID_Device:=$deviceUUID
		End if 
		
		$token:=react_createToken_Table($param)
		$resp:=JSON Stringify:C1217($token)
	Else 
		$obj:=New object:C1471("response"; "Identifiants incorrect")
		$resp:=JSON Stringify:C1217($obj)
	End if 
End if 

WEB SEND TEXT:C677($resp; "application/json")
