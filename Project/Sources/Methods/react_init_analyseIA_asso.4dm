//%attributes = {"publishedWeb":true}
/*TRACE
$colmet:=ds.Association.query("Langue=:1"; "fr").extract("Met")

Pour chaque ($met; $colmet)
$param:=Créer objet("met"; $met)
Tant que (Sémaphore("Recette : "+$met; 10))
APPELER 4D
Fin tant que 
$ref_p:=Nouveau process("react_analyseIA_Met"; 128*1024; "Recette : "+$met; $param)
//react_analyseIA_Met($param)
EFFACER SÉMAPHORE("Recette : "+$met)

Fin de chaque 
*/
TRACE:C157
$colmet:=ds:C1482.Association.query("Langue=:1"; "fr").extract("Met")

For each ($met; $colmet)
	$param:=New object:C1471("met"; $met)
/*
Tant que (Sémaphore("Recette : "+$met; 10))
APPELER 4D
Fin tant que */
	//$ref_p:=Nouveau process("react_analyseIA_Met"; 128*1024; "Recette : "+$met; $param)
	react_analyseIA_Met($param)
	//EFFACER SÉMAPHORE("Recette : "+$met)
	
End for each 
