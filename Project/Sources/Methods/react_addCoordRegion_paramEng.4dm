//%attributes = {"publishedWeb":true}
$cle_api_K:="e43e57d4a7dd4a38b44eb31cf6d12f51"

$regionEntity:=$0
$paysEntity:=$1
$nom:=$regionEntity.Nom_En
$pays:=$paysEntity.Nom_Eng

If ($nom="")  //(ajout de l'IA)
	$nom:=$region.Nom_Fr
End if 

// Crée la requête OpenCage
$query:=$nom+" "+$pays
$encodedQuery:=react_encodeURI($query)
$url:="https://api.opencagedata.com/geocode/v1/json?q="+$encodedQuery+"&key="+$cle_api_K

// Appel HTTP
$response:=New object:C1471
HTTP Get:C1157($url; $response)

If ($response.status.code=200)
	$geometry:=$response.body.results[0].geometry
	$geometry:=$response.results[0].geometry
	$region.Lieu_geo:=$response.results[0].formatted
	$region.Longitude:=$geometry.lng
	$region.Latitude:=$geometry.lat
	$region.save()
Else 
	ALERT:C41("Erreur API pour la région : "+$nom)
End if 
