//%attributes = {}

// ----------------------------------------------------
// Nom utilisateur (OS) : Seb
// Date et heure : 03/02/11, 20:30:57
// ----------------------------------------------------
// Méthode : GEN_SupprimerSelection
// Description
// 
//
// Paramètres
// ----------------------------------------------------


C_POINTER:C301($1)  //pointeur sur fichier a supprimer
C_LONGINT:C283($2; $Nb_Iteration)  // param facultatif precisant le nombre d'iteration maximum 

If (Count parameters:C259>1)
	$Nb_Iteration:=$2
Else 
	$Nb_Iteration:=0
End if 
If (Records in selection:C76($1->)#0)
	READ WRITE:C146($1->)
	$Nomtable:=Table name:C256($1)
	DELETE SELECTION:C66($1->)
	If (Records in set:C195("LOCKEDSET")#0)
		USE SET:C118("LOCKEDSET")
		$cpt:=0
		$stop:=False:C215
		Repeat 
			$cpt:=$cpt+1
			GOTO XY:C161(1; 1)
			If (Not:C34(Application type:C494=4D Server:K5:6))
				MESSAGE:C88("• Fiches "+$Nomtable+" verrouillées. Attente !")
			End if 
			DELETE SELECTION:C66($1->)
			If (Records in set:C195("LOCKEDSET")#0)
				USE SET:C118("LOCKEDSET")
			End if 
			
			If ($Nb_Iteration#0)
				If ($cpt>=$Nb_Iteration)
					$stop:=True:C214
				End if 
			End if 
		Until ((Records in set:C195("LOCKEDSET")=0) | ($stop))
	End if 
	READ ONLY:C145($1->)
End if 
