//%attributes = {}
C_COLLECTION:C1488($plats)
C_OBJECT:C1216($plat; $recetteEntity; $param)
C_TEXT:C284($met)

$plats:=ds:C1482.Association.all().toCollection()

For each ($plat; $plats)
	$met:=$plat.Met
	
	$recetteEntity:=ds:C1482.Recette.query("nomMet = :1"; $met)
	
	If ($recetteEntity.length=0)
		$param:=New object:C1471("met"; $met)
		react_analyseIA_Met($param)
		DELAY PROCESS:C323(Current process:C322; 2)
	End if 
End for each 

LOG EVENT:C667("Recette_BackgroundCheck terminé — toutes les recettes manquantes ont été générées.")
