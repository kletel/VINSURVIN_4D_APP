//%attributes = {}

// ----------------------------------------------------
// Nom utilisateur (OS) : Seb
// Date et heure : 22/02/11, 17:31:17
// ----------------------------------------------------
// Méthode : P_CheckConfig
// Description
// 
//
// Paramètres
// ----------------------------------------------------

TRACE:C157

If ((Application type:C494=4D Volume Desktop:K5:2) | (Application type:C494=4D mode local:K5:1))
	C_TEXT:C284(V_adressemacmachine)
	V_adressemacmachine:=Tool_Adresse_Mac
	C_BOOLEAN:C305($alltestsareok; $TestConfigUser; $TestConfigGenerale)
	$alltestsareok:=False:C215
	$TestConfigUser:=False:C215
	$TestConfigGenerale:=False:C215
	
	ARRAY TEXT:C222(test_Ls_Licences; 0)
	ARRAY TEXT:C222(xml_Ls_Licences; 0)
	
	// on liste les differents chemins de preferences sur les differentes plateformes
	// Préférences utilisateur_Tous sur mac : Demarrage_Dev:Library:Preferences: sur mac os
	// Préférences utilisateur logué Demarrage_Dev:Users:seb:Library:Preferences: sur mac os
	// application support on remplace Preferences par Application Support sur mac os
	
	<>pathpreferencestous:=System folder:C487(Préférences utilisateur_Tous:K41:3)
	<>pathpreferencesusers:=System folder:C487(Préférences utilisateur:K41:4)
	
	C_LONGINT:C283($platform)
	_O_PLATFORM PROPERTIES:C365($platform)
	
	If ($platform=Mac OS:K25:2)  //ajouter si c'est un serveur et si c'est un compile
		
		<>pathapplicationsupporttous:=Replace string:C233(<>pathpreferencestous; "Preferences"; "Application Support"; *)+<>name_application
		<>pathapplicationsupportusers:=Replace string:C233(<>pathpreferencesusers; "Preferences"; "Application Support"; *)+<>name_application
		<>pathdocumentsusers:=Replace string:C233(<>pathpreferencesusers; "Library:Application Support"; "Documents"; *)+<>name_application
		
		//<>pathdocumentslettrestype:=<>pathdocumentsusers+<>Separateur+"Lettres_Type"
		//<>pathdocumentsTemplate:=<>pathdocumentsusers+<>Separateur+"Templete"
		If (Test path name:C476(<>pathapplicationsupporttous)#Est un dossier:K24:2)
			CREATE FOLDER:C475(<>pathapplicationsupporttous)
		End if 
		If (Test path name:C476(<>pathapplicationsupportusers)#Est un dossier:K24:2)
			CREATE FOLDER:C475(<>pathapplicationsupportusers)
		End if 
		If (Test path name:C476(<>pathdocumentsusers)#Est un dossier:K24:2)
			CREATE FOLDER:C475(<>pathdocumentsusers)
		End if 
		
		
		<>Databasepath:=<>pathdocumentsusers+<>Separateur+<>name_application+".4DD"
		<>Settingspath:=<>pathapplicationsupporttous+<>Separateur+"GeneralSettings.xml"
		<>UserSettingspath:=<>pathapplicationsupportusers+<>Separateur+"UserSettings.xml"
		
		//$vsStructNomFichier:=Nom long vers nom de fichier(Fichier structure)
		$vsStructNomChemin:=Application file:C491
		If (<>vbDebugOn=True:C214)
			ALERT:C41("chemin structure : "+$vsStructNomChemin)
		End if 
		//$vsStructNomChemin:=Remplacer chaine($vsStructNomChemin;<>name_application+".app";"";*)
		//ALERTE("chemin structure remplacé : "+$vsStructNomChemin)
		$cheminbasecourante:=Nomlongverscheminacces(Data file:C490)
		If (<>vbDebugOn=True:C214)
			ALERT:C41("chemin bdd : "+$cheminbasecourante)
		End if 
		$cheminbasecourante:=Replace string:C233($cheminbasecourante; ":Contents:Database:"; ""; *)
		If (<>vbDebugOn=True:C214)
			ALERT:C41("chemin bdd remplacé : "+$cheminbasecourante)
		End if 
		If (<>vbDebugOn=True:C214)
			ALERT:C41("chemin base par defaut : "+<>Databasepath)
			ALERT:C41("chemin config all users : "+<>Settingspath)
			ALERT:C41("chemin config user : "+<>UserSettingspath)
		End if 
		
		//Si ($vsStructNomChemin=$cheminbasecourante)  // test de non correspondance entre l'emplacement du fichier de données et du fichier de structure
		Case of 
			: (Test path name:C476(<>Databasepath)#Est un document:K24:1)
				If (<>vbDebugOn=True:C214)
					ALERT:C41("création du fichier de données : "+<>Databasepath)
				End if 
				Kle_Alerte(Get indexed string:C510(<>strlang; 340))
				
				
				CREATE DATA FILE:C313(<>Databasepath)  // creation du fichier 4dd utilisateur
				<>changementdatabase:=True:C214
				//: (Tester chemin acces(<>Databasepath)=Est un document)
				//Si (<>vbDebugOn=Vrai)
				//ALERTE("ouverture du fichier de données : "+<>Databasepath)
				//Fin de si 
				//OUVRIR FICHIER DONNEES(<>Databasepath)
				//<>changementdatabase:=Vrai
		End case 
		//Sinon 
		If (Test path name:C476(<>UserSettingspath)=Est un document:K24:1)
			GestPrefs("Load"; "user")
			
			If (<>name_applicationxml=<>name_application)
				If (<>Databasepathxml=Data file:C490)
					If (<>version_applicationxml=<>version_application)
						$TestConfigUser:=True:C214
						If (<>vbDebugOn=True:C214)
							ALERT:C41("la config utilisateur est correcte")
						End if 
					Else 
						//Kle_Alerte ("la configuration utilisateur est incorrecte, le fichier de configuration utilisateur va etre supprimé")
						DELETE DOCUMENT:C159(<>UserSettingspath)
						If (Test path name:C476(<>Databasepath)=Est un document:K24:1)
							If (<>vbDebugOn=True:C214)
								ALERT:C41("ouverture du fichier de données : "+<>Databasepath)
							End if 
							OPEN DATA FILE:C312(<>Databasepath)
							<>changementdatabase:=True:C214
						Else 
							If (<>vbDebugOn=True:C214)
								ALERT:C41("création du fichier de données : "+<>Databasepath)
							End if 
							Kle_Alerte(Get indexed string:C510(<>strlang; 340))
							CREATE DATA FILE:C313(<>Databasepath)  // creation du fichier 4dd utilisateurFin de si 
							<>changementdatabase:=True:C214
						End if 
					End if 
				End if 
				
				
			Else 
				
				If (<>vbDebugOn=True:C214)
					ALERT:C41("le fichier de configuration utilisateur va etre créé")
				End if 
				<>Databasepath:=Data file:C490
				GestPrefs("Create"; "user")
			End if 
		End if 
		//Fin de si 
	Else   // cas windows
		
		If (<>version_majeure=6)  //repertoire dans Windows 7 et Windows Vista
			<>appdatawindows:="AppData"+<>Separateur+"Roaming"
			<>repdocumentwindows:="Documents"
		Else   //repertoire dans Windows XP
			<>appdatawindows:="Application Data"
			<>repdocumentwindows:="Mes Documents"  // test de langue a faire ou My Documents en anglais
		End if 
		
		
		<>pathapplicationsupporttous:=<>pathpreferencestous+<>appdatawindows+<>Separateur+<>name_application
		<>pathapplicationsupportusers:=<>pathpreferencesusers+<>appdatawindows+<>Separateur+<>name_application
		<>pathdocumentsusers:=<>pathpreferencesusers+<>repdocumentwindows+<>Separateur+<>name_application
		//<>pathdocumentslettrestype:=<>pathdocumentsusers+<>Separateur+"Lettres_Type"
		//<>pathdocumentsTemplate:=<>pathdocumentsusers+<>Separateur+"Templete"
		
		If (Test path name:C476(<>pathapplicationsupporttous)#Est un dossier:K24:2)
			CREATE FOLDER:C475(<>pathapplicationsupporttous)
		End if 
		If (Test path name:C476(<>pathapplicationsupportusers)#Est un dossier:K24:2)
			CREATE FOLDER:C475(<>pathapplicationsupportusers)
		End if 
		If (Test path name:C476(<>pathdocumentsusers)#Est un dossier:K24:2)
			CREATE FOLDER:C475(<>pathdocumentsusers)
		End if 
		//Si (Tester chemin acces(<>pathdocumentslettrestype)#Est un répertoire)
		//CREER DOSSIER(<>pathdocumentslettrestype)
		//Fin de si 
		//Si (Tester chemin acces(<>pathdocumentsTemplate)#Est un répertoire)
		//CREER DOSSIER(<>pathdocumentsTemplate)
		//Fin de si 
		
		//creer un dossier contenu de mail et les lettres types
		
		<>Databasepath:=<>pathdocumentsusers+<>Separateur+<>name_application+".4DD"
		<>Settingspath:=<>pathapplicationsupporttous+<>Separateur+"GeneralSettings.xml"
		<>UserSettingspath:=<>pathapplicationsupportusers+<>Separateur+"UserSettings.xml"
		
		//$vsStructNomFichier:=Nom long vers nom de fichier(Fichier structure)
		$vsStructNomChemin:=Nomlongverscheminacces(Application file:C491)
		If (<>vbDebugOn=True:C214)
			ALERT:C41("*** chemin structure fichier application : "+$vsStructNomChemin)
		End if 
		//$vsStructNomChemin:=Remplacer chaine($vsStructNomChemin;<>name_application+".app";"";*)
		//ALERTE("chemin structure remplacé : "+$vsStructNomChemin)
		$cheminbasecourante:=Nomlongverscheminacces(Data file:C490)
		$cheminbasecourante:=Replace string:C233($cheminbasecourante; <>Separateur+"Database"; ""; *)
		If (<>vbDebugOn=True:C214)
			ALERT:C41("*** chemin fichier donnees: "+$cheminbasecourante)
		End if 
		
		
		If (<>vbDebugOn=True:C214)
			ALERT:C41("chemin base par defaut : "+<>Databasepath)
			ALERT:C41("chemin config all users : "+<>Settingspath)
			ALERT:C41("chemin config user : "+<>UserSettingspath)
		End if 
		
		//Si ($vsStructNomChemin=$cheminbasecourante)  // test de non correspondance entre l'emplacement du fichier de données et du fichier de structure
		If (Test path name:C476(<>Databasepath)#Est un document:K24:1)
			If (<>vbDebugOn=True:C214)
				ALERT:C41("création du fichier de données : "+<>Databasepath)
			End if 
			Kle_Alerte(Get indexed string:C510(<>strlang; 340))
			CREATE DATA FILE:C313(<>Databasepath)  // creation du fichier 4dd utilisateur
			<>changementdatabase:=True:C214
			
		End if 
		//Sinon 
		If (Test path name:C476(<>UserSettingspath)=Est un document:K24:1)
			GestPrefs("Load"; "user")
			
			If (<>name_applicationxml=<>name_application)
				If (<>Databasepathxml=Data file:C490)
					If (<>version_applicationxml=<>version_application)
						$TestConfigUser:=True:C214
						If (<>vbDebugOn=True:C214)
							ALERT:C41("la config utilisateur est correcte")
						End if 
					Else 
						//Kle_Alerte (Lire chaine dans liste(<>strlang;341))
						DELETE DOCUMENT:C159(<>UserSettingspath)
						If (Test path name:C476(<>Databasepath)=Est un document:K24:1)
							If (<>vbDebugOn=True:C214)
								ALERT:C41("ouverture du fichier de données : "+<>Databasepath)
							End if 
							OPEN DATA FILE:C312(<>Databasepath)
							<>changementdatabase:=True:C214
						Else 
							If (<>vbDebugOn=True:C214)
								ALERT:C41("création du fichier de données : "+<>Databasepath)
							End if 
							Kle_Alerte(Get indexed string:C510(<>strlang; 340))
							CREATE DATA FILE:C313(<>Databasepath)  // creation du fichier 4dd utilisateur
							<>changementdatabase:=True:C214
						End if 
					End if 
				End if 
			End if 
			
			
		Else 
			
			If (<>vbDebugOn=True:C214)
				ALERT:C41("le fichier de configuration utilisateur va etre créé")
			End if 
			<>Databasepath:=Data file:C490
			GestPrefs("Create"; "user")
		End if 
		//Fin de si 
		
		
		
		
	End if 
	
	If (Test path name:C476(<>Settingspath)=Est un document:K24:1)  // vérifier si un fichier xml de configuration contenant les licences valide existe
		GestPrefs("Load"; "allusers")
		// on compare le fichier xml et la base de donnees
		ALL RECORDS:C47([Utilisateur:17])
		If (Records in selection:C76([Utilisateur:17])>0)
			SELECTION TO ARRAY:C260([Utilisateur:17]NumLicence:12; test_Ls_Licences)
		End if 
		If (<>adressemacmachinexml=V_adressemacmachine)
			//
			// si le tableau de licence xml est different du tableau de licence
			// de la base de donnee j'efface les licences de la base de donnees et je le charge a partir du fichier xml
			//Si (Taille tableau(xml_Ls_Licences)>0)
			//Si (Taille tableau(test_Ls_Licences)>0)
			//TABLEAU BOOLEEN($tabbooltestlicence;0)
			//C_BOOLEEN($booltestlicence)
			//$booltestlicence:=Faux
			//Boucle ($i;1;Taille tableau(xml_Ls_Licences))
			//$pos:=Chercher dans tableau(test_Ls_Licences;xml_Ls_Licences{$i})
			//Si ($pos>0)
			//AJOUTER A TABLEAU($tabbooltestlicence;Vrai)
			//Sinon 
			//AJOUTER A TABLEAU($tabbooltestlicence;Faux)
			//Fin de si 
			//
			//Fin de boucle 
			//
			//$pos:=Chercher dans tableau($tabbooltestlicence;Faux)
			//Si ($pos>0)
			//$booltestlicence:=Faux
			//Sinon 
			//$booltestlicence:=Vrai
			//Fin de si 
			//Fin de si 
			//Fin de si 
			
			//Si ($booltestlicence=Vrai)
			$TestConfigGenerale:=True:C214
			//Sinon 
			//$TestConfigGenerale:=Faux
			//Si (<>vbDebugOn=Vrai)
			//Kle_Alerte ("suppression du fichier de configuration tous utilisateurs : ")
			//Fin de si 
			//SUPPRIMER DOCUMENT(<>Settingspath)
			//Si (<>vbDebugOn=Vrai)
			//Kle_Alerte ("suppression des licences du fichier de données ")
			//Fin de si 
			//  //supprimer les licences du data
			//TOUT SELECTIONNER([Utilisateur])
			//GEN_SupprimerSelection (->[Utilisateur])
			//
			//Fin de si 
		Else 
			$TestConfigGenerale:=False:C215
			If (<>vbDebugOn=True:C214)
				Kle_Alerte("suppression du fichier de configuration tous utilisateurs : ")
			End if 
			DELETE DOCUMENT:C159(<>Settingspath)
			//supprimer les licences du data
			//Si (<>vbDebugOn=Vrai)
			//Kle_Alerte ("suppression des licences du fichier de données ")
			//Fin de si 
			//TOUT SELECTIONNER([Utilisateur])
			//GEN_SupprimerSelection (->[Utilisateur])
			
		End if 
	Else   // le fichier de configuration pour tous les utilisateurs n'existe pas alors on le crée. 
		//TOUT SELECTIONNER([Utilisateur])
		//Si (Enregistrements trouves([Utilisateur])>0)
		//SELECTION VERS TABLEAU([Utilisateur]NumLicence;test_Ls_Licences)
		//Fin de si 
		If (<>vbDebugOn=True:C214)
			Kle_Alerte("creation du fichier de configuration tous utilisateurs : ")
		End if 
		GestPrefs("Create"; "allusers")
		$TestConfigGenerale:=True:C214
	End if 
	
	If ($TestConfigUser=True:C214)
		If ($TestConfigGenerale=True:C214)
			$alltestsareok:=True:C214
		End if 
	End if 
End if 