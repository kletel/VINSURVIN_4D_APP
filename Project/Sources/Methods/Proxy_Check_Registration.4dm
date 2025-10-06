//%attributes = {}
C_LONGINT:C283(V_Resultat)

//TOUT SELECTIONNER([Utilisateur])
V_Nom:=[Utilisateur:17]Nom:1
V_Prenom:=[Utilisateur:17]Prenom:2
V_EMail:=[Utilisateur:17]EMail:10
V_NumLicence:=[Utilisateur:17]NumLicence:12
V_UUID_User:=[Utilisateur:17]UUID_User:14
WEB SERVICE SET OPTION:C901(Web Service timeout HTTP:K48:9; 32000)
WEB SERVICE SET PARAMETER:C777("Nom"; V_Nom)
WEB SERVICE SET PARAMETER:C777("Prenom"; V_Prenom)
WEB SERVICE SET PARAMETER:C777("EMail"; V_EMail)
WEB SERVICE SET PARAMETER:C777("NumLicence"; V_NumLicence)
WEB SERVICE SET PARAMETER:C777("UUID_User"; V_UUID_User)

ON ERR CALL:C155("P_Erreur")
WEB SERVICE CALL:C778("http://enregistrement.kletel.com/4DSOAP"; "A_WebService#WebServ_VerifEnregistrement"; "WebServ_VerifEnregistrement"; "http://www.4d.com/namespace/default"; Web Service dynamique:K48:1)
ON ERR CALL:C155("")
If (OK=1)
	WEB SERVICE GET RESULT:C779(V_Resultat; "V_Resultat")  // Memory clean-up on the final return value.
End if 


