Case of 
	: (Form event code:C388=Sur fermeture corps:K2:24)
		SELECTION TO ARRAY:C260([Cave:2]Ref_Cave:26; $Tab_Cav)
		QUERY WITH ARRAY:C644([Cave:2]Ref_Cave:26; $Tab_Cav)
		calcul_Valeure
		v_Position:=0
		
	: (Form event code:C388=Sur redimensionnement:K2:27)
		//Redeplace Btn 
		Lst_Cave_Redim_Interface
		v_Redim:=True:C214
	: (Form event code:C388=Sur chargement:K2:1)
		V_Cave_Init_Pays:=""
		V_Cave_Init_Type:=""
		V_Cave_Init_Region:=""
		v_Redim:=False:C215
		//Img_Lst:=SVG_New 
		
		OBJECT SET VISIBLE:C603(Img_Lst_Svg; False:C215)
		OBJECT SET VISIBLE:C603(Lst_Cave; True:C214)
		
		QUERY:C277([Interface:1]; [Interface:1]Rubrique1:1="Affichage_Liste_Vin")
		If (Records in selection:C76([Interface:1])=0)
			CREATE RECORD:C68([Interface:1])
			[Interface:1]Rubrique1:1:="Affichage_Liste_Vin"
			[Interface:1]vuedefaut:9:=1
			SAVE RECORD:C53([Interface:1])
		End if 
		
		Type_Affichage:=[Interface:1]vuedefaut:9
		
		
		DEFAULT TABLE:C46([Cave:2])
		If (<>ModeUtilisation=0)
			Mode_Normal
		Else 
			Mode_Expert
		End if 
		
		Cave_Init_enum
		
		If (Type_Affichage=2)
			SET TIMER:C645(1)
		End if 
		SET WINDOW TITLE:C213(Get indexed string:C510(<>strLang; 2))
		
		//Redeplace Btn 
		Lst_Cave_Redim_Interface
		
		MESSAGES OFF:C175
		ALL RECORDS:C47([Cave:2])
		ORDER BY:C49([Cave:2]; [Cave:2]Cave:40; >)
		DISTINCT VALUES:C339([Cave:2]Cave:40; Pop_Cave)
		DISTINCT VALUES:C339([Cave:2]Cave:40; Pop_Cave2)
		
		INSERT IN ARRAY:C227(Pop_Cave; 1; 4)
		Pop_Cave{1}:=Get indexed string:C510(<>strLang; 278)
		Pop_Cave{2}:=Get indexed string:C510(<>strLang; 279)
		Pop_Cave{3}:=Get indexed string:C510(<>strLang; 343)
		Pop_Cave{4}:="-"
		MESSAGES OFF:C175
		//TOUT SELECTIONNER([Cave])
		If (Size of array:C274(Pop_Cave)>4)
			QUERY:C277([Cave:2]; [Cave:2]Cave:40=Pop_Cave{5})
			Pop_Cave:=5
			<>CategorieCave:=Pop_Cave{Pop_Cave}
		Else 
			INSERT IN ARRAY:C227(Pop_Cave; 5; 1)
			Pop_Cave{5}:=Get indexed string:C510(<>strLang; 156)
			Pop_Cave:=5
			<>CategorieCave:=Pop_Cave{Pop_Cave}
			ALL RECORDS:C47([Cave:2])
		End if 
		
		QUERY:C277([Interface:1]; [Interface:1]Rubrique1:1="Cave_Defaut")
		If (Records in selection:C76([Interface:1])=1)
			<>CategorieCave:=[Interface:1]cavedefaut:8
			Pop_Cave:=Find in array:C230(Pop_Cave; <>CategorieCave)
			If (Pop_Cave>0)
				cochecavedefaut:=1
			Else 
				cochecavedefaut:=0
			End if 
		Else 
			cochecavedefaut:=0
		End if 
		
		
		
		QUERY:C277([Cave:2]; [Cave:2]Cave:40=<>CategorieCave)
		
		ORDER BY:C49([Cave:2]; [Cave:2]Nom:1; >)
		calcul_Valeure
		
		_O_ARRAY STRING:C218(80; pop_Type; 14)
		_O_ARRAY STRING:C218(80; pop_Region; 25)
		_O_ARRAY STRING:C218(80; pop_Bouteille; 10)
		_O_ARRAY STRING:C218(80; pop_Flacon; 10)
		_O_ARRAY STRING:C218(80; pop_Elevage; 4)
		_O_ARRAY STRING:C218(80; LST_APP; 27)
		_O_ARRAY STRING:C218(80; Pop_Monaie; 2)
		
		//Pop_Monaie{1}:="Francs"
		//Pop_Monaie{2}:="Euros"
		//
		//Au cas ou 
		//: (<>Monaie="FRF")
		//Pop_Monaie:=1
		//: (<>Monaie="EUR")
		//Pop_Monaie:=2
		//
		//Fin de cas 
		//
		//Si (<>Langue=1)
		//OBJET FIXER VISIBLE(*;"Lan_Fr_@";Vrai)
		//Sinon 
		//OBJET FIXER VISIBLE(*;"Lan_Fr_@";Faux)
		//Fin de si 
		
		Bt_Aj:=0
		Bt_Cave:=0
		Bt_Ann:=0
		Bt_Eff:=0
		
		Lst_Cave_Redim_Interface
		
		//Si (Type_Affichage=2)
		//Cave_Graphe_liste 
		//OBJET FIXER VISIBLE(*;"Btn1-1";Vrai)
		//OBJET FIXER VISIBLE(*;"Btn1-2";Faux)
		//OBJET FIXER VISIBLE(*;"Btn2-1";Faux)
		//OBJET FIXER VISIBLE(*;"Btn2-2";Vrai)
		//Sinon 
		//OBJET FIXER VISIBLE(*;"Btn1-1";Faux)
		//OBJET FIXER VISIBLE(*;"Btn1-2";Vrai)
		//OBJET FIXER VISIBLE(*;"Btn2-1";Vrai)
		//OBJET FIXER VISIBLE(*;"Btn2-2";Faux)
		//Fin de si 
		
		//REDESSINER FENETRE(Fenetre formulaire courant)
		
	: (Form event code:C388=Sur activation:K2:9)
		SET WINDOW TITLE:C213(Get indexed string:C510(<>strLang; 2))
		
		
	: (Form event code:C388=Sur données modifiées:K2:15)
		If (Bt_Aj=1)
			//   AJOUTER ENREGISTREMENT([Cave])
		End if 
		
	: (Form event code:C388=Sur validation:K2:3)
		Lst_Box_Sauve_Interface("Lst_Cave"; "Lst_Cave")
	: (Form event code:C388=Sur appel extérieur:K2:11)
		If (VInterface_Qui=1)
			ACCEPT:C269
		End if 
	: (Form event code:C388=Sur minuteur:K2:25)
		Cave_Graphe_liste
		SET TIMER:C645(0)
		
End case 
//Si (v_Redim=Vrai)
//Lst_Cave_Redim_Interface 
//v_Redim:=Faux
//Fin de si 
//CHANGER TITRE FENETRE(◊LangueOff{2})
//Si (Bt_Cave=1) | (Bt_Ann=1) | (Bt_Eff=1)
//Bt_Cave:=0
//Bt_Ann:=0
//Bt_Eff:=0
//SUPPRIMER MESSAGES
//CHERCHER([Cave];[Cave]Cave=◊CategorieCave)
//TRIER([Cave];[Cave]Nom;>)
//calcul_Valeure 
//Fin de si 