If (Not:C34(Is compiled mode:C492))
	ARRAY TEXT:C222($tTxt_Components; 0)
	COMPONENT LIST:C1001($tTxt_Components)
	If (Find in array:C230($tTxt_Components; "4DPop")>0)
		EXECUTE METHOD:C1007("4DPop_Palette")
	End if 
End if 



If (Application type:C494=5)
	//DAX_Dev_Initialize 
End if 

C_TEXT:C284(<>version_application; <>name_application)  // Modifié par : Seb (04/03/11)
<>version_application:="6.0.3"  // Modifié par : Seb (04/03/11)
<>name_application:="Vin sur Vin"  // Modifié par : Seb (04/03/11)
C_BOOLEAN:C305(<>changementdatabase)
<>changementdatabase:=False:C215
//<>name_application:="Expert Wine Cellar"
<>vbDebugOn:=False:C215
C_LONGINT:C283(<>Systeme; <>Realise)
_O_PLATFORM PROPERTIES:C365(<>Plateforme; <>Systeme; <>Realise)
<>Systeme:=Int:C8(<>Systeme/256)
If (<>Plateforme=3)
	<>Separateur:="\\"
Else 
	<>Separateur:=":"
End if 

//Constantes de langue

<>Langue:=1

C_LONGINT:C283(<>strLang)
Case of 
	: (<>Langue=1)  //francais
		<>strLang:=19660
		<>LangueInitiale:="Fr"
	: (<>Langue=2)  //Danois
		<>strLang:=22000
		<>LangueInitiale:="Dk"
	: (<>Langue=3)  //Anglais
		<>strLang:=24000
		<>LangueInitiale:="En"
	: (<>Langue=4)  //Espagnol
		<>strLang:=26000
		<>LangueInitiale:="Es"
	: (<>Langue=5)  //Allemand
		<>strLang:=28000
		<>LangueInitiale:="De"
End case 

TRACE:C157

QUERY:C277([Interface:1]; [Interface:1]Rubrique1:1="UUID")

If (Records in selection:C76([Interface:1])=0)
	CREATE RECORD:C68([Interface:1])
	[Interface:1]Rubrique1:1:="UUID"
End if 
<>UUID_User:=[Interface:1]Serie:2
If (<>UUID_User="")
	<>UUID_User:=Generate UUID:C1066  //Kle_Genere_UUID("VSV_")
	[Interface:1]Serie:2:=<>UUID_User
	SAVE RECORD:C53([Interface:1])
End if 

TRACE:C157

//Init_Langue 

//Traduction des champs de la structure
Traduc_Table

//Corrections
Correctifs

C_TEXT:C284($Com3)
If (Application type:C494#5)  //4D Serveur  
	<>ModeUtilisation:=1
	If (Test path name:C476(Get 4D folder:C485+"CAV_Commande")=1)
		//Il y a un macro a executer
		$ref:=Open document:C264(Get 4D folder:C485+"CAV_Commande")
		RECEIVE PACKET:C104($ref; $Com1; Char:C90(13))
		RECEIVE PACKET:C104($ref; $Com2; Char:C90(13))
		RECEIVE PACKET:C104($ref; $Com3; Char:C90(13))
		CLOSE DOCUMENT:C267($Ref)
		Case of 
			: ($Com1="Exporter")
				SET CHANNEL:C77(10; Get 4D folder:C485+"Exp_Cave")
				ALL RECORDS:C47([Cave:2])
				FIRST RECORD:C50([Cave:2])
				While (Not:C34(End selection:C36([Cave:2])))
					SEND RECORD:C78([Cave:2])
					NEXT RECORD:C51([Cave:2])
				End while 
				SET CHANNEL:C77(11)
				
				SET CHANNEL:C77(10; Get 4D folder:C485+"Exp_Prod")
				ALL RECORDS:C47([Producteur:13])
				FIRST RECORD:C50([Producteur:13])
				While (Not:C34(End selection:C36([Producteur:13])))
					SEND RECORD:C78([Producteur:13])
					NEXT RECORD:C51([Producteur:13])
				End while 
				SET CHANNEL:C77(11)
				
				SET CHANNEL:C77(10; Get 4D folder:C485+"Exp_Degust")
				ALL RECORDS:C47([Degustation:12])
				FIRST RECORD:C50([Degustation:12])
				While (Not:C34(End selection:C36([Degustation:12])))
					SEND RECORD:C78([Degustation:12])
					NEXT RECORD:C51([Degustation:12])
				End while 
				SET CHANNEL:C77(11)
				
				$x_ref:=Create document:C266(Get 4D folder:C485+"CAV_Commande")
				SEND PACKET:C103($x_ref; "Importer"+Char:C90(13))
				SEND PACKET:C103($x_ref; $Com2+Char:C90(13))
				SEND PACKET:C103($x_ref; $Com3+Char:C90(13))
				CLOSE DOCUMENT:C267($x_Ref)
				
				OPEN DATA FILE:C312($Com2)
				
			: ($Com1="Importer")
				
				SET CHANNEL:C77(10; Get 4D folder:C485+"Exp_Cave")
				RECEIVE RECORD:C79([Cave:2])
				While (Ok=1)
					If ([Cave:2]Cave:40="")
						[Cave:2]Cave:40:=Get indexed string:C510(<>strLang; 156)
					End if 
					SAVE RECORD:C53([Cave:2])
					RECEIVE RECORD:C79([Cave:2])
				End while 
				SET CHANNEL:C77(11)
				
				SET CHANNEL:C77(10; Get 4D folder:C485+"Exp_Prod")
				RECEIVE RECORD:C79([Producteur:13])
				While (Ok=1)
					SAVE RECORD:C53([Producteur:13])
					RECEIVE RECORD:C79([Producteur:13])
				End while 
				SET CHANNEL:C77(11)ù.
				
				SET CHANNEL:C77(10; Get 4D folder:C485+"Exp_Degust")
				RECEIVE RECORD:C79([Degustation:12])
				While (Ok=1)
					SAVE RECORD:C53([Degustation:12])
					RECEIVE RECORD:C79([Degustation:12])
				End while 
				SET CHANNEL:C77(11)
				
				DELETE DOCUMENT:C159(Get 4D folder:C485+"CAV_Commande")
				
		End case 
		
	End if 
	UNLOAD RECORD:C212([Utilisateur:17])
	
	$ref:=New process:C317("Démarrage"; 128000; "Démarrage")
End if 

