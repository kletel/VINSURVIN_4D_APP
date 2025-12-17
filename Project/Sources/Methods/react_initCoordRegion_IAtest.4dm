//%attributes = {"publishedWeb":true}
// Étape 1 - Préparation des données
$lstRegion:=ds:C1482.Region.all().orderBy("Nom_Fr asc")
//$lstRegion:=ds.Region.query("Longitude = :1"; Null).orderBy("Nom_Fr asc")
$tableauTexte:="Voici une liste de régions et leurs pays associés. Pour chacune, retourne la latitude et la longitude sous forme de collection JSON avec les clés 'Nom_Fr', 'Latitude', 'Longitude'.\n\n"

// Construction du prompt
For each ($region; $lstRegion)
	$paysEntity:=ds:C1482.Pays.query("Ref_Pays = :1"; $region.Ref_Pays).first()
	$nom:=$region.Nom_Fr
	$pays:=$paysEntity.Nom_Fr
	$tableauTexte:=$tableauTexte+"- "+$nom+" ("+$pays+")\n"
End for each 

// Étape 2 - Préparation de la requête pour GPT-4o
$api_key:=API_OPENAI("OPENAI")
$auth:="Bearer "+$api_key
$headers:=New collection:C1472("Content-Type"; "application/json"; "Authorization"; $auth)

$content:=New object:C1471("type"; "text"; "text"; $tableauTexte)
$arrcontent:=New collection:C1472($content)

$messageUser:=New object:C1471("role"; "user"; "content"; $arrcontent)
$messages:=New collection:C1472($messageUser)

$payload:=New object:C1471("model"; "gpt-4o"; "messages"; $messages; "max_tokens"; 1500)
$requestTxt:=JSON Stringify:C1217($payload)
CONVERT FROM TEXT:C1011($requestTxt; "utf-8"; $requestBlob)

$endpoint:="https://api.openai.com/v1/chat/completions"
$response:=KSF_HTTP_POST($endpoint; $headers; $requestBlob)

// Étape 3 - Extraction du contenu de la réponse
C_TEXT:C284($txtmessage)
$txtmessage:=$response.choices[0].message.content

// Étape 4 - Conversion de la réponse JSON en collection
C_COLLECTION:C1488($collRep)
$json:=Substring:C12($txtmessage; Position:C15("{"; $txtmessage))
$json:=Substring:C12($json; 0; Position:C15("}"; $json))
$json:=Replace string:C233($json; "```json"; ""; 99999)
$json:=Replace string:C233($json; "```"; ""; 99999)


$collRep:=JSON Parse:C1218($json)

// Étape 5 - Mise à jour des régions
For each ($rep; $collRep)
	$nomRegion:=$rep.Nom_Fr
	$lat:=$rep.Latitude
	$lng:=$rep.Longitude
	
	// Recherche de la région correspondante dans la base
	$regionMatch:=ds:C1482.Region.query("Nom_Fr = :1"; $nomRegion).first()
	If ($regionMatch#Null:C1517)
		$regionMatch.Latitude:=$lat
		$regionMatch.Longitude:=$lng
		$regionMatch.Lieu_geo:="GPT"
		$regionMatch.save()
	Else 
		ALERT:C41("Nom non trouvé : "+$nomRegion)
	End if 
End for each 
