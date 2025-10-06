//%attributes = {}
C_OBJECT:C1216($1)  // JWT Header Object
C_OBJECT:C1216($2)  // JWT Payload Object
C_TEXT:C284($3)  // Secret Key

C_TEXT:C284($0)  // Resulting JWT

C_OBJECT:C1216($jwtHead_ob)
C_OBJECT:C1216($jwtPay_ob)
C_TEXT:C284($secretKey)

C_TEXT:C284($jwtHeader_t)
C_TEXT:C284($jwtPayload_t)
C_TEXT:C284($algorithm_t)
C_TEXT:C284($jwtSignature_t)

$jwtHead_ob:=$1
$jwtPay_ob:=$2
$secretKey:=$3

// Encode the Header and Payload
BASE64 ENCODE:C895(JSON Stringify:C1217($jwtHead_ob); $jwtHeader_t; *)
BASE64 ENCODE:C895(JSON Stringify:C1217($jwtPay_ob); $jwtPayload_t; *)

// Parse Header for Algorithm Family
$algorithm_t:=Substring:C12($jwtHead_ob.alg; 1; 2)

// Generate Verify Signature Hash based on Algorithm
If ($algorithm_t="HS")
	$jwtSignature_t:=KST_jwtHashHS($1; $2; $3)  // HMAC Hash
Else 
	$jwtSignature_t:=KST_jwtHashSign($1; $2; $3)  // All other Hashes
End if 

// Combine Encoded Header and Payload with Hashed Signature for the Token
$0:=$jwtHeader_t+"."+$jwtPayload_t+"."+$jwtSignature_t