//%attributes = {}
DEFAULT TABLE:C46([Millésimes:4])
FIRST RECORD:C50
While (Not:C34(End selection:C36([Millésimes:4])))
	If ([Millésimes:4]Alsace:10="0")
		[Millésimes:4]Alsace:10:=""
	End if 
	If ([Millésimes:4]Bordeau_Blanc_Liquoreux:3="0")
		[Millésimes:4]Bordeau_Blanc_Liquoreux:3:=""
	End if 
	If ([Millésimes:4]Bordeau_Blanc_Sec:4="0")
		[Millésimes:4]Bordeau_Blanc_Sec:4:=""
	End if 
	If ([Millésimes:4]Bordeau_Rouge:2="0")
		[Millésimes:4]Bordeau_Rouge:2:=""
	End if 
	If ([Millésimes:4]Bourgogne_Blanc:6="0")
		[Millésimes:4]Bourgogne_Blanc:6:=""
	End if 
	If ([Millésimes:4]Bourgogne_Rouge:5="0")
		[Millésimes:4]Bourgogne_Rouge:5:=""
	End if 
	If ([Millésimes:4]Champagne:7="0")
		[Millésimes:4]Champagne:7:=""
	End if 
	If ([Millésimes:4]Loire:8="0")
		[Millésimes:4]Loire:8:=""
	End if 
	If ([Millésimes:4]Rhone:9="0")
		[Millésimes:4]Rhone:9:=""
	End if 
	SAVE RECORD:C53
	NEXT RECORD:C51
End while 
