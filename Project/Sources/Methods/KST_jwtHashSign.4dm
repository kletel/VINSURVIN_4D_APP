//%attributes = {}
C_OBJECT:C1216($1)  // JWT Header Object
C_OBJECT:C1216($2)  // JWT Payload Object
C_TEXT:C284($3)  // PEM key or Empty to let 4D Generate keys

C_TEXT:C284($encHead_t)
C_TEXT:C284($encPay_t)
C_TEXT:C284($jwtData_t)

C_OBJECT:C1216($settings)
C_OBJECT:C1216($key_ob)
C_TEXT:C284($hashAlg_t)
C_LONGINT:C283($hashAlg_l)
C_OBJECT:C1216($signOptions)

// Encode Header and Payload to build Message
BASE64 ENCODE:C895(JSON Stringify:C1217($1); $encHead_t; *)
BASE64 ENCODE:C895(JSON Stringify:C1217($2); $encPay_t; *)
$jwtData_t:=$encHead_t+"."+$encPay_t

// Prepare CryptoKey settings
If ($3="")
	$settings:=New object:C1471("type"; "RSA")  // 4D will automatically create RSA key pair
Else 
	$settings:=New object:C1471("type"; "PEM"; "pem"; $3)  // Use specified PEM format Key
End if 

// Create new CryptoKey
$key_ob:=4D:C1709.CryptoKey.new($settings)

// Update Process Variable on demo1 Form
key_t:=$key_ob.getPrivateKey()

// Parse Header for Algorithm Family
$hashAlg_t:=Substring:C12($1.alg; 3)

If ($hashAlg_t="256")
	$hashAlg_l:=Digest SHA256:K66:4
Else 
	$hashAlg_l:=Digest SHA512:K66:5
End if 

// Sign Message with CryptoKey to generate hashed verify signature
$signOptions:=New object:C1471("hash"; $hashAlg_l; "pss"; $1.alg="PS@"; "encoding"; "Base64URL")
$0:=$key_ob.sign($jwtData_t; $signOptions)