//%attributes = {}
$param:=$1

$uuid:=Generate UUID:C1066

If (($param.payload=Null:C1517) || (Undefined:C82($param.payload)))
	$payload:=""
Else 
	$payload:=$param.payload
End if 

$table:=ds:C1482.Token.new()

$table.UUID:=$uuid
$table.Iat:=KST_Unix_Time
$table.Exp:=KST_Unix_Time(Current date:C33+1; ?00:00:00?)
$table.Payload:=$payload
$table.UUID_Utilisateur:=$payload.UUID_

$table.save()

$nom:=$payload.Nom+" "+$payload.Prenom

$token:=New object:C1471("accessToken"; $table.UUID; "nom_user"; $nom; "uuid_user"; $table.UUID_Utilisateur)

return $token