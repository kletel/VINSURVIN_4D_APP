//%attributes = {}
C_COLLECTION:C1488($headers)
C_TEXT:C284($api_key)

$requete:=$1.requete
$modele:=$1.modele
If (($modele="") || (Undefined:C82($modele)) || ($modele#Null:C1517))
	$modele:="gpt-4o-mini"
End if 
$api_key:="sk-proj-Ewo9zxKuLZMJndYONIXVT3BlbkFJwwDmvA3HFW7Stk96w83h"
$auth:="Bearer "+$api_key

$headers:=New collection:C1472("Content-Type"; "application/json"; "Authorization"; $auth)

C_OBJECT:C1216($content; $messagecontentobj; $payload)

$content:=New object:C1471("type"; "text"; "text"; $requete)
$messagecontentobj:=New object:C1471("role"; "user")

OB SET ARRAY:C1227($messagecontentobj; "content"; $content)

ARRAY OBJECT:C1221($arrmessage; 0)
APPEND TO ARRAY:C911($arrmessage; $messagecontentobj)

//$payload:=Créer objet("model"; "gpt-4o"; "max_tokens"; 300)
$payload:=New object:C1471("model"; "gpt-4o-mini"; "max_tokens"; 1344; "temperature"; 0.2)  //1024

OB SET ARRAY:C1227($payload; "messages"; $arrmessage)

$txtjson:=JSON Stringify:C1217($payload)

C_OBJECT:C1216($reponse)

C_BLOB:C604($request)

CONVERT FROM TEXT:C1011($txtjson; "utf-8"; $request)

$endpoint:="https://api.openai.com/v1/chat/completions"

$reponse:=KSF_HTTP_POST($endpoint; $headers; $request)
C_TEXT:C284($txtmessage)

$txtmessage:=$reponse.choices[0].message.content

$0:=$txtmessage

