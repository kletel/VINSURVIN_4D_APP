//%attributes = {"publishedWeb":true}
ARRAY TEXT:C222($tVnom; 0)
ARRAY TEXT:C222($tVal; 0)
WEB GET VARIABLES:C683($tVnom; $tVal)

$uuid:=KST_web_Lire_param(->$tVnom; ->$tVal; "UUID_")

C_COLLECTION:C1488($jsonRepartition)
$jsonRepartition:=New collection:C1472

$lstPaysCaves:=ds:C1482.Cave.query("UUID_User=:1"; $uuid).distinct("Pays")
$lstPays:=ds:C1482.Pays.query("Nom_Fr in :1"; $lstPaysCaves)

For each ($pays; $lstPays)
	$nbCavesPays:=ds:C1482.Cave.query("Pays=:1 and UUID_User=:2"; $pays.Nom_Fr; $uuid).length
	$jsonRepartition.push(New object:C1471("x"; $pays.Nom_Fr; "y"; $nbCavesPays))
	
End for each 


$chaineJSON:=JSON Stringify:C1217($jsonRepartition; *)
CONVERT FROM TEXT:C1011($chaineJSON; "utf-8"; $chaineJSON)

$chaineJSON:=BLOB to text:C555($chaineJSON; UTF8 texte sans longueur:K22:17)
WEB SEND TEXT:C677($chaineJSON; "application/json")