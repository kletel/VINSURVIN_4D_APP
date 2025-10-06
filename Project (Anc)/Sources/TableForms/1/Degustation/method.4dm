Case of 
	: (Form event code:C388=Sur chargement:K2:1)
		Kle_Langue
		MESSAGES OFF:C175
		ARRAY TEXT:C222(Lst_Infos; 0)
		V_Larg:=0
		V_Modif:=0
		Txt:=""
		Rech:=""
		ARRAY TEXT:C222(Lst_Cepages; 3)
		Lst_Cepages{1}:=Get indexed string:C510(<>strLang; 15)
		Lst_Cepages{2}:=Get indexed string:C510(<>strLang; 16)
		Lst_Cepages{3}:=Get indexed string:C510(<>strLang; 17)
		
		v_Page:=1
		
		
		Lst_Cepages:=1
		// CHERCHER([Informations];[Informations]Rubrique="Bien gérer sa cave")
		//CHERCHER([Informations];[Informations]Rubrique="Dégustation@")
		
		QUERY:C277([Informations:10]; [Informations:10]Rubrique:1="Dégustation@"; *)
		QUERY:C277([Informations:10];  & ; V_L_Information_Sous_Rubrique->#""; *)
		QUERY:C277([Informations:10];  & ; V_L_Information_Actif->=True:C214)
		
		ORDER BY:C49([Informations:10]; V_L_Information_Sous_Rubrique->; >)
		DISTINCT VALUES:C339(V_L_Information_Sous_Rubrique->; Lst_Infos)
		
		Lst_Infos:=1
		QUERY:C277([Informations:10]; V_L_Information_Sous_Rubrique->=Lst_Infos{Lst_Infos}; *)
		QUERY:C277([Informations:10];  & ; V_L_Information_Actif->=True:C214)
		ORDER BY:C49([Informations:10]; [Informations:10]Ref_Fiche:3; >)
		SELECTION TO ARRAY:C260(V_L_Information_Titre->; Lst_Nom_Info)
		
	: (Form event code:C388=Sur redimensionnement:K2:27) | (Form event code:C388=Sur clic:K2:4)
		
		OBJECT GET COORDINATES:C663([Interface:1]Image_OK:5; V_g; V_h; V_d; V_b)
		$larg:=V_d-V_g
		$haut:=v_b-V_h
		
		If (V_Larg#$Larg) | (V_Modif=1)
			V_Larg:=$larg
			//Texte_OK:=‘12000;47‘
			V_Modif:=0
			//‘12000;142‘(Texte_OK; V_L_Information->)
			
			//‘12000;109‘(Texte_OK; ‘k12003;22‘; 2)
			//‘12000;109‘(Texte_OK; ‘k12003;32‘; 0)
			//‘12000;109‘(Texte_OK; ‘k12003;30‘; 0)
			//‘12000;109‘(Texte_OK; ‘k12003;31‘; 0)
			//‘12000;109‘(Texte_OK; ‘k12003;42‘; 0)
			//‘12000;109‘(Texte_OK; ‘k12003;33‘; 0)
			//‘12000;109‘(Texte_OK; ‘k12003;40‘; V_Larg)
			//‘12000;109‘(Texte_OK; ‘k12003;44‘; V_Larg)
			
			//‘12000;109‘(Texte_OK; ‘k12003;45‘; $haut)
			//‘12000;109‘(Texte_OK; ‘k12003;41‘; $haut)
			//‘12000;10‘(Texte_OK)
			
			
			//Image_temp:=‘12000;136‘(Texte_OK; V_Page)
			
			If (Picture size:C356(Image_temp)>0)
				[Interface:1]Image_OK:5:=Image_temp
			Else 
				V_Page:=V_Page-1
			End if 
			
			//[Interface]Image_OK:=[Interface]Image_OK | [Interface]Image_OK
			
			//‘12000;38‘(Texte_OK)
		End if 
		
End case 
