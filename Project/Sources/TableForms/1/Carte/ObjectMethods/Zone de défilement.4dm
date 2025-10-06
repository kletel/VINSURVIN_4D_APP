v_ref:=Selected list items:C379(Self:C308->)
GET LIST ITEM:C378(Self:C308->; V_Ref; V_Ref_U; $Libelle)
If (V_Ref_U<0)
	QUERY:C277([Pays:8]; [Pays:8]Ref_Pays:1=-V_Ref_U)
Else 
	QUERY:C277([Pays:8]; [Pays:8]Ref_Pays:1=Int:C8(V_Ref_U/10000))
End if 
V_Pays_A_Grapher:=[Pays:8]Ref_Pays:1
V_Img_Carte:=[Pays:8]Carte:2
If (FORM Get current page:C276=2)
	V_Tout_Pays:=0
	Grapher(V_Pays_A_Grapher; V_Type_Graphe)
End if 

