//%attributes = {}
DEFAULT TABLE:C46([Interface:1])
$La:=Int:C8((Screen width:C187-437)/2)
$ho:=Int:C8((Screen height:C188-340)/2)
$ref:=Open form window:C675([Interface:1]; "A_Propos"; Form dialogue modal:K39:7)
QUERY:C277([Utilisateur:17]; [Utilisateur:17]Nom:1="@")
//NuméroEnregistrement:=111_Numéro_Enregistrement (Majusc([Utilisateur]Nom);Majusc([Utilisateur]Prenom);[Utilisateur]NumLicence)
DIALOG:C40("A_Propos")