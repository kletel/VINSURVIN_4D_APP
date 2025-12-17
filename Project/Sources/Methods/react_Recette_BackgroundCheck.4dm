//%attributes = {}
// ─────────────────────────────────────────────
// Méthode : react_Recette_BackgroundCheck
// Processus de fond lancé au démarrage
// ─────────────────────────────────────────────

C_OBJECT:C1216($selRecettes; $recetteEntity)
C_TEXT:C284($met)

$selRecettes:=ds:C1482.Recette.all()

C_LONGINT:C283($i; $count)
$count:=$selRecettes.length

For ($i; 0; $count-1)
	$recetteEntity:=$selRecettes[$i]
	$met:=$recetteEntity.nomMet
	
	If ($met#"")
		// Utilise la même protection que ton endpoint (sémaphore par met)
		While (Semaphore:C143("Recette : "+$met; 10))
			IDLE:C311  // laisse respirer les autres process
		End while 
		
		// On force la génération d'image si manquante
		react_EnsureRecetteWithImage($met)
		
		CLEAR SEMAPHORE:C144("Recette : "+$met)
		
	End if 
End for 

// À la fin, le process se termine tout seul
