//%attributes = {"publishedWeb":true}
ARRAY TEXT:C222($tVnom; 0)
ARRAY TEXT:C222($tVal; 0)
WEB GET VARIABLES:C683($tVnom; $tVal)

$uuid:=KST_web_Lire_param(->$tVnom; ->$tVal; "UUID_")

//$lstCaves:=ds.Cave.all().orderBy("Nom asc")
$lstCaves:=ds:C1482.Cave.query("UUID_User=:1 and Coup_de_Coeur=:2"; $uuid; True:C214).orderBy("Nom asc")
$lstCaves_col:=$lstCaves.toCollection("UUID_,Nom,Type,Pays,Région,Reste_en_Cave,Millesime,Apogee,Valeur_Euro,Appellation,Ref_Cave,Cave,Coup_de_Coeur,Note_sur_20,base64_132etiquette,Couleur,valeurCave, Valeur")
$chaineJSON:=JSON Stringify:C1217($lstCaves_col; *)
//collection v
CONVERT FROM TEXT:C1011($chaineJSON; "utf-8"; $chaineJSON)

$chaineJSON:=BLOB to text:C555($chaineJSON; UTF8 texte sans longueur:K22:17)
WEB SEND TEXT:C677($chaineJSON; "application/json")