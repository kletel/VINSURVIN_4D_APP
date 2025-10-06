//%attributes = {}
C_TEXT:C284($1)  // JWT Token
C_TEXT:C284($2)  // Key

C_BOOLEAN:C305($0)

C_COLLECTION:C1488($jwtSplit_col)
C_TEXT:C284($key_t)
C_TEXT:C284($jwtHeader_t)
C_TEXT:C284($jwtPayload_t)
C_OBJECT:C1216($jwtHead_ob)
C_OBJECT:C1216(jwtPay_ob)
C_TEXT:C284($algorithm_t)
C_TEXT:C284($jwtVerify_t)
$jwtHead_ob:=New object:C1471
jwtPay_ob:=New object:C1471
$algorithm_t:=""
// Split Token into the three parts: Header, Payload, Verify Signature
$jwtSplit_col:=Split string:C1554($1; ".")

// Decode Header and Payload into Objects
BASE64 DECODE:C896($jwtSplit_col[0]; $jwtHeader_t; *)
BASE64 DECODE:C896($jwtSplit_col[1]; $jwtPayload_t; *)

If ($jwtHeader_t#"")
	If (KST_UTIL_IS_TEXT_AN_OBJECT($jwtHeader_t))
		$jwtHead_ob:=JSON Parse:C1218($jwtHeader_t; Est un objet:K8:27)
	End if 
End if 
If ($jwtPayload_t#"")
	If (KST_UTIL_IS_TEXT_AN_OBJECT($jwtPayload_t))
		jwtPay_ob:=JSON Parse:C1218($jwtPayload_t; Est un objet:K8:27)
	End if 
End if 
$key_t:=$2

// Parse Header for Algorithm Family
If (OB Is defined:C1231($jwtHead_ob; "alg"))
	$algorithm_t:=Substring:C12($jwtHead_ob.alg; 1; 2)
End if 
// Generate Hashed Verify Signature
If ($algorithm_t#"")
	If ($algorithm_t="HS")
		$jwtVerify_t:=KST_jwtHashHS($jwtHead_ob; jwtPay_ob; $key_t)
	Else 
		$jwtVerify_t:=KST_jwtHashSign($jwtHead_ob; jwtPay_ob; $key_t)
	End if 
End if 
// Update Process Variable on demo2 Form
jwtVerify_t:=$jwtVerify_t

//Compare Verify Signatures to return Result
$0:=$jwtVerify_t=$jwtSplit_col[2]
