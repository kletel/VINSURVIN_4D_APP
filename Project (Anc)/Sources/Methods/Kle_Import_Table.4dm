//%attributes = {}
C_TEXT:C284($2)
$Import:=False:C215
i:=$1
nbf:=0
$ref_F:=Open window:C153(80; 80; 250; 180; "Importation de la table : "+Table name:C256(i))
nbf:=0
Case of 
	: (Count parameters:C259=1)
		If (Test path name:C476(Table name:C256(i)+".Exp")>=0)
			SET CHANNEL:C77(10; Table name:C256(i)+".Exp")
			$Import:=True:C214
		End if 
	: (Count parameters:C259=2)
		If (Test path name:C476($2)>=0)
			SET CHANNEL:C77(10; $2)
			$Import:=True:C214
		End if 
End case 

If ($Import=True:C214)
	ALL RECORDS:C47(Table:C252(i)->)
	DELETE SELECTION:C66(Table:C252(i)->)
	RECEIVE RECORD:C79(Table:C252(i)->)
	While (Ok=1)
		SAVE RECORD:C53(Table:C252(i)->)
		nbf:=nbf+1
		ERASE WINDOW:C160
		GOTO XY:C161(2; 1)
		MESSAGE:C88(Table name:C256(I))
		GOTO XY:C161(2; 2)
		MESSAGE:C88(String:C10(NbF)+"/"+String:C10(Records in selection:C76(Table:C252(i)->)))
		
		RECEIVE RECORD:C79(Table:C252(i)->)
	End while 
	SET CHANNEL:C77(11)
End if 
