//%attributes = {"publishedWeb":true}
$param:=$1
$key_t:=KST_loadcryptokeyobj
$privatekey:=$key_t.privatekey
$publickey:=$key_t.publickey

If (($param.header=Null:C1517) || (Undefined:C82($param.header)))
	$header:=New object:C1471("alg"; "RS256"; "typ"; "JWT")
Else 
	$header:=$param.header
End if 

If (($param.payload=Null:C1517) || (Undefined:C82($param.payload)))
	$payload:=""
Else 
	$payload:=$param.payload
End if 

$jwtPayload_ob:=New object:C1471()

$jwtPayload_ob.iss:="keysav"
$jwtPayload_ob.iat:=KST_Unix_Time
$jwtPayload_ob.exp:=KST_Unix_Time(Current date:C33+1; ?00:00:00?)
$jwtPayload_ob.payload:=$payload

If (($param.privatekey#Null:C1517) && (Not:C34(Undefined:C82($param.privatekey))))
	$privatekey:=$param.privatekey
End if 
//$token:=JWT Sign(JSON Stringify($header); JSON Stringify($payload); $privatekey)
$token:=JWT Sign(JSON Stringify:C1217($header); JSON Stringify:C1217($jwtPayload_ob); $privatekey)


return $token