If (<>ModeUtilisation=0)
	Mode_Normal
Else 
	Mode_Expert
End if 
CREATE SET:C116([Cave:2]; "Tmp_Cave")
CREATE EMPTY SET:C140([Cave:2]; "User_select")
ADD RECORD:C56([Cave:2]; *)

//Si (Bt_Imp#1)
//Tant que (Bt_Ann=0) & (Bt_Cave=0) & (Bt_Eff=0)
//AJOUTER ENREGISTREMENT([Cave])
//Fin tant que 
//SUPPRIMER MESSAGES
//
//CHERCHER([Cave];[Cave]Cave=◊CategorieCave)
//
//TRIER([Cave];[Cave]Nom;>)
//Fin de si 

ADD TO SET:C119([Cave:2]; "Tmp_Cave")
ADD TO SET:C119([Cave:2]; "User_select")
//
//ALLER A DERNIER ENREGISTREMENT([Cave])
//ALLER DANS SELECTION([Cave];<>NumEnrCourant)
//ADJOINDRE ELEMENT([Cave];"User_select")
USE SET:C118("User_select")
LISTBOX SELECT ROW:C912(*; "Lst_Cave"; <>NumEnrCourant; lk remplacer sélection:K53:1)
USE SET:C118("Tmp_Cave")
OBJECT SET SCROLL POSITION:C906(*; "Lst_Cave"; <>NumEnrCourant; *)
//CHARGER ENREGISTREMENT([Cave])

//$ligne:=Taille tableau(Colonne)+1
//INSERER LIGNE LISTBOX(Colonne;$ligne)
//Colonne0{$ligne}:=[Cave]Ref_Cave
//  `CHERCHER([Cave];[Cave]Cave=◊CategorieCave)
//  `calcul_Valeure 
//Reactu_Tableau_cave 