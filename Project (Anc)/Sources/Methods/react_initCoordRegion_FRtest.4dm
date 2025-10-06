//%attributes = {"publishedWeb":true}
$lstRegion:=ds:C1482.Region.all().orderBy("Nom_Fr asc")
$cle_api_K:="e43e57d4a7dd4a38b44eb31cf6d12f51"


For each ($region; $lstRegion)
	
	// Préparation des données
	$paysEntity:=ds:C1482.Pays.query("Ref_Pays = :1"; $region.Ref_Pays).first()
	$nom:=$region.Nom_Fr
	$pays:=$paysEntity.Nom_Fr
	
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
	
	$signal:=New signal:C1641("attente de deux minutes si nombreux fichiers")
	$signal.wait(1)  //en seconde
	
End for each 