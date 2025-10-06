

$NomUtilisateur:=[Utilisateur:17]Nom:1
$PrénomUtilisateur:=[Utilisateur:17]Prenom:2
$NuméroLicence:=[Utilisateur:17]NumLicence:12
//$result:=IM_Serial_Get (3491;Majusc($NomUtilisateur);Majusc($PrénomUtilisateur);$NuméroLicence)
$txt:="["+$NomUtilisateur+"]"+"["+$PrénomUtilisateur+"]"+"["+$NuméroLicence+"]"  // + "["+Chaine($result)+"]"

SET TEXT TO PASTEBOARD:C523($txt)

