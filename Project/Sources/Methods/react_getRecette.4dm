//%attributes = {"publishedWeb":true}
ARRAY TEXT:C222($tVnom; 0)
ARRAY TEXT:C222($tVal; 0)
WEB GET VARIABLES:C683($tVnom; $tVal)

$met:=KST_web_Lire_param(->$tVnom; ->$tVal; "met")
//$uuidRecette:=KST_web_Lire_param(->$tVnom; ->$tVal; "uuidRecette")


//Tant que (Non(Sémaphore("Recette : "+$met; 10)))  //attendre 1.5 secondes

$recetteEntity:=ds:C1482.Recette.query("nomMet =:1"; $met)


If ($recetteEntity.length=0)
	$param:=New object:C1471("met"; $met)
	While (Semaphore:C143("Recette : "+$met; 10))
		IDLE:C311
	End while 
	react_analyseIA_Met($param)
	CLEAR SEMAPHORE:C144("Recette : "+$met)
	$recette:=ds:C1482.Recette.query("nomMet =:1"; $met).toCollection().first()
Else 
	$recette:=$recetteEntity.toCollection().first()
End if 

// Vérifie si le process "BackgroundRecettes" existe déjà
C_TEXT:C284($processName)
C_LONGINT:C283($processNum)

//$processName:="react_BackgroundRecettes"

//// Renvoie le numéro du process (0 s’il n’existe pas)
//$processNum:=Process number($processName)

//// Si le process n'existe pas encore (numéro = 0)
//If ($processNum=0)
//New process("react_Recette_BackgroundCheck"; 128*64; $processName)
//End if 

If (($recette.imageUrl="") | ($recette.imageUrl=Null:C1517) | Undefined:C82($recette.imageUrl) | ($recette.imageBase64="") | ($recette.imageBase64=Null:C1517) | Undefined:C82($recette.imageBase64))
	$recetteEntity:=ds:C1482.Recette.query("UUID_ =:1"; $recette.UUID_).first()
	
	var $client:=cs:C1710.AIKit.OpenAI.new(API_OPENAI("OPENAI"))
	$imagePrompt:="Photographie culinaire de haute qualité représentant le plat \""+$met+". Le plat est présenté sur une table en bois rustique, avec une lumière naturelle douce et une mise au point sur les textures. Aucun humain visible. Style : photographie gastronomique professionnelle, ambiance chaleureuse et appétissante."
	var $image:=$client.images.generate($imagePrompt; {size: "1024x1024"}).image.url
	// Déduire extension
	C_TEXT:C284($filename; $ext)
	$ext:=".png"
	$filename:="plat_"+Replace string:C233($met; " "; "_")+$ext
	
	C_BLOB:C604($imageBlob)
	C_LONGINT:C283($status)
	$recetteEntity.nomFichier:=$filename
	$recetteEntity.imageUrl:=$image
	$recetteEntity.dateModif:=Current date:C33(*)
	$status:=HTTP Get:C1157($image; $imageBlob)
	// Télécharger l'image sous forme de BLOB
	If ($status=200)
		C_TEXT:C284($base64Image)
		$base64Image:=BASE64 ENCODE:C895($imageBlob; $base64)
		$recetteEntity.imageBlob:=$imageBlob
		$recetteEntity.imageBase64:=$base64
		//ALERTE("Image téléchargée avec succès")
	End if 
	$uuidRecette:=$recette.UUID_
	$recetteEntity.save()
	$recette:=ds:C1482.Recette.query("UUID_ =:1"; $uuidRecette).toCollection().first()
End if 

$chaineJSON:=JSON Stringify:C1217($recette; *)
CONVERT FROM TEXT:C1011($chaineJSON; "utf-8"; $chaineJSON)
$chaineJSON:=BLOB to text:C555($chaineJSON; UTF8 texte sans longueur:K22:17)
WEB SEND TEXT:C677($chaineJSON; "application/json")