v_ref:=Selected list items:C379(Self:C308->)
GET LIST ITEM:C378(Self:C308->; V_Ref; V_Ref_U; $Libelle)
If (V_Ref_U<0)
	V_Region:=0
	V_Pays:=-V_Ref_U
	QUERY:C277([Pays:8]; [Pays:8]Ref_Pays:1=V_Pays)
	QUERY:C277([Appellation:3]; [Appellation:3]Ref_Pays:6=[Pays:8]Ref_Pays:1)
	
Else 
	V_Region:=V_Ref_U-(Int:C8(V_Ref_U/10000)*10000)
	V_Pays:=Int:C8(V_Ref_U/10000)
	QUERY:C277([Appellation:3]; [Appellation:3]Ref_Pays:6=V_Pays; *)
	QUERY:C277([Appellation:3];  & ; [Appellation:3]Ref_Region:7=V_Region)
	
End if 
ORDER BY:C49([Appellation:3]Pays:3; >; [Appellation:3]Region:2; >; [Appellation:3]Region:2; >)
UNLOAD RECORD:C212([Appellation:3])
LST_APP:=1

//
//
//Boucle ($j;1;Taille tableau(ZL3))
//CHERCHER([Pays];[Pays]Nom_Fr=ZL3{$j})
//ZL3{$j}:=V_L_pays->
//
//CHERCHER([Region];[Region]Nom_Fr=ZL2{$j})
//Si (V_L_Region->#"")
//ZL2{$j}:=V_L_Region->
//Fin de si 
//Fin de boucle 