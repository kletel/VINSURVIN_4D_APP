//$rep:=Pop up menu("Amateur;Expert")
//Au cas ou 
//: ($rep=1)
//Mode_Normal 
//: ($rep=2)
//Mode_Expert 
//Fin de cas 
//
//$ref:=Creer fenetre formulaire([Interface];"kle_proexpert")
//DIALOGUE([Interface];"kle_proexpert")
V_Masque:="Masque_1"
//p_Cave 
V_Aff_Titre:=Get indexed string:C510(<>strLang; 2)
Init_Var_Interface
VInterface_1:=1
ACCEPT:C269
