//%attributes = {"publishedWeb":true}
ARRAY TEXT:C222($tVnom; 0)
ARRAY TEXT:C222($tVal; 0)
WEB GET VARIABLES:C683($tVnom; $tVal)

$uuid:=KST_web_Lire_param(->$tVnom; ->$tVal; "UUID_")



$plats:=ds:C1482.Mon_Oenologue.query("UUID=:1"; $uuid).toCollection("UUID,Plats").first()

$chaineJSON:=JSON Stringify:C1217($plats; *)
CONVERT FROM TEXT:C1011($chaineJSON; "utf-8"; $chaineJSON)
$chaineJSON:=BLOB to text:C555($chaineJSON; UTF8 text without length:K22:17)
WEB SEND TEXT:C677($chaineJSON; "application/json")

