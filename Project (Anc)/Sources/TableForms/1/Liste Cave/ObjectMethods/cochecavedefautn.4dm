Case of 
	: (Form event code:C388=Sur clic:K2:4)
		
		
		
		
		Case of 
			: (cochecavedefaut=1)
				If (Pop_Cave>0)
					QUERY:C277([Interface:1]; [Interface:1]Rubrique1:1="Cave_Defaut")
					If (Records in selection:C76([Interface:1])=0)
						CREATE RECORD:C68([Interface:1])
						[Interface:1]Rubrique1:1:="Cave_Defaut"
						[Interface:1]cavedefaut:8:=Pop_Cave{Pop_Cave}
						SAVE RECORD:C53([Interface:1])
					Else 
						[Interface:1]cavedefaut:8:=Pop_Cave{Pop_Cave}
						SAVE RECORD:C53([Interface:1])
					End if 
				End if 
				
			: (cochecavedefaut=0)
				If (Pop_Cave>0)
					QUERY:C277([Interface:1]; [Interface:1]Rubrique1:1="Cave_Defaut"; *)
					QUERY:C277([Interface:1];  & ; [Interface:1]cavedefaut:8=Pop_Cave{Pop_Cave})
					If (Records in selection:C76([Interface:1])=1)
						DELETE RECORD:C58([Interface:1])
					End if 
					
					
				End if 
		End case 
		
		
		
		
End case 
