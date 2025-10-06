//%attributes = {}
// Méthode projet Nom long vers chemin accès
// Nom long vers chemin accès ( Chaîne ) -> Chaîne
// Nom long vers chemin accès ( nom long ) -> chemin d'accès

_O_C_STRING:C293(255; $1; $0)
_O_C_STRING:C293(1; $vsDirSymbol)
_O_C_INTEGER:C282($viLen; $viPos; $viChar; $viDirSymbol)

$viDirSymbol:=Symbole_separateur
$viLen:=Length:C16($1)
$viPos:=0
For ($viChar; $viLen; 1; -1)
	If (Character code:C91($1[[$viChar]])=$viDirSymbol)
		$viPos:=$viChar
		$viChar:=0
	End if 
End for 
If ($viPos>0)
	$0:=Substring:C12($1; 1; $viPos)
Else 
	$0:=$1
End if 
If (<>vbDebugOn)  // Mettre la variable à Vrai ou Faux dans la méthode base Sur ouverture
	If ($0="")
		TRACE:C157
	End if 
End if 
