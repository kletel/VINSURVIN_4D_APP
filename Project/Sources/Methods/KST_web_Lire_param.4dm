//%attributes = {}
$Retour:=""
If (Find in array:C230($1->; $3)>0)
	$Retour:=$2->{Find in array:C230($1->; $3)}
End if 

$0:=$Retour