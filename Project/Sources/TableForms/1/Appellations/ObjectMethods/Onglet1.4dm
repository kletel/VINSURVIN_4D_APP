If (Self:C308->=1)
	ALL RECORDS:C47([Appellation:3])
	If (V_Pays#0)
		QUERY SELECTION:C341([Appellation:3]; [Appellation:3]Ref_Pays:6=V_Pays)
	End if 
	If (V_Region#0)
		QUERY SELECTION:C341([Appellation:3]; [Appellation:3]Ref_Region:7=V_Region)
	End if 
	
Else 
	QUERY:C277([Appellation:3]; [Appellation:3]Appellation:1=Char:C90(Character code:C91("A")-2+LST_APP)+"@")
	If (V_Pays#0)
		QUERY SELECTION:C341([Appellation:3]; [Appellation:3]Ref_Pays:6=V_Pays)
	End if 
	If (V_Region#0)
		QUERY SELECTION:C341([Appellation:3]; [Appellation:3]Ref_Region:7=V_Region)
	End if 
	
End if 
ORDER BY:C49([Appellation:3]; [Appellation:3]Appellation:1; >)
SELECTION TO ARRAY:C260([Appellation:3]Appellation:1; ZL1; [Appellation:3]Region:2; ZL2; [Appellation:3]Pays:3; ZL3; [Appellation:3]Commune:4; ZL4)


For ($j; 1; Size of array:C274(ZL3))
	QUERY:C277([Pays:8]; [Pays:8]Nom_Fr:3=ZL3{$j})
	ZL3{$j}:=V_L_pays->
	
	QUERY:C277([Region:9]; [Region:9]Nom_Fr:2=ZL2{$j})
	If (V_L_Region->#"")
		ZL2{$j}:=V_L_Region->
	End if 
End for 