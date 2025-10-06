//%attributes = {}
C_BOOLEAN:C305(trace_b)
C_OBJECT:C1216($jwtHeader_ob)
C_OBJECT:C1216($jwtPayload_ob)
C_TEXT:C284($key_t)
C_TEXT:C284(jwtToken_t)
C_OBJECT:C1216($1)
$jwtHeader_ob:=New object:C1471("alg"; "RS256"; "typ"; "JWT")
$jwtPayload_ob:=New object:C1471()

$jwtPayload_ob.iss:="keysav"
$jwtPayload_ob.iat:=KST_Unix_Time
$jwtPayload_ob.exp:=KST_Unix_Time(Current date:C33+1; ?00:00:00?)
$jwtPayload_ob.payload:=$1

/*
$4dcryptokey:=KST_loadcryptokeyobj
$key_t:=$4dcryptokey.getPrivateKey()
*/
$key_t:=KST_loadcryptokeyobj

$jwtToken_t:=KST_jwtGenerate($jwtHeader_ob; $jwtPayload_ob; $key_t)
$0:=$jwtToken_t