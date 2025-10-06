//%attributes = {}
$App:=$1
If (Position:C15("("; $App)>0)
	$App:=Substring:C12($App; 1; Position:C15("("; $1)-1)
End if 
$App:=Sup_Spc(Replace string:C233($App; "AOC"; ""))
//ALERTE($app)

$0:=$App