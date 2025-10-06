//%attributes = {}
// $1 pointeur sur la table devant être testée au niveau du verrou
// $2 temps d'attente 
//0 on attend indefinement 
//>0 on attend le temps en nombre de seconde

C_LONGINT:C283($idfiche)
C_POINTER:C301($1)  // fichier
C_LONGINT:C283($2; $tempsAttente)
_O_C_INTEGER:C282($Compt)  //compteur de tentatives
_O_C_INTEGER:C282($NoProc)
_O_C_STRING:C293(80; $Util; $PosteCli; $NomProc)

If (Count parameters:C259>1)
	$tempsAttente:=$2
Else 
	$tempsAttente:=60  //1 minutes
End if 

$Compt:=0
READ WRITE:C146($1->)
LOAD RECORD:C52($1->)  //chargement de la fiche pour faire le test de verrouillage
While (Locked:C147($1->)) | ($Compt>$tempsAttente)
	//si la fiche est verrouillée le process attend une 1 seconde  
	GEN_Wait(1)  //attendre une seconde
	LOAD RECORD:C52($1->)  //recharger la fiche pour faire un nouveau test
	$Compt:=$Compt+1
	
	If (Not:C34(Application type:C494=4D Server:K5:6))
		If ($Compt=10)
			$winref:=Open form window:C675([Interface:1]; "F_Message"; 1; 65536; 262144)
		End if 
		If ($Compt>=10)
			LOCKED BY:C353($1->; $NoProc; $Util; $PosteCli; $NomProc)
			GOTO XY:C161(2; 1)
			$nomfichier:=Table name:C256($1)
			//$idFiche:=(Champ(Table($1);1))->
			//Si ($PosteCli=<>DBL_MachNam)  `◊DBL_UserNam
			//MESSAGE("Fiche verrouillée par vous même .")
			//Sinon 
			If ($Util#"") | ($PosteCli#"")
				MESSAGE:C88("Fiche verrouillée par "+$Util+" sur le poste "+$PosteCli+".")
			Else 
				MESSAGE:C88("Fiche verrouillée sur le fichier "+$nomfichier+" !")
			End if 
			//Fin de si 
			GOTO XY:C161(2; 3)
			MESSAGE:C88("Demandez la libération de la fiche.")
			GOTO XY:C161(2; 4)
			MESSAGE:C88($NomProc+" fichier "+$nomfichier)  //+" Id "+Chaine($idFiche))
		End if 
	End if 
End while 

If ($Compt>=10) & (Not:C34(Application type:C494=4D Server:K5:6))
	CLOSE WINDOW:C154
End if 