//%attributes = {}
Nb1:=0
Nb2:=0
Nb3:=0

FIRST RECORD:C50([Cave:2])
While (Not:C34(End selection:C36([Cave:2])))
	Nb1:=Nb1+[Cave:2]Reste_en_Cave:19
	//Case of 
	//: (<>Monaie="FRF")
	//Nb2:=Nb2+([Cave]Reste_en_Cave*[Cave]Prix_Achat)
	//Nb3:=Nb3+([Cave]Reste_en_Cave*[Cave]Valeur)
	//OBJECT SET FORMAT(Nb2;"### ##0.00 F")
	//OBJECT SET FORMAT(Nb3;"### ##0.00 F")
	//
	//: (<>Monaie="EUR")
	//Nb2:=Nb2+([Cave]Reste_en_Cave*[Cave]Prix_Achat_Euro)
	//Nb3:=Nb3+([Cave]Reste_en_Cave*[Cave]Valeur_Euro)
	//OBJECT SET FORMAT(Nb2;"### ##0.00 €")
	//OBJECT SET FORMAT(Nb3;"### ##0.00 €")
	
	//Else 
	Nb2:=Nb2+([Cave:2]Reste_en_Cave:19*[Cave:2]Prix_Achat_Euro:20)
	Nb3:=Nb3+([Cave:2]Reste_en_Cave:19*[Cave:2]Valeur_Euro:23)
	//OBJECT SET FORMAT(Nb2;"### ##0.00")
	//OBJECT SET FORMAT(Nb3;"### ##0.00")
	
	//End case 
	
	NEXT RECORD:C51([Cave:2])
End while 

LstB_Affiche_Selection(->[Cave:2]; "Lst_Cave")
//Case of 
//: (<>Monaie="FRF")
//
//
//: (<>Monaie="EUR")
//
//End case 