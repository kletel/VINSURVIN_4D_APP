//%attributes = {"publishedWeb":true}
ARRAY TEXT:C222($tVnom; 0)
ARRAY TEXT:C222($tVal; 0)
WEB GET VARIABLES:C683($tVnom; $tVal)

$uuid:=KST_web_Lire_param(->$tVnom; ->$tVal; "UUID_")



$cave:=ds:C1482.Cave.query("UUID_=:1"; $uuid).toCollection("UUID_,Nom,Type,Pays,Région,Reste_en_Cave,Millesime,Apogee,Valeur_Euro,Appellation,Producteur,Producteur_Adresse,Producteur_Infos,Ref_Cave,Cave,Coup_de_Coeur,Note_sur_20,base64_etiquettecomplet,Degustation_Nez,Degustation_Vue,Degustation_Palais,Remarq"+"uesIA,Valeur,Sous"+"_Region,Producteur,"+"Cepage,Alco"+"ol,Couleur,Etagere,"+"Flacon,Dont_Bue,"+"Date_Achat,Prix_"+"Achat,Qte,Temperature,valeurCave,Lieu_Achat,Elevage,Apogee_Max,Remarques").first()
//$cave:=ds.Cave.query("UUID_=:1"; $uuid).toCollection().first()

$chaineJSON:=JSON Stringify:C1217($cave; *)
CONVERT FROM TEXT:C1011($chaineJSON; "utf-8"; $chaineJSON)
$chaineJSON:=BLOB to text:C555($chaineJSON; UTF8 text without length:K22:17)
WEB SEND TEXT:C677($chaineJSON; "application/json")

//[Cave]Lieu_Achat