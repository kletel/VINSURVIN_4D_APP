//%attributes = {}
$auth:=$1

$enregistrement:=ds:C1482.Token.query("UUID=:1"; $auth).first()

If ($enregistrement#Null:C1517)
	$validate:=True:C214
	$payload:=$enregistrement.Payload
	return New object:C1471("validate"; $validate; "payload"; $payload)
Else 
	$validate:=False:C215
	return New object:C1471("validate"; $validate)
End if 