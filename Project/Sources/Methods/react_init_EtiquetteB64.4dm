//%attributes = {"publishedWeb":true}

$lstCaves:=ds:C1482.Cave.all()

For each ($vin; $lstCaves)
	
	$defaultPath:=Get 4D folder:C485(Dossier Resources courant:K5:16)+"Pictos"+Séparateur dossier:K24:12+"Cadre.png"
	// Choisir la source de l'image
	If (Picture size:C356($vin.Etiquette)>0)
		$picture:=$vin.Etiquette
	Else 
		READ PICTURE FILE:C678($defaultPath; $picture)
	End if 
	// Conversion en BLOB puis en Base64
	//CRÉER IMAGETTE($picture; $image; 132; 132; Non tronquée)
	//IMAGE VERS BLOB($image; $blobImage; "image/jpg")
	//ENCODER BASE64($blobImage; $base64)
	//// Sécurité : si vide, recharger image par défaut
	If ($base64="")
		READ PICTURE FILE:C678($defaultPath; $picture)
		PICTURE TO BLOB:C692($picture; $blobImage; "image/jpg")
		BASE64 ENCODE:C895($blobImage; $base64)
	End if 
	
	//$vin.base64_etiquette:="data:image/png;base64,"+$base64
	$vin.base64_etiquette:=$base64
	If ($vin.Région="Bordeaux")
		$vin.Région:="Bordelais"
	End if 
	$vin.save()
End for each 
TRACE:C157
If (False:C215)
	For each ($vin; $lstCaves)
		$vin.base64_etiquette:=Substring:C12($vin.base64_etiquette; 24; Length:C16($vin.base64_etiquette))
		$vin.save()
	End for each 
End if 