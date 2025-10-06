//%attributes = {"publishedWeb":true}
// Méthode : EncodeTokenForURL
C_TEXT($1; $token)
C_TEXT($0; $safeToken)

$safeToken:=$1
$safeToken:=Replace string($safeToken; "+"; "-")
$safeToken:=Replace string($safeToken; "/"; "_")
$safeToken:=Replace string($safeToken; "="; "")

$0:=$safeToken
