//%attributes = {}
ALL RECORDS:C47([Appellation:3])
FIRST RECORD:C50([Appellation:3])
While (Not:C34(End selection:C36([Appellation:3])))
	
	QUERY:C277([Association:7]; [Association:7]Vin:4="@"+[Appellation:3]Association:8+"@")
	
	[Appellation:3]Nb:9:=Records in selection:C76([Association:7])
	
	SAVE RECORD:C53([Appellation:3])
	NEXT RECORD:C51([Appellation:3])
End while 
