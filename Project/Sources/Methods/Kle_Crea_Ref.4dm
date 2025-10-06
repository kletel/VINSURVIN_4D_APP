//%attributes = {}
While (Semaphore:C143("CreerRefUnique"; 10))
	IDLE:C311
End while 
test:=Table name:C256($1)
QUERY:C277([Interface:1]; [Interface:1]Rubrique1:1=Table name:C256($1))
If (Records in selection:C76([Interface:1])=0)
	CREATE RECORD:C68([Interface:1])
	[Interface:1]Rubrique1:1:=Table name:C256($1)
End if 

If (Count parameters:C259=2)
	Repeat 
		[Interface:1]Nb_Util:3:=[Interface:1]Nb_Util:3+1
		$Err:=Find in field:C653($2->; [Interface:1]Nb_Util:3)
	Until ($Err=-1)
Else 
	[Interface:1]Nb_Util:3:=[Interface:1]Nb_Util:3+1
End if 

SAVE RECORD:C53([Interface:1])
$Rep:=[Interface:1]Nb_Util:3
UNLOAD RECORD:C212([Interface:1])
CLEAR SEMAPHORE:C144("CreerRefUnique")
$0:=$Rep