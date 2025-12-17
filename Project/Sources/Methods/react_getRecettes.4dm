//%attributes = {"publishedWeb":true}
ARRAY TEXT:C222($tVnom; 0)
ARRAY TEXT:C222($tVal; 0)
WEB GET VARIABLES:C683($tVnom; $tVal)

$champs:=KST_web_Lire_param(->$tVnom; ->$tVal; "champs")
$listeChaine:=KST_web_Lire_param(->$tVnom; ->$tVal; "valeurs")

If ($champs="nomMet")
	$allMets:=Split string:C1554($listeChaine; ",")
	$lstRecette:=ds:C1482.Recette.query("nomMet in :1"; $allMets)
Else 
	If ($champs="UUID_Recette")
		$allMets:=Split string:C1554($listeChaine; ",")
		$lstRecette:=ds:C1482.Recette.query("UUID_ in :1"; $allMets)
	Else 
		$allMets:=ds:C1482.Association.query("Met#null").distinct("Met")
		$lstRecette:=ds:C1482.Recette.query("nomMet in :1"; $allMets)
	End if 
End if 

$lstRecette_col:=$lstRecette.toCollection("UUID_,nomMet,imageBase64")
$chaineJSON:=JSON Stringify:C1217($lstRecette_col)

WEB SEND TEXT:C677($chaineJSON; "application/json")


