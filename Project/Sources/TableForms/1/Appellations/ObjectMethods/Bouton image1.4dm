Kle_Langue

If (V_Pays=0)
	Kle_Alerte(Get indexed string:C510(<>strLang; 127))
Else 
	If (V_Region=0)
		Kle_Alerte(Get indexed string:C510(<>strLang; 128))
	Else 
		$app:=Kle_Demander(Get indexed string:C510(<>strLang; 129)+" :")
		If (Ok=1)
			CREATE RECORD:C68([Appellation:3])
			[Appellation:3]Appellation:1:=$app
			[Appellation:3]Ref_Pays:6:=V_Pays
			QUERY:C277([Pays:8]; [Pays:8]Ref_Pays:1=V_Pays)
			[Appellation:3]Pays:3:=[Pays:8]Nom_Fr:3
			[Appellation:3]Ref_Region:7:=V_Region
			QUERY:C277([Region:9]; [Region:9]Ref_Region:1=V_Region)
			[Appellation:3]Region:2:=[Region:9]Nom_Fr:2
			SAVE RECORD:C53([Appellation:3])
			
			ALL RECORDS:C47([Appellation:3])
			If (V_Pays#0)
				QUERY SELECTION:C341([Appellation:3]; [Appellation:3]Ref_Pays:6=V_Pays)
			End if 
			If (V_Region#0)
				QUERY SELECTION:C341([Appellation:3]; [Appellation:3]Ref_Region:7=V_Region)
			End if 
			ORDER BY:C49([Appellation:3]; [Appellation:3]Appellation:1; >)
			SELECTION TO ARRAY:C260([Appellation:3]Appellation:1; ZL1; [Appellation:3]Region:2; ZL2; [Appellation:3]Pays:3; ZL3; [Appellation:3]Commune:4; ZL4)
		End if 
	End if 
End if 