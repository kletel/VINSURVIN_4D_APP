//%attributes = {"publishedWeb":true}
C_LONGINT:C283($result)
_O_C_STRING:C293(80; $NuméroSérie; $NumLicence; $1)


$NumLicence:=$1
$NuméroSérie:=$NumLicence
//
//$result:=IM_Serial_Check (9237;$NuméroSérie)
//Si ($result=8569)  `381
//STOCKER ENREGISTREMENT([Utilisateur])
//
//C_ENTIER($a;$b;$c)
//PROPRIETES PLATE FORME(◊PlateForme;$b;$c)
//Si (◊PlateForme=Windows )
//888_Fenêtre (480;168;4;"";"";Faux)
//Sinon 
//888_Fenêtre (431;172;4;"";"";Faux)
//Fin de si 
//
//CHANGER TITRE FENETRE(◊LangueOff{280})
//FORMULAIRE ENTREE([Utilisateur];"Imprimer_Carte_Enreg")
//MODIFIER ENREGISTREMENT([Utilisateur];*)
//CHANGER TITRE FENETRE("")
//FERMER FENETRE
//
//LIBERER ENREGISTREMENT([Utilisateur])
//  `Sinon 
//  `Kle_Confirmer (Lire chaine dans liste(<>strLang;303)
//  `Si (Ok=1)
//  `UTILISER PARAMETRES IMPRESSION([Utilisateur];"Portrait")
//  `PARAMETRES IMPRESSION
//  `
//  `C_ENTIER($a;$b;$c)
//  `PROPRIETES PLATE FORME(◊PlateForme;$b;$c)
//  `
//  `NuméroEnregistrement:=111_Numéro_Enregistrement (Majusc([Utilisateur]Nom);Majusc([Utilisateur]Prénom);[Utilisateur]NumLicence)
//  `Si (◊PlateForme=Windows )
//  `TypeMatériel:="PC"
//  `Sinon 
//  `TypeMatériel:="Mac"
//  `Fin de si 
//  `FORMULAIRE SORTIE([Utilisateur];"Carte_Enregistrement")
//  `IMPRIMER ENREGISTREMENT([Utilisateur];*)
//  `FORMULAIRE SORTIE([Utilisateur];"Saisie")
//  `Fin de si 
//Fin de si 