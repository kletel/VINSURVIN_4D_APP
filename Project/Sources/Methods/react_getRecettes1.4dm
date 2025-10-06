//%attributes = {"publishedWeb":true}
ARRAY TEXT:C222($tVnom; 0)
ARRAY TEXT:C222($tVal; 0)
WEB GET VARIABLES:C683($tVnom; $tVal)


$allMets:=ds:C1482.Association.all().distinct("Met")

$lstRecette:=ds:C1482.Recette.query("nomMet in :1"; $allMets)
$lstRecette_col:=$lstRecette.toCollection()
$chaineJSON:=JSON Stringify:C1217($lstRecette_col; *)
CONVERT FROM TEXT:C1011($chaineJSON; "utf-8"; $chaineJSON)

$chaineJSON:=BLOB to text:C555($chaineJSON; UTF8 texte sans longueur:K22:17)
WEB SEND TEXT:C677($chaineJSON; "application/json")


//recup uuid user


//Faire un autre get pour verif si cette recette appparaitou sinon le gerer dans l.
//refaie un get est mieux.