//%attributes = {"publishedWeb":true}
ARRAY TEXT:C222($tVnom; 0)
ARRAY TEXT:C222($tVal; 0)
WEB GET VARIABLES:C683($tVnom; $tVal)

var $client:=cs:C1710.AIKit.OpenAI.new(API_OPENAI("OPENAI"))
$b64:=KST_web_Lire_param(->$tVnom; ->$tVal; "b64")
$requette:="Vous êtes un caviste expert (30 ans d’expérience). À partir de l’image, décrivez l’étiquette du vin en JSON avec : nom, région, pays, appellation, millésime, type, apogée ('APOGEE'), alcool, contenance, conservation, site, pro"+"ducteur (nom, adresse), prix moyen, couleur (Rouge,Blanc,Rosé), cépages, domaine, conseils mets et vins ('CONSEIL'). Si des infos manquent, complétez-les selon vos connaissances œnologiques sans retourner de champs vides."

//$jsonBrut:=IA_imageverstexte(""; $requette; $b64)
//$jsonBrut:=$client.chat.vision.create($b64).prompt($requette).choice.message.content
//var $messages:=[{role: "user"; content: "You are a helpful assistant."}]
$base64_image:="data:image/png;base64,"+$b64
//$jsonBrut:=$client.chat.vision.create($b64; {model: "gpt-4o"}).prompt($requette).choice.message.content
$jsonBrut:=$client.chat.vision.create($base64_image).prompt($requette).choice.message.content




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
