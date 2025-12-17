//%attributes = {}
$Plateform:=$1
QUERY:C277([Param:37]; [Param:37]Nom:2=$Plateform)
If (Records in selection:C76([Param:37])=1)
	$0:=[Param:37]Chaine:3
Else 
	$0:=""
End if 