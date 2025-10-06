//%attributes = {}
//$Txt:=""
//$Txt_Ref:=""
//TABLEAU POINTEUR($tabVarCols;0)
//TABLEAU POINTEUR($tabVarEntetes;0)
//TABLEAU POINTEUR($tabStyles;0)
//TABLEAU BOOLEEN($tabVisibles;0)
//TABLEAU TEXTE($tabNomsCols;0)
//TABLEAU TEXTE($tabNomsEntetes;0)
//Au cas ou 
//: ($2="Colonne")
//LIRE TABLEAUX LISTBOX(Colonne;$tabNomsCols;$tabNomsEntetes;$tabVarCols;$tabVarEntetes;$tabVisibles;$tabStyles)
//
//Fin de cas 
//
//TABLEAU ALPHA(40;$LstNom;0)
//INSERER DANS TABLEAU($LstNom;1;Taille tableau($tabVarCols))
//Boucle ($i;1;Taille tableau($tabVarCols))
//RESOUDRE POINTEUR($tabVarCols{$i};$LstNom{$i};$v2;$v3)
//Fin de boucle 
//
//Boucle ($i;1;Lire numero dernier champ(Table($1)))
//$po:=Chercher dans tableau($LstNom;$2+Chaine($i))
//Si ($po>0)
//SELECTION VERS TABLEAU(Champ(Table($1);$i)->;Pointeur vers($2+Chaine($i))->)
//Fin de si 
//Fin de boucle 
//
//Au cas ou 
//  `: ($2="Colonne")
//  `SELECTION VERS TABLEAU([Cave]Ref_Cave;Colonne0)
//  `Boucle ($i;1;Taille tableau(Colonne))
//  `Colonne{$i}:=Faux
//  `Fin de boucle 
//Fin de cas 
