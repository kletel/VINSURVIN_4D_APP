//%attributes = {"publishedWeb":true}
ARRAY TEXT:C222($tVnom; 0)
ARRAY TEXT:C222($tVal; 0)
WEB GET VARIABLES:C683($tVnom; $tVal)

$uuid:=KST_web_Lire_param(->$tVnom; ->$tVal; "UUID_")
$cave_champsModifie:=KST_web_Lire_param(->$tVnom; ->$tVal; "champsModif")
$uuid_user:=KST_web_Lire_param(->$tVnom; ->$tVal; "UUIDuser")

$cave:=ds:C1482.Cave.query("UUID_=:1"; $uuid).first()
C_OBJECT:C1216($obj_champsMod)
$obj_champsMod:=JSON Parse:C1218($cave_champsModifie)
$cave.fromObject($obj_champsMod)
$cave.UUID_User:=$uuid_user
$cave.save()
//$cave:=ds.Cave.query("UUID_=:1"; $uuid).toCollection("UUID_,Nom,Type,Pays,Région,Reste_en_Cave,Millesime,Apogee,Valeur_Euro,Appellation,Ref_Cave,Cave,Coup_de_Coeur,Note_sur_20,base64_etiquette").first()
$cave:=ds:C1482.Cave.query("UUID_=:1"; $uuid).toCollection().first()


$chaineJSON:=JSON Stringify:C1217($cave; *)
CONVERT FROM TEXT:C1011($chaineJSON; "utf-8"; $chaineJSON)
$chaineJSON:=BLOB to text:C555($chaineJSON; UTF8 texte sans longueur:K22:17)
WEB SEND TEXT:C677($chaineJSON; "application/json")

