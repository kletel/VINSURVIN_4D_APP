//%attributes = {}
$Rep:=0
For ($i; 1; Length:C16($2))
	If (Character code:C91(Substring:C12($2; $i; 1))=Character code:C91($1))
		$Rep:=$i
	End if 
End for 
$0:=$Rep