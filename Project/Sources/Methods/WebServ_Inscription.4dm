//%attributes = {}
C_LONGINT:C283(V_Resultat)

//TOUT SELECTIONNER([Utilisateur])
V_Nom:=[Utilisateur:17]Nom:1
V_Prenom:=[Utilisateur:17]Prenom:2
V_Societe:=[Utilisateur:17]Societe:3
V_Adresse1:=[Utilisateur:17]Adresse1:4
V_Adresse2:=[Utilisateur:17]Adresse2:5
V_Adresse3:=[Utilisateur:17]Adresse3:6
V_CodePostal:=[Utilisateur:17]CodePostal:7
V_Etat:=[Utilisateur:17]Etat:8
VA_Pays:=[Utilisateur:17]Pays:9
V_EMail:=[Utilisateur:17]EMail:10
V_Ville:=[Utilisateur:17]Ville:11
V_NumLicence:=[Utilisateur:17]NumLicence:12
V_UUID_User:=[Utilisateur:17]UUID_User:14
WEB SERVICE SET OPTION:C901(Web Service timeout HTTP:K48:9; 32000)
WEB SERVICE SET PARAMETER:C777("Nom"; V_Nom)
WEB SERVICE SET PARAMETER:C777("Prenom"; V_Prenom)
WEB SERVICE SET PARAMETER:C777("Societe"; V_Societe)
WEB SERVICE SET PARAMETER:C777("Adresse1"; V_Adresse1)
WEB SERVICE SET PARAMETER:C777("Adresse2"; V_Adresse2)
WEB SERVICE SET PARAMETER:C777("Adresse3"; V_Adresse3)
WEB SERVICE SET PARAMETER:C777("CodePostal"; V_CodePostal)
WEB SERVICE SET PARAMETER:C777("Etat"; V_Etat)
WEB SERVICE SET PARAMETER:C777("Pays"; VA_Pays)
WEB SERVICE SET PARAMETER:C777("EMail"; V_EMail)
WEB SERVICE SET PARAMETER:C777("Ville"; V_Ville)
WEB SERVICE SET PARAMETER:C777("NumLicence"; V_NumLicence)
WEB SERVICE SET PARAMETER:C777("UUID_User"; V_UUID_User)

ON ERR CALL:C155("P_Erreur")
WEB SERVICE CALL:C778("http://enregistrement.kletel.com/4DSOAP"; "A_WebService#WebServ_Enregistrement"; "WebServ_Enregistrement"; "http://www.4d.com/namespace/default"; Web Service dynamique:K48:1)
ON ERR CALL:C155("")
If (OK=1)
	WEB SERVICE GET RESULT:C779(V_Resultat; "V_Resultat")  // Memory clean-up on the final return value.
End if 


