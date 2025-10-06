//%attributes = {}
_O_C_INTEGER:C282($a; $b; $c)
DEFAULT TABLE:C46([Interface:1])
$Larg:=Screen width:C187
If ($Larg>700)
	$Larg:=700
End if 



_O_PLATFORM PROPERTIES:C365($a; $b; $c)
If ($a#3)
	C_LONGINT:C283($L_left; $L_top; $L_right; $L_bottom; $L_lastColor)
	//tp_AVAILABLE WINDOW RECT ($L_left;$L_top;$L_right;$L_bottom)
	//COORDONNEES FENETRE($L_left;$L_top;$L_right;$L_bottom)
	// 
	//CHANGER COORDONNEES FENETRE($L_left;$L_top+22;$L_right;$L_bottom)
Else 
	$L_bottom:=Screen height:C188
End if 


Open window:C153(0; 70; $Larg; $L_bottom; 8; Get indexed string:C510(<>strLang; 3); "Fermer")

//Creer fenetre(0;190;$Larg;Hauteur ecran;8;◊LangueOff{3};"Fermer")
SET MENU BAR:C67(<>Langue)
FORM SET OUTPUT:C54([Interface:1]; "Vos_degustation")
FORM SET INPUT:C55([Interface:1]; "Vos_degustation")

FORM SET OUTPUT:C54([Degustation:12]; "Sortie")
FORM SET INPUT:C55([Degustation:12]; "Saisie_Degust")

ADD RECORD:C56([Interface:1]; *)
