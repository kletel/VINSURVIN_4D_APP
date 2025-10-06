If ([Cave:2]Ref_Cave:26=0)
	[Cave:2]Ref_Cave:26:=Kle_Crea_Ref(->[Cave:2]; ->[Cave:2]Ref_Cave:26)
	
End if 
If ([Cave:2]UUID:48="")
	[Cave:2]UUID:48:=Generate UUID:C1066  //Kle_Genere_UUID("VSV4")
End if 
If ([Cave:2]UUID_User:49="")
	[Cave:2]UUID_User:49:=<>UUID_User
End if 
If ([Cave:2]Cave:40="")
	[Cave:2]Cave:40:=<>CategorieCave
End if 
[Cave:2]Reste_en_Cave:19:=[Cave:2]Qte:7-[Cave:2]Dont_Bue:8

<>NumEnrCourant:=Selected record number:C246([Cave:2])
//If ([Cave]Prix_Achat_Euro=0) & ([Cave]Prix_Achat#0)
//[Cave]Prix_Achat_Euro:=Euro converter([Cave]Prix_Achat;"EUR";"FRF")
//End if 
//If ([Cave]Prix_Achat=0) & ([Cave]Prix_Achat_Euro#0)
//[Cave]Prix_Achat:=Euro converter([Cave]Prix_Achat_Euro;"FRF";"EUR")
//End if 
//If ([Cave]Valeur=0) & ([Cave]Valeure_Total_Euro#0)
//[Cave]Valeur:=Euro converter([Cave]Valeure_Total_Euro;"EUR";"FRF")
//End if 
//If ([Cave]Valeure_Total_Euro=0) & ([Cave]Valeur#0)
//[Cave]Valeure_Total_Euro:=Euro converter([Cave]Valeur;"FRF";"EUR")
//End if 