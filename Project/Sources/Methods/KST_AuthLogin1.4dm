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
		$userselection:=Selection to JSON:C1234([Utilisateur:17])
		
		$tabuser:=JSON Parse:C1218($userselection)
		$usertxt:=$tabuser[0]
		$token:=KST_createtoken($usertxt)
		$obj:=New object:C1471("accessToken"; $token)
	Else 
		$obj:=New object:C1471("response"; "Identifiants incorrect")
	End if 
End if 

$resp:=JSON Stringify:C1217($obj)
WEB SEND TEXT:C677($resp; "application/json")
