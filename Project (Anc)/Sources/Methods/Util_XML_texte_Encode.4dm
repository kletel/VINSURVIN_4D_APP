//%attributes = {}
C_TEXT:C284($1; $0)

$0:=$1
$0:=Replace string:C233($0; "&"; "&amp;")  //ampersand
$0:=Replace string:C233($0; "<"; "&lt;")  //less than
$0:=Replace string:C233($0; ">"; "&gt;")  //greater than
$0:=Replace string:C233($0; Char:C90(39); "&apos;")  //apostrophe
$0:=Replace string:C233($0; Char:C90(Guillemets:K15:41); "&quot;")  //quotation mark