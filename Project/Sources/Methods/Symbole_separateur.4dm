//%attributes = {}
//Méthode projet Symbole séparateur
// Symbole séparateur -> Entier
// Symbole séparateur -> code de "\\" (Windows) ou ":" (Mac OS)

C_LONGINT:C283($platform)
_O_PLATFORM PROPERTIES:C365($platform)

_O_C_INTEGER:C282($0)

If ($platform#Mac OS:K25:2)
	$0:=Character code:C91("\\")
Else 
	$0:=Character code:C91(":")
End if 
