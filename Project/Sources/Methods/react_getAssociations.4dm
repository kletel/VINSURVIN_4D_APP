//%attributes = {"publishedWeb":true}
ARRAY TEXT:C222($tVnom; 0)
ARRAY TEXT:C222($tVal; 0)
WEB GET VARIABLES:C683($tVnom; $tVal)

$lstAssos:=ds:C1482.Association.query("Langue=:1"; "fr").orderBy("Categorie asc")
//[Association]Categorie

$lstAssos_col:=$lstAssos.toCollection("Categorie,Sous_Categorie,Met,Vin,UUID_")
$chaineJSON:=JSON Stringify:C1217($lstAssos_col; *)
//collection v
CONVERT FROM TEXT:C1011($chaineJSON; "utf-8"; $chaineJSON)

$chaineJSON:=BLOB to text:C555($chaineJSON; UTF8 text without length:K22:17)
WEB SEND TEXT:C677($chaineJSON; "application/json")