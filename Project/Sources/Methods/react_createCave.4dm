//%attributes = {"publishedWeb":true}
$cave:=ds:C1482.Cave.new()
//$cave.save()
//$cave.Qte:=1 voir react NouveauVin useEffect(() --> setVin
$caveObj:=$cave.toObject()


$chaineJSON:=JSON Stringify:C1217($caveObj; *)
CONVERT FROM TEXT:C1011($chaineJSON; "utf-8"; $chaineJSON)
$chaineJSON:=BLOB to text:C555($chaineJSON; UTF8 texte sans longueur:K22:17)
WEB SEND TEXT:C677($chaineJSON; "application/json")

