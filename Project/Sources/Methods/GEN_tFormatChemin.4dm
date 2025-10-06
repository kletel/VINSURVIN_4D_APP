//%attributes = {}
// Method: GEN_tFormatChemin
// but: Modifie le chemin d'accès pour correspondre à la plateforme de la machine courante
// Parametres:
// $0 TEXTE pathname - chemin modifié selon la plateforme
// $1 TEXTE pathname - chemin original

// Declarer parametres
C_TEXT:C284($0)
C_TEXT:C284($1; $tPathname)

// Reassigner
$tPathname:=$1

If ($tPathname#"")
	
	If (WIN_fIsWindows)
		
		If (Position:C15(":\\"; $tPathname)=0)
			$tPathname:=Replace string:C233($tPathname; ":"; "\\")
		End if 
		
	Else 
		
		If (Position:C15(":\\"; $tPathname)#0)
			$tPathname:=Substring:C12($tPathname; Position:C15("\\"; $tPathname)+1)
		Else 
			$tPathname:=":"+$tPathname  // declarer à côté de la structure
		End if 
		
		$tPathname:=Replace string:C233($tPathname; "\\"; ":")
		
	End if 
	
End if 

$0:=$tPathname