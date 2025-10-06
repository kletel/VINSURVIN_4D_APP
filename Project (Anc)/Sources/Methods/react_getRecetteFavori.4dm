//%attributes = {"publishedWeb":true}
ARRAY TEXT:C222($tVnom; 0)
ARRAY TEXT:C222($tVal; 0)
WEB GET VARIABLES:C683($tVnom; $tVal)

$uuid_user:=KST_web_Lire_param(->$tVnom; ->$tVal; "UUID_User")
$uuid_met:=KST_web_Lire_param(->$tVnom; ->$tVal; "UUID_Met")
$lstRecette:=ds:C1482.Recette_Utilisateur.query("UUID_Utilisateur=:1 and UUID_Recette=:2"; $uuid_user; $uuid_met)
If ($lstRecette.length>0)
	$lstRecette_col:=$lstRecette.toCollection().first()
Else 
	$lstRecette_col:=""
End if 
$chaineJSON:=JSON Stringify:C1217($lstRecette_col; *)
CONVERT FROM TEXT:C1011($chaineJSON; "utf-8"; $chaineJSON)

$chaineJSON:=BLOB to text:C555($chaineJSON; UTF8 texte sans longueur:K22:17)
WEB SEND TEXT:C677($chaineJSON; "application/json")

