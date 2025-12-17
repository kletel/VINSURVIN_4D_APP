//%attributes = {"publishedWeb":true}
ARRAY TEXT:C222($tVnom; 0)
ARRAY TEXT:C222($tVal; 0)
WEB GET VARIABLES:C683($tVnom; $tVal)

C_TEXT:C284($auth)
$auth:=WEB GET HTTP HEADER:C697("Authorization")
If (Length:C16($auth)=0)
	WEB SEND TEXT:C677(JSON Stringify:C1217(New object:C1471("entete"; "error"; "message"; "Authorization manquant")); "application/json")
	QUIT METHOD
End if 

var $dec : Object
$dec:=react_decodeToken_K($auth)
If (($dec=Null:C1517) | ($dec.payload=Null:C1517) | (Undefined:C82($dec.payload.UUID_)=True:C214))
	WEB SEND TEXT:C677(JSON Stringify:C1217(New object:C1471("entete"; "error"; "message"; "Token invalide")); "application/json")
	QUIT METHOD
End if 

C_TEXT:C284($uuidUser)
$uuidUser:=$dec.payload.UUID_

var $tokSel : cs:C1710.TokenSelection
$tokSel:=ds:C1482.Token.query("UUID_Utilisateur = :1"; $uuidUser)
If ($tokSel.length>0)
	$tokSel.drop()
End if 

WEB SEND TEXT:C677(JSON Stringify:C1217(New object:C1471("entete"; "succes")); "application/json")