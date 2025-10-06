//%attributes = {"publishedWeb":true}
ARRAY TEXT:C222($tVnom; 0)
ARRAY TEXT:C222($tVal; 0)
WEB GET VARIABLES:C683($tVnom; $tVal)

//var$client:=cs.AIKit.OpenAI.new("sk-proj-Ewo9zxKuLZMJndYONIXVT3BlbkFJwwDmvA3HFW7Stk96w83h")
$uuidUser:=KST_web_Lire_param(->$tVnom; ->$tVal; "uuidUser")
$uuidTable:=KST_web_Lire_param(->$tVnom; ->$tVal; "uuidTable")
$platsChoisi:=KST_web_Lire_param(->$tVnom; ->$tVal; "platsChoisi")

$table:=ds:C1482.Mon_Oenologue.query("UUID=:1"; $uuidTable).first()


$lstVins:=$table.Cave
$lstVins:=JSON Stringify array:C1228($lstVins)
//tous ces critères dans ce format (suit strictement le format et toutes les clés dans"+" l"+"e json): catégorie (Moins Cher"+",Meillure Qualité prix,Le T"+"op):[{nom, coul"+"e"+"ur, prix,appellation,région}] ."

$requete:="Je vais manger "+$platsChoisi+", analyse chaque vin ce qui est dans cette liste "+$lstVins+". Donne moi 1 seul vin pour chaque catégorie de prix (Moins Cher, Meillure Qualité prix, Le Top). Retourne moi le résultat en tableau JSON [] sans les champs vides avec tous ces critères dans ce format (suit strictement le format e"+"t tou"+"tes les clés d"+"ans"+" l"+"e json): catégorie (Moins Cher"+",Meillure Qualité prix,Le T"+"op):[{nom, coul"+"e"+"ur, prix,appellation,région}] ."


//vrai
//$jsonBrut:=$client.chat.vision.create($b64; {model: "gpt-5"}).prompt($requete).choice.message.content

$api_key:="sk-proj-Ewo9zxKuLZMJndYONIXVT3BlbkFJwwDmvA3HFW7Stk96w83h"
$auth:="Bearer "+$api_key
$headers:=New collection:C1472("Content-Type"; "application/json"; "Authorization"; $auth)

// Préparer la partie image + prompt une seule fois
C_OBJECT:C1216($content; $messagecontentobj)
$content:=New object:C1471("type"; "text"; "text"; $requete)  // $2 = ton prompt


ARRAY OBJECT:C1221($arrcontent; 0)
APPEND TO ARRAY:C911($arrcontent; $content)

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

$payload:=New object:C1471("model"; "gpt-4o-mini"; "max_tokens"; 1800)
OB SET ARRAY:C1227($payload; "messages"; $arrmessage)

$txtjson:=JSON Stringify:C1217($payload)

C_BLOB:C604($request)
CONVERT FROM TEXT:C1011($txtjson; "utf-8"; $request)

$endpoint:="https://api.openai.com/v1/chat/completions"

$reponse:=KSF_HTTP_POST($endpoint; $headers; $request)

C_TEXT:C284($txtmessage)
$jsonBrut:=$reponse.choices[0].message.content


$json:=Substring:C12($jsonBrut; Position:C15("{"; $jsonBrut))

$json:=Replace string:C233($json; "```json"; ""; 99999)
$json:=Replace string:C233($json; "```"; ""; 99999)
$result:=JSON Parse:C1218($json)


$table.Conseil:=$result

//vrai

C_OBJECT:C1216($responseObject)
$responseObject:=New object:C1471("conseil"; $result; "uuid"; $uuidTable)


$jsonSend:=JSON Stringify:C1217($responseObject)
WEB SEND TEXT:C677($jsonSend; "application/json")

$table.save()

