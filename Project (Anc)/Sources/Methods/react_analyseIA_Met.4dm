//%attributes = {"publishedWeb":true}
ARRAY TEXT:C222($tVnom; 0)
ARRAY TEXT:C222($tVal; 0)
WEB GET VARIABLES:C683($tVnom; $tVal)
var $jsonBrut

$met:=$1.met
If (($1.uuid_vinAssociation="") || (Undefined:C82($1.uuid_vinAssociation)) || ($1.uuid_vinAssociation=Null:C1517))
	$uuidAsso:=""
Else 
	$uuidAsso:=$1.uuid_vinAssociation
End if 

$requete:="Tu es un chef cuisinier avec 30 ans d'expérience. Génère moi la recette de ce plat : \""+$met+"\" en respectant strictement le format JSON suivant, sans aucun texte en dehors du JSON : {\"nom_du_plat\":\"...\",\"ingredients\":[\"Nom de l'ingrédient (quantité pour 1 p"+"ersonne)\",\"...\"],\"prix\":\"...\",\"i"+"nstructions\":\"...\",\"instructionsDetail\":[{\"instruction\":\"...\",\"temps\":\"...\"},{\"instruction\":\"...\",\"temps\":\"...\"}],\"indication\":\"...\",\"temps_preparation\":\"...\",\"difficulte\":\"...\"} Respecte ces règles strictement : - Chaque ingrédient doit inclure la "+"quantité exacte pour une personne, entre parenthèses. - Le champ \"difficulte\" doit contenir l’un des trois choix suivants : Facile, Moyenne ou Difficile. - Le champ \"instructions\" est un texte global décrivant les étapes. - Le champ \"instruction"+"sDetail\" est une liste JSON d'objets. Chaque objet contient une instruction et le temps approximatif pour l'exécuter (en minutes, format texte). - Le JSON ne doit contenir aucun texte autour, aucune balise markdown (pas de ```json), aucun saut de lig"+"ne superflu ou commentaire. - Complète tous les champs même si certaines informations sont manquantes, selon ton expertise culinaire. - Aucune valeur ne doit être vide. Tous les champs doivent être présents et correctement formatés."


$recette:=ds:C1482.Recette.query("nomMet =:1 "; $met).toCollection().first()
If (($recette=Null:C1517) || Undefined:C82($recette))
	
	
	var $client:=cs:C1710.AIKit.OpenAI.new("sk-proj-Ewo9zxKuLZMJndYONIXVT3BlbkFJwwDmvA3HFW7Stk96w83h")
	$imagePrompt:="Photographie culinaire de haute qualité représentant le plat \""+$met+". Le plat est présenté sur une table en bois rustique, avec une lumière naturelle douce et une mise au point sur les textures. Aucun humain visible. Style : photographie gastronomique professionnelle, ambiance chaleureuse et appétissante."
	var $image:=$client.images.generate($imagePrompt; {size: "1024x1024"}).image.url
	$filename:="plat_"+Replace string:C233($met; " "; "_")+".png"
	C_BLOB:C604($imageBlob)
	C_LONGINT:C283($status)
	$param:=New object:C1471("requete"; $requete; "modele"; "gpt-4o-mini")
	$jsonBrut:=react_IA_requeteTexte($param)
	$json:=Substring:C12($jsonBrut; Position:C15("{"; $jsonBrut))
	
	$json:=Replace string:C233($json; "```json"; ""; 99999)
	$json:=Replace string:C233($json; "```"; ""; 99999)
	
	//Traiter le json
	$recetteJSON:=JSON Parse:C1218($json)
	$ingredients:=""
	For each ($elem; $recetteJSON.ingredients)
		
		If ($elem#"")
			If ($ingredients="")
				$ingredients+=$elem
			Else 
				$ingredients+="\n "+$elem
			End if 
		End if 
	End for each 
	
	
	$recette:=ds:C1482.Recette.new()
	//$recette.nomVin:=$vin
	$recette.UUID_:=Generate UUID:C1066
	$recette.nomMet:=$met
	$recette.reponseIA:=$json
	$recette.nomPlat:=$recetteJSON.nom_du_plat
	$recette.prixMet:=$recetteJSON.prix
	$recette.tempsPrepaMet:=$recetteJSON.temps_preparation
	$recette.indicationMet:=$recetteJSON.indication
	$recette.instructionMet:=$recetteJSON.instructions
	$recette.ingredientsMet:=$ingredients
	$recette.difficulte:=$recetteJSON.difficulte
	$recette.instructionDetail:=JSON Stringify:C1217($recetteJSON.instructionsDetail; *)
	$recette.nomFichier:=$filename
	$recette.imageUrl:=$image
	$recette.requete:=$requete
	$recette.dateModif:=Current date:C33(*)
	$recette.heureModif:=Current time:C178(*)
	$uuidRecette:=$recette.UUID_
	
	$status:=HTTP Get:C1157($image; $imageBlob)
	If ($status=200)
		C_TEXT:C284($base64Image)
		$base64Image:=BASE64 ENCODE:C895($imageBlob; $base64)
		$recette.imageBlob:=$imageBlob
		$recette.imageBase64:=$base64
	End if 
	
	$recette.save()
	
	$tableIA:=ds:C1482.Analyse_IA.new()
	$tableIA.requete:=$requete
	$tableIA.reponse:=$jsonBrut
	$tableIA.reponseFormate:=$json
	$tableIA.nomVin:=$vin
	$tableIA.nomMet:=$met
	$tableIA.date:=Current date:C33(*)
	$tableIA.heure:=Current time:C178
	$tableIA.UUID_Recette:=$uuidRecette
	$tableIA.save()
	
	C_OBJECT:C1216($Obj)
	$Obj:=JSON Parse:C1218($json)
	$jsonSend:=JSON Stringify:C1217($Obj)
	WEB SEND TEXT:C677($jsonSend; "application/json")
	
	
	$tableIA.reponseEnvoye:=$jsonSend
	$tableIA.save()
	If (($uuidAsso#Null:C1517) && Not:C34(Undefined:C82($uuidAsso)))
		If ($uuidAsso#"")
			$degustation:=ds:C1482.Vin_Association.query("UUID_ =:1"; $uuidAsso).first()
			If (($degustation.UUID_Recette=Null:C1517) || Undefined:C82($degustation.UUID_Recette))
				$degustation.UUID_Recette:=$uuidRecette
				$degustation.save()
			End if 
		End if 
	End if 
Else 
	$chaineJSON:=JSON Stringify:C1217($recette; *)
	CONVERT FROM TEXT:C1011($chaineJSON; "utf-8"; $chaineJSON)
	$chaineJSON:=BLOB to text:C555($chaineJSON; UTF8 texte sans longueur:K22:17)
	WEB SEND TEXT:C677($chaineJSON; "application/json")
End if 


