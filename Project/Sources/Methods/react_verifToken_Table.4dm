//%attributes = {}
$auth:=$1

$enregistrement:=ds:C1482.Token.query("UUID=:1"; $auth).first()
$now:=KST_Unix_Time

If ($enregistrement#Null:C1517)
	If ($now<$enregistrement.Exp)
		$validate:=True:C214
		$payload:=$enregistrement.Payload
		return New object:C1471("validate"; $validate; "payload"; $payload)
	Else 
		$validate:=False:C215
		return New object:C1471("validate"; $validate)
	End if 
Else 
	$validate:=False:C215
	return New object:C1471("validate"; $validate)
End if 