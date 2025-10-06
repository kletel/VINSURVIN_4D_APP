
V_Aff_Titre:=Get indexed string:C510(<>strLang; 308)
V_Masque:="Masque_11"
$ref:=Pop up menu:C542(Get indexed string:C510(<>strLang; 300))

Case of 
	: ($ref=1)
		//p_Cepage 
		Init_Var_Interface
		VInterface_7:=1
		ACCEPT:C269
		
	: ($ref=2)
		//p_Vocab 
		Init_Var_Interface
		VInterface_8:=1
		ACCEPT:C269
		
	: ($ref=3)
		//p_Millesimes 
		Init_Var_Interface
		VInterface_9:=1
		ACCEPT:C269
		
End case 

