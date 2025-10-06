//%attributes = {}
ALL RECORDS:C47([Appellation:3])
FIRST RECORD:C50([Appellation:3])
While (Not:C34(End selection:C36([Appellation:3])))
	QUERY:C277([Region:9]; [Region:9]Ref_Region:1=[Appellation:3]Ref_Region:7)
	If (Records in selection:C76([Region:9])=1)
		[Appellation:3]Region:2:=[Region:9]Nom_Fr:2
		SAVE RECORD:C53([Appellation:3])
	End if 
	NEXT RECORD:C51([Appellation:3])
End while 
