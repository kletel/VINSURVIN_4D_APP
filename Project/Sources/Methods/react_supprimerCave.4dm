//%attributes = {"publishedWeb":true}
ARRAY TEXT:C222($tVnom; 0)
ARRAY TEXT:C222($tVal; 0)
WEB GET VARIABLES:C683($tVnom; $tVal)

$uuid:=KST_web_Lire_param(->$tVnom; ->$tVal; "UUID_")
C_OBJECT:C1216($obj)

$cave:=ds:C1482.Cave.query("UUID_=:1"; $uuid).first()
$obj:=New object:C1471("nomVin"; $cave.Nom)
$supprimer:=$cave.drop()

If ($supprimer.success)
	OB SET:C1220($obj; "etat"; "succes")
	$chaineJSON:=JSON Stringify:C1217($obj; *)
Else 
	OB SET:C1220($obj; "etat"; "echec")
End if 
WEB SEND TEXT:C677($chaineJSON; "application/json")