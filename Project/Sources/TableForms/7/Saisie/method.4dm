Case of 
	: (Form event code:C388=Sur chargement:K2:1)
		If ([Association:7]Categorie:1="") & ([Association:7]Sous_Categorie:2="")
			
			[Association:7]Categorie:1:=v_Ref_Asso
			[Association:7]Sous_Categorie:2:=v_Ref_SousAsso
			[Association:7]Langue:5:=<>LangueInitiale
		End if 
		
End case 
