//%attributes = {"publishedWeb":true}
ARRAY TEXT:C222($tVnom; 0)
ARRAY TEXT:C222($tVal; 0)
WEB GET VARIABLES:C683($tVnom; $tVal)

//[Informations]Actif_FR =bool
$lstInfos:=ds:C1482.Informations.all()
$lstInfos_col:=$lstInfos.toCollection()
$chaineJSON:=JSON Stringify:C1217($lstInfos_col; *)
//collection v
CONVERT FROM TEXT:C1011($chaineJSON; "utf-8"; $chaineJSON)

$chaineJSON:=BLOB to text:C555($chaineJSON; UTF8 texte sans longueur:K22:17)
WEB SEND TEXT:C677($chaineJSON; "application/json")

//[Informations]Titre_Info_Fr
//[Informations]Texte_WP_FR