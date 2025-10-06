Case of 
	: (Form event code:C388=Sur clic:K2:4)
		If (Right click:C712=True:C214) | (Contextual click:C713=True:C214)
			LstB_Modifie_Colonne(->[Cave:2]; "Colonne")
			Lst_Box_Sauve_Interface("ListBox_Cave"; "Colonne")
		Else 
			
		End if 
		
	: (Form event code:C388=Sur redimensionnement colonne:K2:31)
		Lst_Box_Sauve_Interface("ListBox_Cave"; "Colonne")
		
	: (Form event code:C388=Sur déplacement colonne:K2:30)
		Lst_Box_Sauve_Interface("ListBox_Cave"; "Colonne")
		
	: (Form event code:C388=Sur double clic:K2:5)
		C_LONGINT:C283($colonne; $ligne)
		LISTBOX GET CELL POSITION:C971(*; "Lst_Cave"; $colonne; $ligne)
		CREATE SET:C116([Cave:2]; "Tmp_Cave")
		
		v_Position:=0
		LOAD RECORD:C52([Cave:2])
		FORM SET INPUT:C55([Cave:2]; "SaisieV2")
		MODIFY RECORD:C57([Cave:2])
		
		
		LISTBOX SELECT ROW:C912(*; "Lst_Cave"; $ligne; lk remplacer sélection:K53:1)
		USE SET:C118("Tmp_Cave")
		OBJECT SET SCROLL POSITION:C906(*; "Lst_Cave"; <>NumEnrCourant; *)
		//EFFACER ENSEMBLE("Tmp_Cave")
		
End case 
