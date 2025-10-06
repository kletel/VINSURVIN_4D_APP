//%attributes = {"publishedWeb":true}
ARRAY TEXT:C222($tVnom; 0)
ARRAY TEXT:C222($tVal; 0)
WEB GET VARIABLES:C683($tVnom; $tVal)

$b64:=KST_web_Lire_param(->$tVnom; ->$tVal; "b64")
//$requette:="Vous un caviste de plus de 30 ans d'experiences et vous devez decrire l'image a analyser avec le nom,la région, le pays, l'appellation,le millesime,le type de vin,quel est son apogee que tu nomera 'APOGEE', le taux d'alcool, la contenance, le type d"+"e bouteille, la durée d"+"e conservation, le site du "+"producteur, le nom du producteur, l'adresse du producteur, le prix moyen, il faudrait. des conseils d'associations mets et vins que tu nomera 'CONSEIL' ainsi que les cépages qui rentrent dans sa composition, merci.Le tout formaté dans un format JSON"+" pour que je puisse le traiter informatiquement."

//pas efficace //$requette:="Vous êtes un caviste expert avec 30 ans d'expérience. À partir de l'image fournie, décrivez l'étiquette du vin en renvoyant les informations suivantes dans un format JSON structuré : nom, région, pays, appellation, millésime, type de vin, apog"+"ée (\"APOGEE\"), taux d'alcool, contenance, type de bouteille, durée de conservation, site du producteur, nom du producteur, adresse du producteur, prix moyen, cépages, conseils mets et vins (\"CONSEIL\").\n"

//ancien
//$requette:="Vous êtes un caviste expert (30 ans d’expérience). À partir de l’image, décrivez l’étiquette du vin en JSON avec : nom, région, pays, appellation, millésime, type, apogée ('APOGEE'), alcool, contenance, bouteille, conservation, site, pro"+"ducteur (nom, adresse), prix moyen, couleur (Rouge,Blanc,Rosé), cépages, conseils mets et vins ('CONSEIL'). Si des infos manquent, complétez-les selon vos connaissances œnologiques sans retourner de champs vides."

//ajout de domaine
//$requette:="Vous êtes un caviste expert (30 ans d’expérience). À partir de l’image, décrivez l’étiquette du vin en JSON avec : nom, région, pays, appellation, millésime, type, apogée ('APOGEE'), alcool, contenance, bouteille, conservation, site, pro"+"ducteur (nom, adresse), prix moyen, couleur (Rouge,Blanc,Rosé), cépages, domaine, conseils mets et vins ('CONSEIL'). Si des infos manquent, complétez-les selon vos connaissances œnologiques sans retourner de champs vides."
$requette:="Vous êtes un caviste expert (30 ans d’expérience). À partir de l’image, décrivez l’étiquette du vin en JSON avec : nom, région, pays, appellation, millésime, type, apogée ('APOGEE'), alcool, contenance, conservation, site, pro"+"ducteur (nom, adresse), prix moyen, couleur (Rouge,Blanc,Rosé), cépages, domaine, conseils mets et vins ('CONSEIL'). Si des infos manquent, complétez-les selon vos connaissances œnologiques sans retourner de champs vides."

$jsonBrut:=IA_imageverstexte(""; $requette; $b64)
$json:=Substring:C12($jsonBrut; Position:C15("{"; $jsonBrut))

$json:=Replace string:C233($json; "```json"; ""; 99999)
$json:=Replace string:C233($json; "```"; ""; 99999)
C_BLOB:C604($blobImg)
C_PICTURE:C286($Img)
$tableIA:=ds:C1482.Analyse_IA.new()
$tableIA.requete:=$requette
$tableIA.b64:=$b64
BASE64 DECODE:C896($tableIA.b64; $blobImg)
$tableIA.blobImage:=$blobImg
BLOB TO PICTURE:C682($blobImg; $Img)
$tableIA.image:=$Img
$tableIA.reponse:=$jsonBrut
$tableIA.reponseFormate:=$json
$tableIA.date:=Current date:C33(*)
$tableIA.heure:=Current time:C178
$tableIA.save()

C_OBJECT:C1216($Obj)
$Obj:=JSON Parse:C1218($json)
$jsonSend:=JSON Stringify:C1217($Obj)
WEB SEND TEXT:C677($jsonSend; "application/json")


$tableIA.reponseEnvoye:=$jsonSend
$tableIA.save()
