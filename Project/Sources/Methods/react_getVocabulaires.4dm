//%attributes = {"publishedWeb":true}
ARRAY TEXT:C222($tVnom; 0)
ARRAY TEXT:C222($tVal; 0)
WEB GET VARIABLES:C683($tVnom; $tVal)

//[Vocabulaire]Nom_Ang
$lstDict:=ds:C1482.Vocabulaire.all().orderBy("Nom_Fr asc")

$lstDict_col:=$lstDict.toCollection()
$chaineJSON:=JSON Stringify:C1217($lstDict_col; *)
CONVERT FROM TEXT:C1011($chaineJSON; "utf-8"; $chaineJSON)

$chaineJSON:=BLOB to text:C555($chaineJSON; UTF8 texte sans longueur:K22:17)
WEB SEND TEXT:C677($chaineJSON; "application/json")