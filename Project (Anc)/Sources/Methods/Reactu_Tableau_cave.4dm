//%attributes = {}
//Nb1:=0
//Nb2:=0
//Nb3:=0
//TABLEAU POINTEUR($tabVarCols;0)
//TABLEAU POINTEUR($tabVarEntetes;0)
//TABLEAU POINTEUR($tabStyles;0)
//TABLEAU BOOLEEN($tabVisibles;0)
//TABLEAU TEXTE($tabNomsCols;0)
//TABLEAU TEXTE($tabNomsEntetes;0)
//
//LIRE TABLEAUX LISTBOX(Colonne;$tabNomsCols;$tabNomsEntetes;$tabVarCols;$tabVarEntetes;$tabVisibles;$tabStyles)
//TABLEAU ALPHA(40;$LstNom;0)
//INSERER DANS TABLEAU($LstNom;1;Taille tableau($tabVarCols))
//Boucle ($i;1;Taille tableau($tabVarCols))
//RESOUDRE POINTEUR($tabVarCols{$i};$LstNom{$i};$v2;$v3)
//Fin de boucle 
//
//
//Boucle ($i;Taille tableau(Colonne0);1;-1)
//CHERCHER([Cave];[Cave]Ref_Cave=Colonne0{$i})
//Si (Enregistrements trouves([Cave])=0)
//  `Element supprimer 
//SUPPRIMER LIGNE LISTBOX(Colonne;$i)
//Sinon 
//
//Nb1:=Nb1+[Cave]Reste_en_Cave
//Au cas ou 
//: (◊Monaie="FRF")
//Nb2:=Nb2+([Cave]Reste_en_Cave*[Cave]Prix_Achat)
//Nb3:=Nb3+([Cave]Reste_en_Cave*[Cave]Valeur)
//CHOIX FORMATAGE(Nb2;"### ##0,00 F")
//CHOIX FORMATAGE(Nb3;"### ##0,00 F")
//
//: (◊Monaie="EUR")
//Nb2:=Nb2+([Cave]Reste_en_Cave*[Cave]Prix_Achat_Euro)
//Nb3:=Nb3+([Cave]Reste_en_Cave*[Cave]Valeur_Euro)
//CHOIX FORMATAGE(Nb2;"### ##0,00 €")
//CHOIX FORMATAGE(Nb3;"### ##0,00 €")
//
//Sinon 
//Nb2:=Nb2+([Cave]Reste_en_Cave*[Cave]Prix_Achat_Euro)
//Nb3:=Nb3+([Cave]Reste_en_Cave*[Cave]Valeur_Euro)
//CHOIX FORMATAGE(Nb2;"### ##0,00")
//CHOIX FORMATAGE(Nb3;"### ##0,00")
//
//Fin de cas 
//
//
//Boucle ($j;1;Lire numero dernier champ(Table(2)))
//$po:=Chercher dans tableau($LstNom;"Colonne"+Chaine($j))
//Si ($po>0)
//$po:=Num(Sous chaine($LstNom{$po};8))
//Au cas ou 
//: ($Po=1)
//Colonne1{$i}:=Champ(2;$j)->
//: ($Po=2)
//Colonne2{$i}:=Champ(2;$j)->
//: ($Po=3)
//Colonne3{$i}:=Champ(2;$j)->
//: ($Po=4)
//Colonne4{$i}:=Champ(2;$j)->
//: ($Po=5)
//Colonne5{$i}:=Champ(2;$j)->
//: ($Po=6)
//Colonne6{$i}:=Champ(2;$j)->
//: ($Po=7)
//Colonne7{$i}:=Champ(2;$j)->
//: ($Po=8)
//Colonne8{$i}:=Champ(2;$j)->
//: ($Po=9)
//Colonne9{$i}:=Champ(2;$j)->
//: ($Po=10)
//Colonne10{$i}:=Champ(2;$j)->
//: ($Po=11)
//Colonne11{$i}:=Champ(2;$j)->
//: ($Po=12)
//Colonne12{$i}:=Champ(2;$j)->
//: ($Po=13)
//Colonne13{$i}:=Champ(2;$j)->
//: ($Po=14)
//Colonne14{$i}:=Champ(2;$j)->
//: ($Po=15)
//Colonne15{$i}:=Champ(2;$j)->
//: ($Po=16)
//Colonne16{$i}:=Champ(2;$j)->
//: ($Po=17)
//Colonne17{$i}:=Champ(2;$j)->
//: ($Po=18)
//Colonne18{$i}:=Champ(2;$j)->
//: ($Po=19)
//Colonne19{$i}:=Champ(2;$j)->
//: ($Po=20)
//Colonne20{$i}:=Champ(2;$j)->
//: ($Po=21)
//Colonne21{$i}:=Champ(2;$j)->
//: ($Po=22)
//Colonne22{$i}:=Champ(2;$j)->
//: ($Po=23)
//Colonne23{$i}:=Champ(2;$j)->
//: ($Po=24)
//Colonne24{$i}:=Champ(2;$j)->
//: ($Po=25)
//Colonne25{$i}:=Champ(2;$j)->
//: ($Po=26)
//Colonne26{$i}:=Champ(2;$j)->
//: ($Po=27)
//Colonne27{$i}:=Champ(2;$j)->
//: ($Po=28)
//Colonne28{$i}:=Champ(2;$j)->
//: ($Po=29)
//Colonne29{$i}:=Champ(2;$j)->
//: ($Po=30)
//Colonne30{$i}:=Champ(2;$j)->
//: ($Po=31)
//Colonne31{$i}:=Champ(2;$j)->
//: ($Po=32)
//Colonne32{$i}:=Champ(2;$j)->
//: ($Po=33)
//Colonne33{$i}:=Champ(2;$j)->
//: ($Po=34)
//Colonne34{$i}:=Champ(2;$j)->
//: ($Po=35)
//Colonne35{$i}:=Champ(2;$j)->
//: ($Po=36)
//Colonne36{$i}:=Champ(2;$j)->
//: ($Po=37)
//Colonne37{$i}:=Champ(2;$j)->
//: ($Po=38)
//Colonne38{$i}:=Champ(2;$j)->
//: ($Po=39)
//Colonne39{$i}:=Champ(2;$j)->
//: ($Po=40)
//Colonne40{$i}:=Champ(2;$j)->
//: ($Po=41)
//Colonne41{$i}:=Champ(2;$j)->
//: ($Po=42)
//Colonne42{$i}:=Champ(2;$j)->
//: ($Po=43)
//Colonne43{$i}:=Champ(2;$j)->
//: ($Po=44)
//Colonne44{$i}:=Champ(2;$j)->
//: ($Po=45)
//Colonne45{$i}:=Champ(2;$j)->
//: ($Po=46)
//Colonne46{$i}:=Champ(2;$j)->
//: ($Po=47)
//Colonne47{$i}:=Champ(2;$j)->
//Fin de cas 
//
//
//Fin de si 
//Fin de boucle 
//Fin de si 
//Fin de boucle 
