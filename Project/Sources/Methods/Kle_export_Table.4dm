//%attributes = {}
C_TEXT:C284($2)

i:=$1
nbf:=0
Open window:C153(80; 80; 250; 180; "Exportation "+Table name:C256(i))

nbf:=0

Case of 
	: (Count parameters:C259=1)
		SET CHANNEL:C77(10; Table name:C256(i)+".Exp")
	: (Count parameters:C259=2)
		SET CHANNEL:C77(10; $2+Table name:C256(i)+".Exp")
End case 

ALL RECORDS:C47(Table:C252(i)->)
FIRST RECORD:C50(Table:C252(i)->)
While (Not:C34(End selection:C36(Table:C252(i)->)))
	nbf:=nbf+1
	ERASE WINDOW:C160
	GOTO XY:C161(2; 1)
	MESSAGE:C88(Table name:C256(I))
	GOTO XY:C161(2; 2)
	MESSAGE:C88(String:C10(NbF)+"/"+String:C10(Records in selection:C76(Table:C252(i)->)))
	
	SEND RECORD:C78(Table:C252(i)->)
	NEXT RECORD:C51(Table:C252(i)->)
End while 
SET CHANNEL:C77(11)

