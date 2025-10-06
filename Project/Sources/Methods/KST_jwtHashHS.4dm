//%attributes = {}
C_OBJECT:C1216($1)  // JWT Header Object
C_OBJECT:C1216($2)  // JWT Payload Object
C_TEXT:C284($3)  // Secret Key
C_TEXT:C284($0)  // Hashed Result

C_TEXT:C284($encHead_t; $encPay_t)
C_TEXT:C284($jwtData_t; $hashAlg_t)
C_BLOB:C604($S1_Blob; $S2_Blob; $intermediate_Blob)
C_LONGINT:C283($block_l; $i; $byte; $hashAlg_l)

// Encode Header and Payload to build Message in Blob format
BASE64 ENCODE:C895(JSON Stringify:C1217($1); $encHead_t; *)
BASE64 ENCODE:C895(JSON Stringify:C1217($2); $encPay_t; *)
$jwtData_t:=$encHead_t+"."+$encPay_t
TEXT TO BLOB:C554($jwtData_t; $jwtData_Blob; UTF8 texte sans longueur:K22:17)

// Parse Hashing Algorithm From Header
$hashAlg_t:=Substring:C12($1.alg; 3)
If ($hashAlg_t="256")
	$hashAlg_l:=Digest SHA256:K66:4
	$block_l:=64
Else 
	$hashAlg_l:=Digest SHA512:K66:5
	$block_l:=128
End if 

// Format Secret Key as Blob
TEXT TO BLOB:C554($3; $secret_Blob; UTF8 texte sans longueur:K22:17)

// If Key is larger than Block, Hash the Key to reduce size
If (BLOB size:C605($secret_Blob)>$block_l)
	BASE64 DECODE:C896(Generate digest:C1147($secret_Blob; $hashAlg_l; *); $secret_Blob; *)
End if 

// If Key is smaller than Blob pad with 0's
If (BLOB size:C605($secret_Blob)<$block_l)
	SET BLOB SIZE:C606($secret_Blob; $block_l; 0)
End if 

ASSERT:C1129(BLOB size:C605($secret_Blob)=$block_l)

// Generate S bits
SET BLOB SIZE:C606($S1_Blob; $block_l)
SET BLOB SIZE:C606($S2_Blob; $block_l)

//S bits are based on the Formated Key XORed with specific pading bits
//%r-
For ($i; 0; $block_l-1)
	$byte:=$secret_Blob{$i}
	$S2_Blob{$i}:=$byte ^| 0x005C
	$S1_Blob{$i}:=$byte ^| 0x0036
End for 
//%r+


// append Message to S1 and Hash
COPY BLOB:C558($jwtData_Blob; $S1_Blob; 0; $block_l; BLOB size:C605($jwtData_Blob))
BASE64 DECODE:C896(Generate digest:C1147($S1_Blob; $hashAlg_l; *); $intermediate_Blob; *)

// append Append Hashed S1+Message to S2 and Hash to get the Hashed Verify Signature
COPY BLOB:C558($intermediate_Blob; $S2_Blob; 0; $block_l; BLOB size:C605($intermediate_Blob))
$0:=Generate digest:C1147($S2_Blob; $hashAlg_l; *)