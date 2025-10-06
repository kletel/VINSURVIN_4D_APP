C_LONGINT:C283(<>StrLang)

$event:=Form event code:C388

//identify object names (dont forget that when duplicate objects !)
$FocusRing:="FocusRing2"  //focus ring (visible or dont depending on the focus
$SearchCriteria:="SearchCriteria2"  //search criteria grey (help)
$UseRessources:=False:C215

Case of 
	: ($event=Sur chargement:K2:1)
		OBJECT SET VISIBLE:C603(*; $FocusRing; False:C215)
		vSearchValue2:=""
		If ($UseRessources)
			vSearchCriteria2:=Get indexed string:C510(<>StrLang; 5)
		Else 
			vSearchCriteria2:="Nom"
		End if 
		
	: ($event=Sur après frappe clavier:K2:26)
		
		$CurrentText:=Get edited text:C655
		If ($CurrentText#"")
			OBJECT SET VISIBLE:C603(*; $SearchCriteria; False:C215)
		Else 
			OBJECT SET VISIBLE:C603(*; $SearchCriteria; True:C214)
		End if 
		
	: ($event=Sur gain focus:K2:7)
		OBJECT SET VISIBLE:C603(*; $FocusRing; True:C214)
		
	: ($event=Sur perte focus:K2:8)
		OBJECT SET VISIBLE:C603(*; $FocusRing; False:C215)
		
		$CurrentText:=Get edited text:C655
		If ($CurrentText#"")
			QUERY:C277([Producteur:13]; [Producteur:13]Nom:3="@"+$CurrentText+"@"; *)
			QUERY:C277([Producteur:13];  | ; [Producteur:13]Societe:2="@"+$CurrentText+"@")
			CREATE SET:C116([Producteur:13]; "Tmp_Prod")
			
			OBJECT SET VISIBLE:C603(*; "Pla_@"; False:C215)
			OBJECT SET VISIBLE:C603(*; "Pla_2"; True:C214)
			OBJECT SET VISIBLE:C603(*; "Pla_0"; True:C214)
			
			OBJECT SET VISIBLE:C603(*; $SearchCriteria; False:C215)
			vSearchValue2:=""
		Else 
			OBJECT SET VISIBLE:C603(*; $SearchCriteria; True:C214)
		End if 
		
End case 
