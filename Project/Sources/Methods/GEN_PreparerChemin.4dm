//%attributes = {}
// Method: GEN_PreparerChemin
// But: vérifier si tous les dossiers dans le chemin passé existe, sinon créer les dossiers manquants
// Parametres:
// $1 TEXT chemin

// Declarer parametres
C_TEXT:C284($1; $tFolderPath)

// Declarer variables locales
_O_C_STRING:C293(1; $sDirGlyph)
C_TEXT:C284($tCreatePath)
C_TEXT:C284($tNextFolder)

// Reassigner

$tFolderPath:=$1

If ($tFolderPath#"")
	
	// prépare les chemins. Pour Windows, nous avons besoin d'aller au-delà du disque spécifié
	If (WIN_fIsWindows)
		If (Position:C15(":\\"; $tFolderPath)#0)
			$tCreatePath:=Substring:C12($tFolderPath; 0; Position:C15("\\"; $tFolderPath))
			$tFolderPath:=Substring:C12($tFolderPath; Position:C15("\\"; $tFolderPath)+1)
		End if 
		$sDirGlyph:="\\"
	Else 
		$sDirGlyph:=":"
	End if 
	
	// si le chemin ne fini pas par le sigle de répertoire ou le séparateur, nous l'ajoutons
	If ($tFolderPath[[Length:C16($tFolderPath)]]#$sDirGlyph)
		$tFolderPath:=$tFolderPath+$sDirGlyph
	End if 
	
	Repeat 
		// trouver le prochains dossier dans l'arborescence
		$tNextFolder:=Substring:C12($tFolderPath; 0; Position:C15($sDirGlyph; $tFolderPath))
		$tFolderPath:=Substring:C12($tFolderPath; Position:C15($sDirGlyph; $tFolderPath)+1)
		
		$tCreatePath:=$tCreatePath+$tNextFolder
		
		// créer le dossier s'il n'existe pas
		Case of 
			: (Test path name:C476($tCreatePath)#Est un dossier:K24:2)
				CREATE FOLDER:C475($tCreatePath)
			: (Test path name:C476($tCreatePath)=1)
				$tNextFolder:=""
		End case 
		
	Until ($tNextFolder="")
	
End if 