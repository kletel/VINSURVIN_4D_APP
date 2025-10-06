//%attributes = {"publishedWeb":true}
$auth:=$1  //token encoder
$token:=String:C10($auth)
$4dcryptokey:=KST_loadcryptokeyobj
$publickey:=$4dcryptokey.publickey

var $validate
$validate:=Bool:C1537(JWT Verify($token; $publickey))
$ob:=react_decodeToken_K($token)
return New object:C1471("validate"; $validate; "payload"; $ob.payload; "header"; $ob.header)