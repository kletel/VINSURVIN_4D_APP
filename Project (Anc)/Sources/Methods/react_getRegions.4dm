//%attributes = {"publishedWeb":true}
ARRAY TEXT:C222($tVnom; 0)
ARRAY TEXT:C222($tVal; 0)
WEB GET VARIABLES:C683($tVnom; $tVal)

$lstRegion:=ds:C1482.Region.all().orderBy("Nom_Fr asc")

$lstRegion_col:=$lstRegion.toCollection()
$chaineJSON:=JSON Stringify:C1217($lstRegion_col; *)
CONVERT FROM TEXT:C1011($chaineJSON; "utf-8"; $chaineJSON)

$chaineJSON:=BLOB to text:C555($chaineJSON; UTF8 texte sans longueur:K22:17)
WEB SEND TEXT:C677($chaineJSON; "application/json")