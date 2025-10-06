Class extends Entity

/*
exposed Function get base64_etiquette() : Text
$defaultPath:=Dossier 4D(Dossier Resources courant)+"Pictos"+Séparateur dossier+"Cadre.png"
// Choisir la source de l'image
Si (Taille image(This.Etiquette)>0)
$picture:=This.Etiquette
Sinon 
LIRE FICHIER IMAGE($defaultPath; $picture)
Fin de si 
// Conversion en BLOB puis en Base64
IMAGE VERS BLOB($picture; $blobImage; "image/jpg")
ENCODER BASE64($blobImage; $base64)
// Sécurité : si vide, recharger image par défaut
Si ($base64="")
LIRE FICHIER IMAGE($defaultPath; $picture)
IMAGE VERS BLOB($picture; $blobImage; "image/jpg")
ENCODER BASE64($blobImage; $base64)
Fin de si 
*/
exposed Function get base64_132etiquette() : Text
	CREATE THUMBNAIL:C679(This:C1470.Etiquette; $image; 132; 132; Non tronquée:K6:2)
	PICTURE TO BLOB:C692($image; $blobImage; "image/jpg")
	BASE64 ENCODE:C895($blobImage; $base64)
	return $base64
	
exposed Function get base64_etiquettecomplet() : Text
	var $img : Picture
	PICTURE PROPERTIES:C457(This:C1470.Etiquette; $largeur; $hauteur)
	If ($largeur>400)
		$img:=This:C1470.Etiquette*(400/$largeur)
	Else 
		$img:=This:C1470.Etiquette
	End if 
	PICTURE TO BLOB:C692($img; $blobImage; "image/jpg")
	If (($blobImage)#Null:C1517)
		BASE64 ENCODE:C895($blobImage; $base64)
		return $base64
	Else 
		return "erreur"
	End if 
	
	
exposed Function get valeurCave() : Real
	return This:C1470.Valeur*This:C1470.Reste_en_Cave
	
	
exposed Function get Longitude() : Integer
	//return This.Li_Caves_Region.Longitude
	If (ds:C1482.Region.query("Nom_Fr = :1"; This:C1470.Région).length>0)
		If (ds:C1482.Region.query("Nom_Fr = :1"; This:C1470.Région).first().Longitude#Null:C1517)
			return ds:C1482.Region.query("Nom_Fr = :1"; This:C1470.Région).first().Longitude
		End if 
	End if 
	
exposed Function get Latitude() : Integer
	If (ds:C1482.Region.query("Nom_Fr = :1"; This:C1470.Région).length>0)
		If (ds:C1482.Region.query("Nom_Fr = :1"; This:C1470.Région).first().Latitude#Null:C1517)
			return ds:C1482.Region.query("Nom_Fr = :1"; This:C1470.Région).first().Latitude
		End if 
	End if 