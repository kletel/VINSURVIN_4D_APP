//%attributes = {}
$ch:=$1
$ch:=Replace string:C233($ch; "ç"; "c"; 999)
$ch:=Replace string:C233($ch; "é"; "e"; 999)
$ch:=Replace string:C233($ch; "î"; "i"; 999)
$ch:=Replace string:C233($ch; "ô"; "o"; 999)
$ch:=Replace string:C233($ch; "ù"; "u"; 999)
$0:=$ch
