//%attributes = {}
C_DATE:C307(x_Date)
C_TEXT:C284(B_Serie; x_Divers)
C_REAL:C285(x_Etat; x_Ref)

<>Flag_demo:=False:C215

SET WINDOW TITLE:C213(" ")
SET MENU BAR:C67(1)
<>reffen:=Window process:C446
HIDE WINDOW:C436(<>reffen)



// P_CheckConfig   // Modifié par : Seb (22/02/11)

If (<>changementdatabase=False:C215)
	//P_RunAppStorePlugin   // Modifié par : Seb (22/02/11)
	
	
	Init_DataBase
	
	Calcul_Qu_Region
	//import_Donnees
	
	MESSAGES OFF:C175
	QUERY:C277([Interface:1]; [Interface:1]Rubrique1:1="Serie")
	If (Records in selection:C76([Interface:1])=0)
		CREATE RECORD:C68([Interface:1])
		[Interface:1]Rubrique1:1:="Serie"
		[Interface:1]Nb_Util:3:=0
	End if 
	[Interface:1]Nb_Util:3:=[Interface:1]Nb_Util:3+1
	$Nb:=[Interface:1]Nb_Util:3
	
	
	ALL RECORDS:C47([Utilisateur:17])
	B_Serie:=[Utilisateur:17]NumLicence:12
	
	//Vérifier_Enregistrement 
	
	
	
	//Si (receiptisgood=Faux)
	x_Etat:=-1
	//Sinon 
	x_Etat:=0
	//
	//Fin de si 
	
	If (x_Etat=-1)
		Verif_Code(->B_Serie; ->x_Etat; ->x_Ref; ->x_Date; ->x_Divers)
	End if 
	x_Etat:=0
	Case of 
		: (x_Etat=-1)
			
			<>Serialisation:=""
			$ref_F:=Open form window:C675([Utilisateur:17]; "Saisie")
			FORM SET INPUT:C55([Utilisateur:17]; "Saisie")
			SET WINDOW TITLE:C213(Get indexed string:C510(<>strLang; 281))
			FORM SET OUTPUT:C54([Utilisateur:17]; "Saisie")
			
			ALL RECORDS:C47([Utilisateur:17])
			If (Records in selection:C76([Utilisateur:17])=0)
				ADD RECORD:C56([Utilisateur:17])
			Else 
				MODIFY RECORD:C57([Utilisateur:17])
			End if 
			[Interface:1]Serie:2:=[Utilisateur:17]NumLicence:12
			B_Serie:=[Interface:1]Serie:2
			SAVE RECORD:C53([Interface:1])
			UNLOAD RECORD:C212([Interface:1])
			CLOSE WINDOW:C154
			If (<>Flag_demo=False:C215)
				QUIT 4D:C291
			End if 
			
		: (x_Etat=0)
			<>Serialisation:="Enregistré"
	End case 
	
	
	SET WINDOW TITLE:C213(" ")
	SET MENU BAR:C67(1)
	<>reffen:=Window process:C446
	HIDE WINDOW:C436(<>reffen)
	
	SET ABOUT:C316(Get indexed string:C510(<>strLang; 18); "p_APropos")
	//◊mainproc:=Nouveau process("Palette";32000;"Palette")
	<>Cave:=0
	<>Cepage:=0
	<>Mets:=0
	<>Vocab:=0
	<>Present:=0
	<>Carte:=0
	<>Millesime:=0
	<>Region:=0
	<>Monaie:="EUR"
	
	
	//$ref_Fen:=Creer fenetre formulaire([Interface];"kle_proexpert";-1)
	//DIALOGUE([Interface];"kle_proexpert")
	//FERMER FENETRE($ref_Fen)
	Mode_Expert
	Init_Var_Interface
	VInterface_1:=1
	V_Masque:="Masque_1"
	
	DEFAULT TABLE:C46([Interface:1])
	$Larg:=Screen width:C187
	If ($Larg>1024)
		$Larg:=1024
	End if 
	_O_C_INTEGER:C282($a; $b; $c)
	
	_O_PLATFORM PROPERTIES:C365($a; $b; $c)
	
	
	$Dock_Taille:=0
	$Dock_Position:=""
	$Left:=1
	// Le methodes de test $Dock
	If ($a#3)
		$command:="defaults read com.apple.dock tilesize"
		$in:=""
		$out:=""
		LAUNCH EXTERNAL PROCESS:C811($command; $in; $out)
		If ($out#"")
			$out:=Replace string:C233($out; Char:C90(Retour à la ligne:K15:40); "")  //enlever les retours à la ligne
			$Dock_Taille:=Num:C11($out)
		End if 
		
		$T_Command:="defaults read com.apple.dock orientation -string"
		$in:=""
		$out:=""
		LAUNCH EXTERNAL PROCESS:C811($T_Command; $in; $out)
		If ($out#"")
			$Dock_Position:=Replace string:C233($out; Char:C90(Retour à la ligne:K15:40); "")  //enlever les retours à la ligne
		End if 
	Else 
		
	End if 
	
	
	Case of 
		: ($Dock_Position="Left")
			$Left:=$Dock_Taille
			$Dock_Taille:=0
		: ($Dock_Position="Right")
			$Dock_Taille:=0
			
		Else 
			$Dock_Taille:=Int:C8($Dock_Taille*2/3)+$Dock_Taille
			
	End case 
	If ($a#3)
		$L_bottom:=Screen height:C188-$Dock_Taille
		If ($L_bottom<750)
			$L_bottom:=750
		End if 
		//C_ENTIER LONG($L_left;$L_top;$L_right;$L_bottom;$L_lastColor)
		//tp_AVAILABLE WINDOW RECT($L_left;$L_top;$L_right;$L_bottom)
		//COORDONNEES FENETRE($L_left;$L_top;$L_right;$L_bottom)
		// 
		//CHANGER COORDONNEES FENETRE($L_left;$L_top+22;$L_right;$L_bottom)
	Else 
		$L_bottom:=Screen height:C188
	End if 
	
	SET MENU BAR:C67(1)
	_O_PLATFORM PROPERTIES:C365($a; $b; $c)
	If ($a#3)
		$REF:=Open window:C153($Left+1; 43; $Larg+$Left; $L_bottom; Fenêtre standard:K34:13; Get indexed string:C510(<>strLang; 6); "Fermer")  //MAC
	Else 
		$REF:=Open window:C153($Left+1; 50; $Larg+$Left; $L_bottom; Fenêtre standard:K34:13; Get indexed string:C510(<>strLang; 6); "Fermer")  //PC
	End if 
	
	Bt_Cave:=0
	Bt_Ann:=0
	Bt_Eff:=0
	
	ALL RECORDS:C47([Cave:2])
	
	Lst_Pays_H:=New list:C375
	
	VInterface_Qui:=0
	While (VInterface_Qui=0)
		Case of 
			: (VInterface_1=1)  //Votre CAVE
				
				SET WINDOW TITLE:C213(Get indexed string:C510(<>strLang; 6))
				Bt_Aj:=0
				
				V_Aff_Titre:=Get indexed string:C510(<>strLang; 2)
				SET MENU BAR:C67(1)
				FORM SET OUTPUT:C54([Interface:1]; "Liste Cave")
				FORM SET INPUT:C55([Interface:1]; "Liste Cave")
				
				DIALOG:C40([Interface:1]; "Liste Cave")
				
			: (VInterface_2=1)  //VOS DEGUSTATIONS
				SET WINDOW TITLE:C213(Get indexed string:C510(<>strLang; 3))
				FORM SET OUTPUT:C54([Interface:1]; "Vos_degustation")
				FORM SET INPUT:C55([Interface:1]; "Vos_degustation")
				
				FORM SET OUTPUT:C54([Degustation:12]; "Sortie")
				FORM SET INPUT:C55([Degustation:12]; "Saisie_Degust")
				
				DIALOG:C40([Interface:1]; "Vos_degustation")
				
			: (VInterface_3=1)  //PRODUCTEURS
				SET WINDOW TITLE:C213(Get indexed string:C510(<>strLang; 12))
				
				FORM SET INPUT:C55([Interface:1]; "Producteurs")
				FORM SET INPUT:C55([Producteur:13]; "Entrée2")
				ADD RECORD:C56([Interface:1]; *)
				
			: (VInterface_4=1)  // Mets et Vins
				SET WINDOW TITLE:C213(Get indexed string:C510(<>strLang; 5))
				DIALOG:C40([Interface:1]; "Mets")
				CLEAR LIST:C377(Lst_Cat; *)
				
			: (VInterface_5=1)  //Bien gérer sa cave
				SET WINDOW TITLE:C213(Get indexed string:C510(<>strLang; 6))
				FORM SET INPUT:C55([Interface:1]; "Bien_Gerer")
				FORM SET OUTPUT:C54([Interface:1]; "Bien_Gerer")
				ADD RECORD:C56([Interface:1]; *)
				
			: (VInterface_6=1)  //Degustation
				SET WINDOW TITLE:C213(Get indexed string:C510(<>strLang; 6))
				FORM SET INPUT:C55([Interface:1]; "Degustation")
				FORM SET OUTPUT:C54([Interface:1]; "Degustation")
				ADD RECORD:C56([Interface:1]; *)
				
			: (VInterface_7=1)  //Cepages
				SET WINDOW TITLE:C213(Get indexed string:C510(<>strLang; 8))
				FORM SET INPUT:C55([Interface:1]; "Cépages")
				FORM SET OUTPUT:C54([Interface:1]; "Cépages")
				ADD RECORD:C56([Interface:1]; *)
				
			: (VInterface_8=1)  //Vocabulmaire
				SET WINDOW TITLE:C213(Get indexed string:C510(<>strLang; 9))
				DIALOG:C40([Interface:1]; "Dictionnaire")
				
			: (VInterface_9=1)  //Millesimes
				SET WINDOW TITLE:C213(Get indexed string:C510(<>strLang; 10))
				FORM SET INPUT:C55([Interface:1]; "Millésimes")
				ADD RECORD:C56([Interface:1])
				
			: (VInterface_10=1)
				SET WINDOW TITLE:C213(Get indexed string:C510(<>strLang; 10))
				DIALOG:C40([Interface:1]; "Carte")
				CLEAR LIST:C377(Lst_Pays_H; *)
				
			: (VInterface_11=1)
				
			: (VInterface_12=1)
				DIALOG:C40([Interface:1]; "Web")
			: (VInterface_13=1)
			: (VInterface_14=1)
			: (VInterface_15=1)
		End case 
	End while 
End if 