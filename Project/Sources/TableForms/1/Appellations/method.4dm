Case of 
	: (Form event code:C388=Sur chargement:K2:1)
		Kle_Langue
		
		V_Pays:=0
		V_Region:=0
		ALL RECORDS:C47([Appellation:3])
		If ([Cave:2]Ref_Pays:27#0)
			QUERY:C277([Appellation:3]; [Appellation:3]Ref_Pays:6=[Cave:2]Ref_Pays:27)
			V_Pays:=[Cave:2]Ref_Pays:27
		End if 
		If ([Cave:2]Ref_Region:28#0)
			QUERY SELECTION:C341([Appellation:3]; [Appellation:3]Ref_Region:7=[Cave:2]Ref_Region:28)
			V_Region:=[Cave:2]Ref_Region:28
		End if 
		
		_O_ARRAY STRING:C218(80; zL1; 0)
		_O_ARRAY STRING:C218(80; zL2; 0)
		_O_ARRAY STRING:C218(80; zL3; 0)
		_O_ARRAY STRING:C218(80; zL4; 0)
		
		LST_APP{1}:=Get indexed string:C510(<>strLang; 53)
		LST_APP{2}:="A"
		LST_APP{3}:="B"
		LST_APP{4}:="C"
		LST_APP{5}:="D"
		LST_APP{6}:="E"
		LST_APP{7}:="F"
		LST_APP{8}:="G"
		LST_APP{9}:="H"
		LST_APP{10}:="I"
		LST_APP{11}:="J"
		LST_APP{12}:="K"
		LST_APP{13}:="L"
		LST_APP{14}:="M"
		LST_APP{15}:="N"
		LST_APP{16}:="O"
		LST_APP{17}:="P"
		LST_APP{18}:="Q"
		LST_APP{19}:="R"
		LST_APP{20}:="S"
		LST_APP{21}:="T"
		LST_APP{22}:="U"
		LST_APP{23}:="V"
		LST_APP{24}:="W"
		LST_APP{25}:="X"
		LST_APP{26}:="Y"
		LST_APP{27}:="Z"
		
		LST_APP:=1
		ORDER BY:C49([Appellation:3]; [Appellation:3]Appellation:1; >)
		SELECTION TO ARRAY:C260([Appellation:3]Appellation:1; ZL1; [Appellation:3]Region:2; ZL2; [Appellation:3]Pays:3; ZL3)
		
		
		For ($j; 1; Size of array:C274(ZL3))
			QUERY:C277([Pays:8]; [Pays:8]Nom_Fr:3=ZL3{$j})
			ZL3{$j}:=V_L_pays->
			
			QUERY:C277([Region:9]; [Region:9]Nom_Fr:2=ZL2{$j})
			If (V_L_Region->#"")
				ZL2{$j}:=V_L_Region->
			End if 
		End for 
		
		
		Lst_Pays_H:=New list:C375
		ALL RECORDS:C47([Pays:8])
		ORDER BY:C49([Pays:8]; V_L_pays->; >)
		DISTINCT VALUES:C339(V_L_pays->; L_Cat)
		For (i; 1; Size of array:C274(L_Cat))
			QUERY:C277([Pays:8]; V_L_pays->=L_Cat{i})
			QUERY:C277([Region:9]; [Region:9]Ref_Pays:10=[Pays:8]Ref_Pays:1)
			L_Cat3:=New list:C375
			While (Not:C34(End selection:C36([Region:9])))
				
				APPEND TO LIST:C376(L_Cat3; V_L_region->; [Pays:8]Ref_Pays:1*10000+[Region:9]Ref_Region:1)
				SET LIST ITEM PROPERTIES:C386(L_Cat3; 0; False:C215; 2; 0)
				
				NEXT RECORD:C51([Region:9])
			End while 
			APPEND TO LIST:C376(Lst_Pays_H; V_L_pays->; -[Pays:8]Ref_Pays:1; L_Cat3; False:C215)
			SET LIST ITEM PROPERTIES:C386(Lst_Pays_H; 0; False:C215; 2; 0)
		End for 
		
End case 