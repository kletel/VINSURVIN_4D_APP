//%attributes = {}
// UTIL_IS_TEXT_AN_OBJECT
//$1:= TEXT of JSON to check
//$0:= BOOLEAN representing validitity
If (Count parameters:C259=1)
	C_BOOLEAN:C305($0)
	C_TEXT:C284($method; $result; $1)
	$method:=Method called on error:C704
	ON ERR CALL:C155(Current method name:C684)
	$result:=JSON Stringify:C1217(JSON Parse:C1218($1))
	ON ERR CALL:C155($method)
	If ($result="")
		$0:=False:C215
	Else 
		$0:=True:C214
	End if 
Else 
	// on err call
	// do nothing
End if 