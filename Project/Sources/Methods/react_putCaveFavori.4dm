//%attributes = {"publishedWeb":true}
ARRAY TEXT:C222($tVnom; 0)
ARRAY TEXT:C222($tVal; 0)
WEB GET VARIABLES:C683($tVnom; $tVal)

$uuid:=KST_web_Lire_param(->$tVnom; ->$tVal; "UUID_")
$CoupDeCoeur:=C_BOOLEAN:C305(KST_web_Lire_param(->$tVnom; ->$tVal; "Coup_de_Coeur"))



$cave:=ds:C1482.Cave.query("UUID_=:1"; $uuid).first()
$cave.Coup_de_Coeur:=$CoupDeCoeur
$cave.save()

$obj:=New object:C1471("entete"; "succes"; "msg"; $UUIDuser; "nomUser"; $nomUser)
$resp:=JSON Stringify:C1217($obj)
WEB SEND TEXT:C677($resp; "application/json")
//[Cave]Reste_en_Cave

