Case of 
	: (Form event code:C388=Sur clic:K2:4)
		//ENREGISTREMENT SUIVANT([Cave])
		
End case 

//Au cas ou 
//: (Evenement formulaire=Sur chargement )
//Aff_Btn_Fiche_Cave 
//
//: (Evenement formulaire=Sur clic )
//STOCKER ENREGISTREMENT([Cave])
//v_Position:=v_Position+1
//Si (v_Position>Taille tableau(Colonne0))
//v_Position:=Taille tableau(Colonne0)
//Fin de si 
//Si (v_Position#0)
//CHERCHER([Cave];[Cave]Ref_Cave=Colonne0{v_Position})
//Fin de si 
//Aff_Btn_Fiche_Cave 
//REDESSINER FENETRE
//ALLER A PAGE(1)
//Ong_Cave:=1
//
//Fin de cas 