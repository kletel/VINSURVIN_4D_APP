//%attributes = {}
ALL RECORDS:C47([Pays:8])
FIRST RECORD:C50([Pays:8])
While (Not:C34(End selection:C36([Pays:8])))
	QUERY:C277([Cave:2]; [Cave:2]Ref_Pays:27=[Pays:8]Ref_Pays:1)
	If (Records in selection:C76([Cave:2])=0)
		[Pays:8]Nb_Bouteilles:9:=0
	Else 
		[Pays:8]Nb_Bouteilles:9:=Sum:C1([Cave:2]Reste_en_Cave:19)
	End if 
	SAVE RECORD:C53([Pays:8])
	NEXT RECORD:C51([Pays:8])
End while 
UNLOAD RECORD:C212([Pays:8])

ALL RECORDS:C47([Region:9])
FIRST RECORD:C50([Region:9])
While (Not:C34(End selection:C36([Region:9])))
	QUERY:C277([Cave:2]; [Cave:2]Ref_Region:28=[Region:9]Ref_Region:1)
	If (Records in selection:C76([Cave:2])=0)
		[Region:9]Nb_Bouteilles:8:=0
	Else 
		[Region:9]Nb_Bouteilles:8:=Sum:C1([Cave:2]Reste_en_Cave:19)
	End if 
	SAVE RECORD:C53([Region:9])
	NEXT RECORD:C51([Region:9])
End while 
UNLOAD RECORD:C212([Region:9])