//%attributes = {"publishedWeb":true}
ARRAY TEXT:C222($tVnom; 0)
ARRAY TEXT:C222($tVal; 0)
WEB GET VARIABLES:C683($tVnom; $tVal)

//var$client:=cs.AIKit.OpenAI.new("sk-proj-Ewo9zxKuLZMJndYONIXVT3BlbkFJwwDmvA3HFW7Stk96w83h")
$b64:="data:image/png;base64,"+KST_web_Lire_param(->$tVnom; ->$tVal; "b64")
$uuidUser:=KST_web_Lire_param(->$tVnom; ->$tVal; "uuidUser")
$uuidTable:=KST_web_Lire_param(->$tVnom; ->$tVal; "uuidTable")
$typeData:=KST_web_Lire_param(->$tVnom; ->$tVal; "typeData")
$typeCategorie:=KST_web_Lire_param(->$tVnom; ->$tVal; "typeCategorie")


Case of 
	: ($typeCategorie="carte")
		
		Case of 
			: ($typeData="vin")
				//$requete:="à partir de cette carte de vin analyse tous vin ce qui est dans la carte.Je veux une liste de tous les vins ce qui sont d"+"ans la carte. Retourne m"+"oi"+" le résultat en JSON sans les champs vides avec : nom, couleur, prix,appel"+"lation,région.Fais une extraction immediate (bien si ce n'est pas parfaitement analysé).Ne pas demander une nouvelle photo"
				//$requete:="à partir de cette carte de vin analyse tous vin ce qui est dans la carte.Je veux une liste de tous les vins ce qui sont d"+"ans la carte.Utilise le prix moyen du vin dans une grande surface s'il n'est pas visible sur l'image. Retourne m"+"oi"+" le résultat en JSON sans les champs vides avec : [result:{ nom,couleur, prix,appel"+"lation,région}].Pour le prix, donne moi les prix classé par volume (au verre, au bouteille, au magnum).Utilise les informations géneraux du vin s'ils ne sont pas affichés."
				//$requete:="à partir de cette carte de vin analyse tous vin ce qui est dans la carte.Je veux une liste de tous les vins ce qui sont d"+"ans la carte.Utilise le prix moyen du vin dans une grande surface s'il n'est pas visible sur l'image.Classe les vins par volume en fonction de ceux prensent sur la cart( exemple : Verre,Bouteille,1/2 Bouteille, Magnum ...etc..). Retourne m"+"oi"+" le résultat en JSON sans les champs vides avec : [result:{ volume:[nom,couleur, prix,appel"+"lation,région]}].Utilise les informations géneraux du vin s'ils ne sont pas affichés."
				//$requete:="Tu est un oeunologue de plus de 30 ans, Analyse cette carte des vins et donne moi la liste tous les vins regroupé par contenance (verre, bouteille ou autres). Retourne moi le résultat en JSON sans les champs vides avec : [result:{ contenance:[nom,co"+"uleur, prix,appellation,région, caractéristique du vin (exemple doux, fruité, sec ou autre)]}].Utilise les informations géneraux du vin s'ils ne sont pas affichés."
				$requete:="Tu est un oeunologue de plus de 30 ans, Analyse cette carte des vins et donne moi la liste tous les vins de cette carte. Retourne moi le résultat en JSON sans les champs vides avec : [result:{[nom,co"+"uleur,appellation,région, caractéristique du vin (exemple doux, fruité, sec ou autre),format:[{contenance,prix}]]}].Utilise les informations géneraux du vin s'ils ne sont pas affichés."
				
			: ($typeData="plat")
				//$requete:="à partir de cette carte des plats, analyse avec attention seulement chaque plat ce qui est dans la carte.Je veux une liste de tous les plats ce qui sont dans la carte. Retourne moi le résultat en JSON sans les champs vides avec : nom."
				$requete:="à partir de cette carte des plats, analyse chaque plat ce qui est dans la carte.Je veux une liste de tous les plats qui sont separés par le type de plat(exemple:pizza,pates,steak,dessert). Retourne moi le résultat en JSON sans les champs vi"+"des avec"+" :[result:{nom,categorie}]."
				
				
			Else 
				TRACE:C157
		End case 
		
	: (($typeCategorie="rayon") || ($typeCategorie="cave"))
		$requete:="à partir de ce rayon dans une grande surface, analyse tous les vins ce qui est dans le rayon.Utilise le prix moyen du vin dans une grande surface s'il n'est pas visible sur l'image.Retourne moi le résultat en JSON sans les champs vides avec les info"+"rmations du vin dans ce format : {result:{nom, couleur, prix,appellation,région}} ."
	Else 
		TRACE:C157
		
		
End case 



//vrai
//$jsonBrut:=$client.chat.vision.create($b64; {model: "gpt-5"}).prompt($requete).choice.message.content

$api_key:="sk-proj-Ewo9zxKuLZMJndYONIXVT3BlbkFJwwDmvA3HFW7Stk96w83h"
$auth:="Bearer "+$api_key
$headers:=New collection:C1472("Content-Type"; "application/json"; "Authorization"; $auth)

// Préparer la partie image + prompt une seule fois
C_OBJECT:C1216($content; $content2; $messagecontentobj)
$content:=New object:C1471("type"; "text"; "text"; $requete)  // $2 = ton prompt

$content2:=New object:C1471("type"; "image_url"; "image_url"; New object:C1471("url"; $b64))

ARRAY OBJECT:C1221($arrcontent; 0)
APPEND TO ARRAY:C911($arrcontent; $content)

APPEND TO ARRAY:C911($arrcontent; $content2)

$messagecontentobj:=New object:C1471("role"; "user")
OB SET ARRAY:C1227($messagecontentobj; "content"; $arrcontent)

ARRAY OBJECT:C1221($arrmessage; 0)
APPEND TO ARRAY:C911($arrmessage; $messagecontentobj)

If (False:C215)
	// Liste des modèles à tester
	$models:=New collection:C1472("gpt-4o"; "gpt-4o-mini"; "gpt-4-turbo"; "gpt-5")
	
	// Ouvrir le fichier log
	$refdoc:=Create document:C266(System folder:C487(Desktop:K41:16)+"Analyse_IA3.txt")
	$file:=Folder:C1567(fk desktop folder:K87:19).file("Analyse_IA3.txt")
	SEND PACKET:C103($refdoc; "Création document "+$file.fullName+Char:C90(13))
	SEND PACKET:C103($refdoc; "Prompt envoyé avec même image en 0.256 MB :"+Char:C90(13)+Char:C90(13))
	
	// Boucler sur les modèles
	For each ($model; $models)
		C_OBJECT:C1216($payload)
		
		If ($model="gpt-5")
			$payload:=New object:C1471("model"; $model; "max_completion_tokens"; 3800)
		Else 
			$payload:=New object:C1471("model"; $model; "max_tokens"; 1800)
		End if 
		OB SET ARRAY:C1227($payload; "messages"; $arrmessage)
		
		$txtjson:=JSON Stringify:C1217($payload)
		
		C_BLOB:C604($request)
		CONVERT FROM TEXT:C1011($txtjson; "utf-8"; $request)
		
		$endpoint:="https://api.openai.com/v1/chat/completions"
		
		$TP_d:=Timestamp:C1445  //Heure courante
		$reponse:=KSF_HTTP_POST($endpoint; $headers; $request)
		$TP_f:=Timestamp:C1445  //Heure courante
		
		C_TEXT:C284($txtmessage)
		$txtmessage:=$reponse.choices[0].message.content
		
		// Conversion JSON brute pour log
		//$jsonBrut:=JSON Stringify($reponse)
		$jsonBrut:=$txtmessage
		
		// Écriture log
		SEND PACKET:C103($refdoc; "Modèle '"+$model+"' :"+Char:C90(13))
		SEND PACKET:C103($refdoc; " [début] = "+String:C10($TP_d)+Char:C90(13))
		SEND PACKET:C103($refdoc; " [fin]   = "+String:C10($TP_f)+Char:C90(13))
		//ENVOYER PAQUET($refdoc; " [durée] = "+Chaîne($TP_f-$TP_d)+" secondes"+Caractère(13))
		SEND PACKET:C103($refdoc; "Réponse : "+Char:C90(13)+$txtmessage+Char:C90(13))
		SEND PACKET:C103($refdoc; "Réponse brute JSON : "+Char:C90(13)+$jsonBrut+Char:C90(13)+Char:C90(13)+Char:C90(13))
	End for each 
	CLOSE DOCUMENT:C267($refdoc)
End if 
//$modelIA:="gpt-5-mini"
$modelIA:="gpt-4.1-mini"
$payload:=New object:C1471("model"; $modelIA; "max_completion_tokens"; 2800)
//$payload:=New object("model"; $modelIA; "max_completion_tokens"; 5800)


OB SET ARRAY:C1227($payload; "messages"; $arrmessage)

$txtjson:=JSON Stringify:C1217($payload)

C_BLOB:C604($request)
CONVERT FROM TEXT:C1011($txtjson; "utf-8"; $request)

$endpoint:="https://api.openai.com/v1/chat/completions"

$vhStartTime:=((Current date:C33-!1980-01-01!)*86400)+Current time:C178
$reponse:=KSF_HTTP_POST($endpoint; $headers; $request)
$vhEndTime:=((Current date:C33-!1980-01-01!)*86400)+Current time:C178
$tempsTotal:=$vhEndTime-$vhStartTime

C_TEXT:C284($txtmessage)
$jsonBrut:=$reponse.choices[0].message.content


$json:=Substring:C12($jsonBrut; Position:C15("{"; $jsonBrut))

$json:=Replace string:C233($json; "```json"; ""; 99999)
$json:=Replace string:C233($json; "```"; ""; 99999)

$result:=JSON Parse:C1218($json)


// Si l'enregistrement n'existe pas encore

If ($uuidTable="")
	//READ WRITE([Mon_Oenologue])
	//CREATE RECORD([Mon_Oenologue])
	$uuidTable:=Generate UUID:C1066
	//[Mon_Oenologue]UUID:=$uuidTable
	//[Mon_Oenologue]Prompt:=$requete
	//[Mon_Oenologue]Crea_Date:=Current date(*)
	//[Mon_Oenologue]Crea_Heure:=Current time
	$table:=ds:C1482.Mon_Oenologue.new()
	$table.UUID:=$uuidTable
	$table.UUID_Utilisateur:=$uuidUser
	$table.Crea_Date:=Current date:C33(*)
	$table.Crea_Heure:=Current time:C178
	
	Case of 
		: ($typeData="vin")
			$table.Cave:=$result
			
		: ($typeData="plat")
			$table.Plats:=$result
			
		Else 
			TRACE:C157
			
	End case 
	
	//SAVE RECORD([Mon_Oenologue])
	//READ ONLY([Mon_Oenologue])
Else 
	
	// Si l'enregistrement existe déjà
	$table:=ds:C1482.Mon_Oenologue.query("UUID=:1"; $uuidTable).first()
	C_OBJECT:C1216($ancienResult; $newResult; $mergedResult)
	C_COLLECTION:C1488($ancienCollection; $newCollection; $mergedCollection)
	
	Case of 
		: ($typeData="vin")
			$ancienResult:=$table.Cave
			
			
			$ancienCollection:=OB Get:C1224($ancienResult; "result")
			$newCollection:=OB Get:C1224($result; "result")
			
			$mergedCollection:=New collection:C1472
			
			// Append items anciens
			For each ($item; $ancienCollection)
				$mergedCollection.push($item)
			End for each 
			
			// Append nouveaux items
			For each ($item; $newCollection)
				$mergedCollection.push($item)
			End for each 
			
			// Stocker dans mergedResult
			$mergedResult:=New object:C1471("result"; $mergedCollection)
			$table.Cave:=$mergedResult
			
			
		: ($typeData="plat")
			
			If ($table.Plats=Null:C1517)
				$table.Plats:=$result
				
			Else 
				$ancienResult:=$table.Plats
				$ancienCollection:=OB Get:C1224($ancienResult; "result")
				$newCollection:=OB Get:C1224($result; "result")
				
				$mergedCollection:=New collection:C1472
				
				// Append items anciens
				For each ($item; $ancienCollection)
					$mergedCollection.push($item)
				End for each 
				
				// Append nouveaux items
				For each ($item; $newCollection)
					$mergedCollection.push($item)
				End for each 
				
				// Stocker dans mergedResult
				$mergedResult:=New object:C1471("result"; $mergedCollection)
				$table.Plats:=$mergedResult
			End if 
			
		Else 
			TRACE:C157
			
	End case 
	
End if 


C_OBJECT:C1216($responseObject)
$responseObject:=New object:C1471("result"; $result; "uuid"; $uuidTable)


$jsonSend:=JSON Stringify:C1217($responseObject)
WEB SEND TEXT:C677($jsonSend; "application/json")

$table.save()

ARRAY TEXT:C222($extensions; 3)

$extensions{1}:=".jpg"
$extensions{2}:=".png"
$extensions{3}:=".webp"
$i:=1
//Créer un enregistrement de l'image dans la table Image_Traitees
CREATE RECORD:C68([Images_Traitees:34])
var $blob : Blob
[Images_Traitees:34]B64:5:=$b64
BASE64 DECODE:C896(Substring:C12($b64; Position:C15(","; $b64)+1); $blob)

While (($imagetraite=Null:C1517) & ($i<=Size of array:C274($extensions)))
	$ext:=$extensions{$i}
	BLOB TO PICTURE:C682($blob; $imagetraite; $ext)
	[Images_Traitees:34]Photo:2:=$imagetraite
	$i:=$i+1
End while 

[Images_Traitees:34]Reponse:3:=$jsonSend
[Images_Traitees:34]UUID_Oenologue:4:=$uuidTable
[Images_Traitees:34]Temps_Analyse:6:=$tempsTotal
[Images_Traitees:34]ModelIA:7:=$modelIA
SAVE RECORD:C53([Images_Traitees:34])
UNLOAD RECORD:C212([Images_Traitees:34])

