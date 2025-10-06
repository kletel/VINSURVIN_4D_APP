//%attributes = {}
QUERY:C277([Interface:1]; [Interface:1]tablesisimported:7=True:C214)
If (Records in selection:C76([Interface:1])=1)
	
Else 
	$chemin:=Get 4D folder:C485(6)+"Donnees"+<>Separateur
	If ($chemin#"")
		
		$Import:=False:C215
		
		For ($i; 1; Get last table number:C254)
			//$Ref:=Nouveau process("Kle_Import_Table";32000;"Import "+Nom de la table(i);i;$chemin+Nom de la table(i))
			
			
			nbf:=0
			
			ALL RECORDS:C47(Table:C252($i)->)
			If (Records in selection:C76(Table:C252($i)->)=0)
				// $Import:=Vrai
				If ($i=2)
					Kle_Confirmer(Get indexed string:C510(<>strLang; 339))
					If (Ok=1)
						$Import:=True:C214
					Else 
						$Import:=False:C215
					End if 
				End if 
				
				If ($Import=True:C214) & (Test path name:C476($chemin+Table name:C256($i)+".Exp")>=0)
					$x_ref_F:=Open window:C153(80; 80; 250; 180; Fenêtre palette:K34:3; "Importation de la table : "+Table name:C256($i))
					SET CHANNEL:C77(10; $chemin+Table name:C256($i)+".Exp")
					
					RECEIVE RECORD:C79(Table:C252($i)->)
					While (Ok=1)
						SAVE RECORD:C53(Table:C252($i)->)
						nbf:=nbf+1
						ERASE WINDOW:C160
						GOTO XY:C161(2; 1)
						MESSAGE:C88(Table name:C256($I))
						GOTO XY:C161(2; 2)
						MESSAGE:C88(String:C10(NbF)+"/"+String:C10(Records in selection:C76(Table:C252($i)->)))
						
						RECEIVE RECORD:C79(Table:C252($i)->)
					End while 
					SET CHANNEL:C77(11)
					
					CLOSE WINDOW:C154($x_ref_F)
					
					
				Else 
					$x_ref_F:=Open window:C153(80; 80; 250; 180; Fenêtre palette:K34:3; "Importation de la table : "+Table name:C256($i))
					If (Table name:C256($i)#"Cave")
						SET CHANNEL:C77(10; $chemin+Table name:C256($i)+".Exp")
						
						RECEIVE RECORD:C79(Table:C252($i)->)
						While (Ok=1)
							SAVE RECORD:C53(Table:C252($i)->)
							nbf:=nbf+1
							ERASE WINDOW:C160
							GOTO XY:C161(2; 1)
							MESSAGE:C88(Table name:C256($I))
							GOTO XY:C161(2; 2)
							MESSAGE:C88(String:C10(NbF)+"/"+String:C10(Records in selection:C76(Table:C252($i)->)))
							
							RECEIVE RECORD:C79(Table:C252($i)->)
						End while 
						SET CHANNEL:C77(11)
						
					End if 
					
					CLOSE WINDOW:C154($x_ref_F)
					
					
				End if 
				
				
			End if 
			
		End for 
		QUERY:C277([Interface:1]; [Interface:1]tablesisimported:7=True:C214)
		DELETE SELECTION:C66([Interface:1])
		CREATE RECORD:C68([Interface:1])
		[Interface:1]tablesisimported:7:=True:C214
		SAVE RECORD:C53([Interface:1])
	End if 
End if 
