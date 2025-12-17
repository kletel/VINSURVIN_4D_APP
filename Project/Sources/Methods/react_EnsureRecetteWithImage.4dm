//%attributes = {}
// ─────────────────────────────────────────────
// Méthode : react_EnsureRecetteWithImage
// Paramètres : 
//   $1 : Texte = nom du met
// Retour : 
//   $0 : cs.RecetteEntity (recette mise à jour)
// ─────────────────────────────────────────────

C_TEXT:C284($met)
C_OBJECT:C1216($recetteEntity; $recetteSel)

$met:=$1

// 1) On récupère (ou crée) la recette pour ce met
$recetteSel:=ds:C1482.Recette.query("nomMet = :1"; $met)

If ($recetteSel.length=0)
	// Aucune recette → on demande à l'IA de la créer (ta méthode existante)
	C_OBJECT:C1216($param)
	$param:=New object:C1471("met"; $met)
	
	// On réutilise le sémaphore que tu avais déjà
	While (Semaphore:C143("Recette : "+$met; 10))
		IDLE:C311
	End while 
	
	react_analyseIA_Met($param)  // doit créer la recette dans ds.Recette
	
	CLEAR SEMAPHORE:C144("Recette : "+$met)
	
	$recetteSel:=ds:C1482.Recette.query("nomMet = :1"; $met)
End if 

If ($recetteSel.length=0)
	// Toujours rien → on sort proprement
	$0:=Null:C1517
	QUIT METHOD
End if 

$recetteEntity:=$recetteSel.first()

// 2) Si elle a déjà une image → rien à faire
If (Not:C34(($recetteEntity.imageUrl="") | ($recetteEntity.imageUrl=Null:C1517) | Undefined:C82($recetteEntity.imageUrl)\
 | ($recetteEntity.imageBase64="") | ($recetteEntity.imageBase64=Null:C1517) | Undefined:C82($recetteEntity.imageBase64)))
	$0:=$recetteEntity
	QUIT METHOD
End if 

// 3) Ici → pas d'image : on génère avec l'IA et on télécharge

// ⚠️ Idéalement : clé dans une table de paramètre, pas en dur
var $client : cs:C1710.AIKit.OpenAI
$client:=cs:C1710.AIKit.OpenAI.new(API_OPENAI("OPENAI"))

C_TEXT:C284($imagePrompt; $imageUrl)
$imagePrompt:="Photographie culinaire de haute qualité représentant le plat \""+$met+\
"\". Le plat est présenté sur une table en bois rustique, avec une lumière naturelle douce et une mise au point sur les textures. Aucun humain visible. Style : photographie gastronomique professionnelle, ambiance chaleureuse et appétissante."

$imageUrl:=$client.images.generate($imagePrompt; New object:C1471("size"; "1024x1024")).image.url

// Nom fichier
C_TEXT:C284($filename; $ext)
$ext:=".png"
$filename:="plat_"+Replace string:C233($met; " "; "_")+$ext

// Télécharger l'image dans un BLOB
C_BLOB:C604($imageBlob)
C_LONGINT:C283($status)
$status:=HTTP Get:C1157($imageUrl; $imageBlob)

If ($status=200)
	C_TEXT:C284($base64Image)
	$base64Image:=BASE64 ENCODE:C895($imageBlob; $base64)
	
	$recetteEntity.nomFichier:=$filename
	$recetteEntity.imageUrl:=$imageUrl
	$recetteEntity.dateModif:=Current date:C33(*)
	$recetteEntity.imageBlob:=$imageBlob
	$recetteEntity.imageBase64:=$base64Image
	
	$recetteEntity.save()
End if 

$0:=$recetteEntity
