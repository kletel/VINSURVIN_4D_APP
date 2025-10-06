If ([Appellation:3]Appellation:1#"")
	
	[Cave:2]Appellation:2:=[Appellation:3]Appellation:1
	[Cave:2]Région:5:=[Appellation:3]Region:2
	[Cave:2]Pays:24:=[Appellation:3]Pays:3
	
	[Cave:2]Ref_Region:28:=[Appellation:3]Ref_Region:7
	[Cave:2]Ref_Pays:27:=[Appellation:3]Ref_Pays:6
	
	//[Cave]Appellation:=ZL1{ZL1}
	//[Cave]Région:=ZL2{ZL2}
	//[Cave]Pays:=ZL3{ZL3}
	//CHERCHER([Appellation];[Appellation]Appellation=ZL1{ZL1};*)
	//CHERCHER([Appellation]; & ;[Appellation]Region=ZL2{ZL2})
	//[Cave]Ref_Region:=[Appellation]Ref_Region
	//[Cave]Ref_Pays:=[Appellation]Ref_Pays
End if 