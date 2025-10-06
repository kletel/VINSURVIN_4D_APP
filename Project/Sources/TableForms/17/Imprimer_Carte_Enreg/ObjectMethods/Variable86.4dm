//UTILISER PARAMETRES IMPRESSION([Utilisateur];"Portrait")
//PARAMETRES IMPRESSION
//
//C_ENTIER($a;$b;$c)
//PROPRIETES PLATE FORME(◊PlateForme;$b;$c)
//Si (OK=1)
//`NuméroEnregistrement:=111_Numéro_Enregistrement (Majusc([Utilisateur]Nom);Majusc([Utilisateur]Prenom);[Utilisateur]NumLicence)
//Si (◊PlateForme=Windows )
//TypeMatériel:="PC"
//Sinon 
//TypeMatériel:="Mac"
//Fin de si 
//FORMULAIRE SORTIE([Utilisateur];"Carte_Enregistrement")
//IMPRIMER ENREGISTREMENT([Utilisateur];*)
//FORMULAIRE SORTIE([Utilisateur];"Saisie")
//[Utilisateur]CarteImprimée:=Vrai
//VALIDER
//Fin de si 
