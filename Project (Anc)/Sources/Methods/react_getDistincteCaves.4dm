//%attributes = {"publishedWeb":true}
ARRAY TEXT:C222($tVnom; 0)
ARRAY TEXT:C222($tVal; 0)
WEB GET VARIABLES:C683($tVnom; $tVal)

$uuid:=KST_web_Lire_param(->$tVnom; ->$tVal; "UUID_")
$lstCaves:=ds:C1482.Cave.query("UUID_User=:1"; $uuid).distinct("Cave")

//$lstCaves:=ds.Cave.all().distinct("Cave")

If ($lstCaves.countValues("Cave principale")=0)
	$lstCaves.push("Cave principale")
End if 
If ($lstCaves.countValues("Dégustation")=0)
	$lstCaves.push("Dégustation")
End if 

$chaineJSON:=JSON Stringify:C1217($lstCaves; *)
//collection v
CONVERT FROM TEXT:C1011($chaineJSON; "utf-8"; $chaineJSON)

$chaineJSON:=BLOB to text:C555($chaineJSON; UTF8 texte sans longueur:K22:17)
WEB SEND TEXT:C677($chaineJSON; "application/json")