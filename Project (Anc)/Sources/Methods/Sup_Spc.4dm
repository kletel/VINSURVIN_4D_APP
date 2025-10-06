//%attributes = {}
C_TEXT:C284($1; $Rep)
$Rep:=$1
$car:=Substring:C12($Rep; 1; 1)
While ($Car=" ")
	$Rep:=Substring:C12($Rep; 2)
	$car:=Substring:C12($Rep; 1; 1)
End while 

$car:=Substring:C12($Rep; Length:C16($Rep); 1)
While ($Car=" ")
	$Rep:=Substring:C12($Rep; 1; Length:C16($Rep)-1)
	$car:=Substring:C12($Rep; Length:C16($Rep); 1)
End while 
$0:=$Rep