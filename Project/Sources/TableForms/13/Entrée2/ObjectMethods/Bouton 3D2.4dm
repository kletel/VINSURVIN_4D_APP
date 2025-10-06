
If ([Producteur:13]Web:13#"")
	$Url:=[Producteur:13]Web:13
	If (Position:C15("http:"; $Url)=0)
		$Url:="http://"+$Url
	End if 
	WA OPEN URL:C1020(z_Web; $Url)
End if 