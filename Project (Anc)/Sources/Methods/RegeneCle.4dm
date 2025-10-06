//%attributes = {}
$rep:=0
$chek:=0
$Ligne:="123456789ABCDEFGHJKLMNPQRSTUVWXYZabcdefghjklmnpqrstuvwxyz"

For ($i; Length:C16($1)-1; 1; -1)
	$rep:=($Rep*57)+(Position2(Substring:C12($1; $i; 1); $Ligne)-1)
	$chek:=$chek+Character code:C91(Substring:C12($1; $i; 1))
End for 

$tt:=$chek%57
$Resu:=Substring:C12($ligne; $tt+1; 1)

If ($resu#Substring:C12($1; Length:C16($1); 1))
	$Rep:=-1
End if 

$0:=$Rep