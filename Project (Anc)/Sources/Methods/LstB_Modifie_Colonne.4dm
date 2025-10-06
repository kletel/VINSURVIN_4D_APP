//%attributes = {}
//$Txt:=""
//$Txt_Ref:=""
//TABLEAU POINTEUR($tabVarCols;0)
//TABLEAU POINTEUR($tabVarEntetes;0)
//TABLEAU POINTEUR($tabStyles;0)
//TABLEAU BOOLEEN($tabVisibles;0)
//TABLEAU TEXTE($tabNomsCols;0)
//TABLEAU TEXTE($tabNomsEntetes;0)
//
//C_ENTIER LONG($type)
//C_ENTIER LONG($long)
//C_BOOLEEN($indexe)
//C_BOOLEEN($unique)
//
//Au cas ou 
//: ($2="Colonne")
//LIRE TABLEAUX LISTBOX(Colonne;$tabNomsCols;$tabNomsEntetes;$tabVarCols;$tabVarEntetes;$tabVisibles;$tabStyles)
//Fin de cas 
//$nbcol:=0
//TABLEAU ALPHA(40;$LstNom;0)
//INSERER DANS TABLEAU($LstNom;1;Taille tableau($tabVarCols))
//Boucle ($i;1;Taille tableau($tabVarCols))
//RESOUDRE POINTEUR($tabVarCols{$i};$LstNom{$i};$v2;$v3)
//Fin de boucle 
//Boucle ($i;1;Lire numero dernier champ(Table($1)))
//$nb:=0
//$nb:=Table($1)
//LIRE PROPRIETES CHAMP($nb;$i;$type;$long;$indexe;$unique;$visible)
//Si ($visible=Faux)
//$po:=Chercher dans tableau($LstNom;$2+Chaine($i))
//$Txt:=$Txt+Nom du champ(Table($1);$i)
//$Txt_Ref:=$Txt_Ref+Chaine($i)+";"
//Si ($po>0)
//$nbcol:=$nbcol+1
//$Txt:=$Txt+"!"+Caractere(18)+";"
//Sinon 
//$Txt:=$Txt+";"
//Fin de si 
//Fin de si 
//Fin de boucle 
//$ref_Colonne:=Pop up menu($txt)
//Si ($ref_Colonne>0)
//$nom:=Rech_Valeur_PopUp ($ref_Colonne;$Txt)
//$Ref_Col:=Rech_Valeur_PopUp ($ref_Colonne;$Txt_Ref)
//
//Au cas ou 
//: ($2="Colonne")
//Si (Position("!";$nom)>0)  `Il faut supprimer la colonne
//Si ($nbcol>1)
//SUPPRIMER COLONNE LISTBOX(Colonne;Chercher dans tableau($LstNom;$2+$Ref_Col))
//Fin de si 
//Sinon   `On Ajoute la colonne
//$nom_obj:=$2+$Ref_Col
//$haut:=0
//TAILLE OBJET OPTIMALE(*;$nom_obj;$larg;$haut)
//$Der:=Lire nombre colonnes listbox(Colonne)+1
//INSERER COLONNE LISTBOX(Colonne;$Der;$2+$Ref_Col;Pointeur vers($2+$Ref_Col)->;"Entete"+$Ref_Col;Pointeur vers("Entete"+$Ref_Col)->)
//TITRE BOUTON(Pointeur vers("Entete"+$Ref_Col)->;$nom)
//
//CHANGER JEU DE CARACTERES(Pointeur vers($2+$Ref_Col)->;"Lucida grande")
//  `Permet de passer la colonne ajoutée en non saisissable en liste
//CHOIX SAISISSABLE(*;$2+$Ref_Col;Faux)
//CHANGER TAILLE(Pointeur vers($2+$Ref_Col)->;9)
//CHANGER STYLE(Pointeur vers($2+$Ref_Col)->;0)
//CHANGER JEU DE CARACTERES(Pointeur vers("Entete"+$Ref_Col)->;"Arial")
//CHANGER TAILLE(Pointeur vers("Entete"+$Ref_Col)->;10)
//CHANGER STYLE(Pointeur vers("Entete"+$Ref_Col)->;1)
//TAILLE OBJET OPTIMALE(Pointeur vers("Entete"+$Ref_Col)->;$larg;$haut)
//Si ($larg>0)
//FIXER LARGEUR COLONNE LISTBOX(Pointeur vers($2+$Ref_Col)->;$larg)
//Fin de si 
//Fin de si 
//Fin de cas 
//Fin de si 
//Au cas ou 
//: ($2="Colonne")
//CHERCHER PAR TABLEAU([Cave]Ref_Cave;Colonne0)
//LstB_Affiche_Selection (->[Cave];"Colonne")
//
//Fin de cas 
