//%attributes = {}
C_LONGINT:C283($1)
C_TEXT:C284($2)

$ch:=";"+$2+";"

For ($i; 1; $1)
	$po1:=Position:C15(";"; $ch)+1
	$ch:=Substring:C12($Ch; $po1)
End for 
$po2:=Position:C15(";"; $ch)-1
$rep:=Substring:C12($ch; 1; $po2)
$0:=$rep
