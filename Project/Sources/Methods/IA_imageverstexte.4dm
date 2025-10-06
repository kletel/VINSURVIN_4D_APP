//%attributes = {}
C_PICTURE:C286($image)
C_BLOB:C604($blob)
C_TEXT:C284($base64_image)
C_TIME:C306($refdoc)
//$refdoc:=Ouvrir document(""; ".png;.jpeg;*.jpg"; Lire chemin accès)
//Si (OK=1)


////$dossier4d:=Dossier 4D(Dossier base)
////LIRE FICHIER IMAGE($dossier4d+"3262151637758_2.jpeg"; $image)
//LIRE FICHIER IMAGE(Document; $image)


//FERMER DOCUMENT($refdoc)


If (Undefined:C82($3))
	$image:=$1
	PICTURE TO BLOB:C692($image; $blob; "image/png")
	BASE64 ENCODE:C895($blob; $base64_image)
	
Else 
	$base64_image:=$3
End if 
C_COLLECTION:C1488($headers)
C_TEXT:C284($api_key)

$api_key:="sk-proj-Ewo9zxKuLZMJndYONIXVT3BlbkFJwwDmvA3HFW7Stk96w83h"
$auth:="Bearer "+$api_key

$headers:=New collection:C1472("Content-Type"; "application/json"; "Authorization"; $auth)

C_OBJECT:C1216($content1; $content2; $role; $content; $message; $messagecontentobj; $payload; $contentobj)

$content:=New object:C1471("type"; "text"; "text"; $2)
$content2:=New object:C1471("type"; "image_url"; "image_url"; New object:C1471("url"; "data:image/png;base64,"+$base64_image))

ARRAY OBJECT:C1221($arrcontent; 0)
APPEND TO ARRAY:C911($arrcontent; $content)
APPEND TO ARRAY:C911($arrcontent; $content2)
$messagecontentobj:=New object:C1471("role"; "user")

OB SET ARRAY:C1227($messagecontentobj; "content"; $arrcontent)

ARRAY OBJECT:C1221($arrmessage; 0)
APPEND TO ARRAY:C911($arrmessage; $messagecontentobj)

$payload:=New object:C1471("model"; "gpt-4o"; "max_tokens"; 300)
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
