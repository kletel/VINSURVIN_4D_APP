Case of 
	: (Form event code:C388=Sur double clic:K2:5)
		If (ZL1>0)
			[Cave:2]Appellation:2:=ZL1{ZL1}
			[Cave:2]Région:5:=ZL2{ZL2}
			[Cave:2]Pays:24:=ZL3{ZL3}
			QUERY:C277([Appellation:3]; [Appellation:3]Appellation:1=ZL1{ZL1}; *)
			QUERY:C277([Appellation:3];  & ; [Appellation:3]Region:2=ZL2{ZL2})
			[Cave:2]Ref_Region:28:=[Appellation:3]Ref_Region:7
			[Cave:2]Ref_Pays:27:=[Appellation:3]Ref_Pays:6
			ACCEPT:C269
		End if 
End case 