If (ZL1>0)
	//[Cave]Appellation:=ZL1{ZL1}
	//[Cave]Région:=ZL2{ZL2}
	//[Cave]Pays:=ZL3{ZL3}
	$nb:=ZL1
	QUERY:C277([Appellation:3]; [Appellation:3]Appellation:1=ZL1{ZL1}; *)
	QUERY:C277([Appellation:3];  & ; [Appellation:3]Region:2=ZL2{ZL2})
	DELETE RECORD:C58([Appellation:3])
	DELETE FROM ARRAY:C228(ZL1; $Nb; 1)
	DELETE FROM ARRAY:C228(ZL2; $Nb; 1)
	DELETE FROM ARRAY:C228(ZL3; $Nb; 1)
	//[Cave]Ref_Region:=[Appellation]Ref_Region
	//[Cave]Ref_Pays:=[Appellation]Ref_Pays
End if 