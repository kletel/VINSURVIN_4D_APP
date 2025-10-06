//%attributes = {}
// ----------------------------------------------------
// Nom utilisateur (OS) : Seb
// Date et heure : 18/03/10, 11:50:01
// ----------------------------------------------------
// Méthode : Gen_NumerAuto
// Description
// 
//
// Paramètres
// ----------------------------------------------------
ALL RECORDS:C47([Numerotation:23])
C_POINTER:C301($1)
GOTO RECORD:C242([Numerotation:23]; Table:C252($1)-1)
GEN_WaitVerrou(->[Numerotation:23])
$Numero:=[Numerotation:23]CompteurCourant:1
[Numerotation:23]CompteurCourant:1:=[Numerotation:23]CompteurCourant:1+1
SAVE RECORD:C53([Numerotation:23])
UNLOAD RECORD:C212([Numerotation:23])

C_LONGINT:C283($Fichier)
C_LONGINT:C283($tableDest; $champDest)
$Fichier:=Table:C252($1)
$NumRub:=Get last field number:C255($1)  //
$Done:=False:C215
For ($i; 1; $NumRub)
	If (Is field number valid:C1000($Fichier; $i))
		If (Field name:C257(Field:C253($Fichier; $i))="ID_@")
			GET RELATION PROPERTIES:C686($Fichier; $i; $tableDest; $champDest)
			If ($tableDest#0) & ($champDest#0)
				
			Else 
				Field:C253($Fichier; $i)->:=$Numero
				$Done:=True:C214
			End if 
		End if 
	End if 
End for 

If (Not:C34($Done))
	TRACE:C157
End if 