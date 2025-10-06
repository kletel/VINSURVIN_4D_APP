//%attributes = {"publishedWeb":true}
$txtB64:=$1
$txtB64:=Replace string:C233($txtB64; "-"; "+")
$txtB64:=Replace string:C233($txtB64; "_"; "/")
If (Mod:C98(Length:C16($txtB64); 4)#0)
	$txtB64:=$txtB64+String:C10("="; 4-Mod:C98(Length:C16($txtB64); 4))
End if 
$0:=$txtB64