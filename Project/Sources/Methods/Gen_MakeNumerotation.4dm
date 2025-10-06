//%attributes = {}

// ----------------------------------------------------
// Nom utilisateur (OS) : Seb
// Date et heure : 03/02/11, 20:34:32
// ----------------------------------------------------
// Méthode : Gen_MakeNumerotation
// Description
// 
// on cree la numerotation de toutes les tables de la base
// Paramètres
// ----------------------------------------------------

TRACE:C157
ALL RECORDS:C47([Numerotation:23])
GEN_SupprimerSelection(->[Numerotation:23])
C_TEXT:C284($nomTable)
$nbtable:=Get last table number:C254
For ($i; 1; $nbtable)
	CREATE RECORD:C68([Numerotation:23])
	If (Is table number valid:C999($i))
		$nomTable:=Table name:C256($i)
	Else 
		$nomTable:="TABLE SUPPRIME "+String:C10($i)
	End if 
	[Numerotation:23]NomTable:3:=$nomTable
	[Numerotation:23]NrTable:4:=$i
	
	$table:=Table:C252($i)
	$champ:=Field:C253($i; 1)
	
	If (Type:C295($champ->)=Est un entier long:K8:6)
		ALL RECORDS:C47($table->)
		ORDER BY:C49($table->; $champ->; <)
		[Numerotation:23]CompteurCourant:1:=$champ->+1
		
		If ([Numerotation:23]CompteurCourant:1<200000)
			[Numerotation:23]CompteurCourant:1:=200000
		End if 
	Else 
		[Numerotation:23]CompteurCourant:1:=200000
	End if 
	
	
	SAVE RECORD:C53([Numerotation:23])
End for 
UNLOAD RECORD:C212([Numerotation:23])