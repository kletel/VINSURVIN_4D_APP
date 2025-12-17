//%attributes = {}
var $authHeader; $token : Text
var $jwtInfo; $claims : Object
var $user : cs:C1710.UtilisateurEntity

C_TEXT:C284($authHeader)
WEB GET HTTP HEADER:C697("Authorization"; $authHeader)


If ($authHeader="")
	$0:=Null:C1517
	Quit method
End if 

If (Position:C15(" "; $authHeader)>0)
	$token:=Substring:C12($authHeader; Position:C15(" "; $authHeader)+1)
Else 
	$token:=$authHeader
End if 

$jwtInfo:=react_verifToken_K($token)

If (Not:C34($jwtInfo.validate))
	$0:=Null:C1517
	Quit method
End if 

$claims:=$jwtInfo.payload

If (($claims.uuid_user#Null:C1517) & ($claims.uuid_user#""))
	$user:=ds:C1482.Utilisateur.query("UUID = :1"; $claims.uuid_user).first()
Else 
	If (($claims.Email#Null:C1517) & ($claims.Email#""))
		$user:=ds:C1482.Utilisateur.query("Email = :1"; $claims.Email).first()
	Else 
		$user:=Null:C1517
	End if 
End if 

$0:=$user