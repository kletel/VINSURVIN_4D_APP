//%attributes = {}
// Method: GEN_tCheminDossier
// but: retourner les dossiers dans le chemin passé
// Parametres:
// $0 TEXTE  - le chemin complet au fichier sans le nom actuel du fichier
// $1 TEXTE  - le chemin complet au fichier


// Declarer les parametress
C_TEXT:C284($0)
C_TEXT:C284($1; $tPathName)

// Declarer les  variables locales
C_LONGINT:C283($i)
C_LONGINT:C283($LLength)
C_LONGINT:C283($LPosition)
_O_C_STRING:C293(1; $sDirGlyph)

// Reassigner
$tPathName:=$1

If (WIN_fIsWindows)
	$sDirGlyph:="\\"
Else 
	$sDirGlyph:=":"
End if 

$LLength:=Length:C16($tPathName)
$LPosition:=0
For ($i; $LLength; 1; -1)
	If ($tPathName[[$i]]=$sDirGlyph)
		$LPosition:=$i
		$i:=0
	End if 
End for 
If ($LPosition>0)
	$0:=Substring:C12($tPathName; 1; $LPosition)
Else 
	$0:=$tPathName
End if 