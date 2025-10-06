//%attributes = {"publishedWeb":true}
C_TEXT($0; $1; $encoded)
$encoded:=$1

// Encodage des caractères URL courants
$encoded:=Replace string:C233($encoded; " "; "%20")
$encoded:=Replace string:C233($encoded; "!"; "%21")
$encoded:=Replace string:C233($encoded; "#"; "%23")
$encoded:=Replace string:C233($encoded; "$"; "%24")
$encoded:=Replace string:C233($encoded; "&"; "%26")
$encoded:=Replace string:C233($encoded; "'"; "%27")
$encoded:=Replace string:C233($encoded; "("; "%28")
$encoded:=Replace string:C233($encoded; ")"; "%29")
$encoded:=Replace string:C233($encoded; "*"; "%2A")
$encoded:=Replace string:C233($encoded; "+"; "%2B")
$encoded:=Replace string:C233($encoded; ","; "%2C")
$encoded:=Replace string:C233($encoded; "/"; "%2F")
$encoded:=Replace string:C233($encoded; ":"; "%3A")
$encoded:=Replace string:C233($encoded; ";"; "%3B")
$encoded:=Replace string:C233($encoded; "="; "%3D")
$encoded:=Replace string:C233($encoded; "?"; "%3F")
$encoded:=Replace string:C233($encoded; "@"; "%40")
$encoded:=Replace string:C233($encoded; "["; "%5B")
$encoded:=Replace string:C233($encoded; "]"; "%5D")

$0:=$encoded
