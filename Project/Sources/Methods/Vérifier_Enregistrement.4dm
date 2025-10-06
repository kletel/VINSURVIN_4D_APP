//%attributes = {"publishedWeb":true}
C_BOOLEAN:C305($EnregistrementOK; $PasDeFiche)
_O_C_INTEGER:C282($result)
_O_C_STRING:C293(255; $numLicence; $nomUtilisateur; $prénomUtilisateur)


$EnregistrementOK:=False:C215
$PasDeFiche:=False:C215

<>Flag_demo:=False:C215
<>Test_licence:=0
<>Recommence:=True:C214

READ WRITE:C146([Utilisateur:17])
ALL RECORDS:C47([Utilisateur:17])
FIRST RECORD:C50([Utilisateur:17])

If (Records in selection:C76([Utilisateur:17])=1)
	$numLicence:=[Utilisateur:17]NumLicence:12
	$nomUtilisateur:=[Utilisateur:17]Nom:1
	$prénomUtilisateur:=[Utilisateur:17]Prenom:2
	
	If (($numLicence#"") & ($NomUtilisateur#"") & ($PrénomUtilisateur#""))
		vStr:=$numLicence
		//$result:=IM_Serial_Get (9237;Majusc($nomUtilisateur);Majusc($prénomUtilisateur);vStr)
		If ($result=8569)
			$EnregistrementOK:=True:C214
		End if 
	End if 
Else 
	$PasDeFiche:=True:C214
End if 

If (Not:C34($EnregistrementOK))
	888_Fenêtre(530; 420; 4; ""; "Fermer2"; False:C215)
	FORM SET INPUT:C55([Utilisateur:17]; "Saisie")
	SET WINDOW TITLE:C213(Get indexed string:C510(<>strLang; 281))
	FORM SET OUTPUT:C54([Utilisateur:17]; "Saisie")
	If ($PasDeFiche)
		ADD RECORD:C56([Utilisateur:17]; *)
	End if 
	While (<>Test_licence<5) & (<>Recommence=True:C214)
		MODIFY RECORD:C57([Utilisateur:17]; *)
	End while 
	SET WINDOW TITLE:C213("")
	CLOSE WINDOW:C154
End if 

ALL RECORDS:C47([Utilisateur:17])
FIRST RECORD:C50([Utilisateur:17])

If (Not:C34([Utilisateur:17]CarteImprimée:13))
	Numéro_Série([Utilisateur:17]NumLicence:12)
End if 

UNLOAD RECORD:C212([Utilisateur:17])
READ ONLY:C145([Utilisateur:17])