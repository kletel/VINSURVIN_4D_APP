Case of 
	: (Form event code:C388=Sur chargement:K2:1)
		V_Larg:=0
		Txt:=""
		Rech:=""
		ARRAY TEXT:C222(Lst_Cepages; 3)
		Lst_Cepages{1}:=Get indexed string:C510(<>strLang; 15)
		Lst_Cepages{2}:=Get indexed string:C510(<>strLang; 16)
		Lst_Cepages{3}:=Get indexed string:C510(<>strLang; 17)
		
		Lst_Cepages:=1
		
		//CHERCHER([Cépages];[Cépages]Vin="Vin Blanc";*)
		//CHERCHER([Cépages]; & ;[Cépages]Langue=◊Langue)
		
		ORDER BY:C49([Cépages:6]; [Cépages:6]Cepage:2; >)
		SELECTION TO ARRAY:C260([Cépages:6]Cepage:2; Lst_Nom_Cepage)
		
		QUERY:C277([Cépages:6]; [Cépages:6]Vin:1="@Bla@"; *)
		QUERY:C277([Cépages:6];  & ; [Cépages:6]Langue:9=<>Langue)
		ORDER BY:C49([Cépages:6]; [Cépages:6]Cepage:2; >)
		SELECTION TO ARRAY:C260([Cépages:6]Cepage:2; Lst_Nom_Cepage)
		
	: (Form event code:C388=Sur redimensionnement:K2:27) | (Form event code:C388=Sur clic:K2:4)
		
		OBJECT GET COORDINATES:C663([Interface:1]Image_OK:5; V_g; V_h; V_d; V_b)
		$larg:=V_d-V_g
		If (V_Larg#$Larg)
			V_Larg:=$larg
			//Texte_OK:=‘12000;47‘
			//‘12000;142‘(Texte_OK; [Cépages]Texte_OK_)
			
			//‘12000;109‘(Texte_OK; ‘k12003;22‘; 2)
			//‘12000;109‘(Texte_OK; ‘k12003;32‘; 0)
			//‘12000;109‘(Texte_OK; ‘k12003;30‘; 0)
			//‘12000;109‘(Texte_OK; ‘k12003;31‘; 0)
			//‘12000;109‘(Texte_OK; ‘k12003;42‘; 0)
			//‘12000;109‘(Texte_OK; ‘k12003;33‘; 0)
			//‘12000;109‘(Texte_OK; ‘k12003;40‘; V_Larg)
			//‘12000;109‘(Texte_OK; ‘k12003;44‘; V_Larg)
			//‘12000;10‘(Texte_OK)
			
			
			//[Interface]Image_OK:=‘12000;136‘(Texte_OK; 1)
			
			//[Interface]Image_OK:=[Interface]Image_OK | [Interface]Image_OK
			
			//‘12000;38‘(Texte_OK)
		End if 
		
End case 
