Case of 
	: (Form event code:C388=Sur chargement:K2:1)
		FORM SET INPUT:C55([Termes:22]; "UD_Saisie")
	: (Form event code:C388=Sur clic:K2:4)
		CREATE RECORD:C68([Termes:22])
		$pos:=Open form window:C675([Termes:22]; "UD_Saisie")
		DIALOG:C40([Termes:22]; "UD_Saisie")
End case 