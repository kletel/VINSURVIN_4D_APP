//Searchpicker sample code

Case of 
		
	: (Form event code:C388=Sur chargement:K2:1)
		
		// Init the var itself
		// this can be done anywhere else in your code
		C_TEXT:C284(vSearch)
		
		// the let's customise the SearchPicker (if needed)
		
		C_BOOLEAN:C305($Customise)
		$Customise:=True:C214
		
		C_TEXT:C284($ObjectName)
		$ObjectName:=OBJECT Get name:C1087(Objet courant:K67:2)
		
		// The exemple below shows how to set a label (ex : "name") inside the search zone
		
		If ($Customise)
			
			SearchPicker SET HELP TEXT($ObjectName; "Nom à rechercher")
			
		End if 
		
	: (Form event code:C388=Sur données modifiées:K2:15)
		
		QUERY:C277([Cave:2]; [Cave:2]Nom:1="@"+vSearch+"@"; *)
		QUERY:C277([Cave:2];  | ; [Cave:2]Appellation:2="@"+vSearch+"@"; *)
		QUERY:C277([Cave:2];  | ; [Cave:2]Région:5="@"+vSearch+"@")
		
		ORDER BY:C49([Cave:2]; [Cave:2]Nom:1; >)
		
		Cave_Init_enum
		calcul_Valeure
		
		
End case 
