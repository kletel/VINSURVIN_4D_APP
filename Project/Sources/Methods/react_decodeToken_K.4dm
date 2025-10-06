//%attributes = {"publishedWeb":true}
//token JWT
$token:=$1

C_TEXT:C284($token; $headerB64; $payloadB64; $signatureB64)
C_TEXT:C284($headerText; $payloadText)
C_OBJECT:C1216($headerObj; $payloadObj)
C_COLLECTION:C1488($parts)



$parts:=Split string:C1554($token; ".")
$headerB64:=$parts[0]
$payloadB64:=$parts[1]
$signatureB64:=$parts[2]



// Correction
$headerB64:=react_fixeBase64URLToken_K($headerB64)
$payloadB64:=react_fixeBase64URLToken_K($payloadB64)

// Décodage
BASE64 DECODE:C896($headerB64; $headerText)
BASE64 DECODE:C896($payloadB64; $payloadText)

// Parsing JSON
$headerObj:=JSON Parse:C1218($headerText)
$payloadObj:=JSON Parse:C1218($payloadText)


return New object:C1471("header"; $headerObj; "payload"; $payloadObj)