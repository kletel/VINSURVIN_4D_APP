_O_C_INTEGER:C282($result)

$NomUtilisateur:=[Utilisateur:17]Nom:1
$PrénomUtilisateur:=[Utilisateur:17]Prenom:2
$NuméroLicence:=[Utilisateur:17]NumLicence:12

Verif_Code(->[Utilisateur:17]NumLicence:12; ->x_Etat; ->x_Ref; ->x_Date; ->x_Divers)

If (($NomUtilisateur="") | ($PrénomUtilisateur="") | ($NuméroLicence=""))
	Kle_Alerte(Get indexed string:C510(<>strlang; 187))
	
Else 
	B_Serie:=[Utilisateur:17]NumLicence:12
	Verif_Code(->B_Serie; ->x_Etat; ->x_Ref; ->x_Date; ->x_Divers)
	//$result:=IM_Serial_Get (9237;Majusc($NomUtilisateur);Majusc($PrénomUtilisateur);$NuméroLicence)
	If (x_Etat=-1)
		Kle_Alerte(Get indexed string:C510(<>strlang; 188))
		<>Flag_demo:=True:C214
	Else 
		<>Recommence:=False:C215
		<>Flag_demo:=False:C215
		<>Serialisation:="Enregistré"
		
		WebServ_Inscription
		
		ACCEPT:C269
	End if 
End if 