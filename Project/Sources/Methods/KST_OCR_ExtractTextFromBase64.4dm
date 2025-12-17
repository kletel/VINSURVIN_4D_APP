//%attributes = {}
// -----------------------------------------------------------------------------
// Méthode : KST_OCR_ExtractTextFromBase64
// $1 : TEXT  -> base64 image (data:image/png;base64,...)
// $0 : TEXT  -> texte OCR retourné (ou "" en cas d'erreur)
// -----------------------------------------------------------------------------
C_TEXT:C284($1; $0)

C_TEXT:C284($b64; $boundary; $body; $ocrApiKey; $endpoint)
C_BLOB:C604($request)
C_COLLECTION:C1488($headers)
C_OBJECT:C1216($ocrResponse)
C_COLLECTION:C1488($parsedResults)
C_OBJECT:C1216($res)
C_TEXT:C284($ocrText)

$ocrText:=""
$b64:=$1

// ⚠️ A REMPLACER par ta vraie clé OCR.Space
$ocrApiKey:="C66A1A2E-3352-4696-B975-F1670F545B7F"

// Endpoint OCR.Space
$endpoint:="https://api.ocr.space/parse/image"

// Boundary pour multipart/form-data
$boundary:="--------------------------4D_OCRSPACE_BOUNDARY"

// Construction du body multipart/form-data
$body:="--"+$boundary+Char:C90(13)+Char:C90(10)
$body:=$body+"Content-Disposition: form-data; name=\"base64Image\""+Char:C90(13)+Char:C90(10)+Char:C90(13)+Char:C90(10)
$body:=$body+$b64+Char:C90(13)+Char:C90(10)

$body:=$body+"--"+$boundary+Char:C90(13)+Char:C90(10)
$body:=$body+"Content-Disposition: form-data; name=\"language\""+Char:C90(13)+Char:C90(10)+Char:C90(13)+Char:C90(10)
// Carte des vins en FR -> langue "fre"
$body:=$body+"fre"+Char:C90(13)+Char:C90(10)

$body:=$body+"--"+$boundary+Char:C90(13)+Char:C90(10)
$body:=$body+"Content-Disposition: form-data; name=\"isTable\""+Char:C90(13)+Char:C90(10)+Char:C90(13)+Char:C90(10)
// Forcer un retour "ligne par ligne" (reco de OCR.Space pour les tableaux/menus)
$body:=$body+"true"+Char:C90(13)+Char:C90(10)

$body:=$body+"--"+$boundary+Char:C90(13)+Char:C90(10)
$body:=$body+"Content-Disposition: form-data; name=\"scale\""+Char:C90(13)+Char:C90(10)+Char:C90(13)+Char:C90(10)
// Upscaling interne pour améliorer l’OCR sur images pas top
$body:=$body+"true"+Char:C90(13)+Char:C90(10)

$body:=$body+"--"+$boundary+Char:C90(13)+Char:C90(10)
$body:=$body+"Content-Disposition: form-data; name=\"OCREngine\""+Char:C90(13)+Char:C90(10)+Char:C90(13)+Char:C90(10)
// Engine 2 conseillé pour texte sur fond un peu visuel
$body:=$body+"2"+Char:C90(13)+Char:C90(10)

$body:=$body+"--"+$boundary+"--"+Char:C90(13)+Char:C90(10)

// Conversion en BLOB pour KSF_HTTP_POST
CONVERT FROM TEXT:C1011($body; "utf-8"; $request)

// Headers pour OCR.Space
$headers:=New collection:C1472(\
"Content-Type"; "multipart/form-data; boundary="+$boundary; \
"apikey"; $ocrApiKey\
)

// Appel HTTP (même helper que pour OpenAI)
$ocrResponse:=KSF_HTTP_POST($endpoint; $headers; $request)

// Extraction du texte OCR si pas d’erreur
If (OB Is defined:C1231($ocrResponse; "IsErroredOnProcessing")\
 & ($ocrResponse.IsErroredOnProcessing=False:C215)\
 & OB Is defined:C1231($ocrResponse; "ParsedResults"))
	
	$parsedResults:=$ocrResponse.ParsedResults
	
	For each ($res; $parsedResults)
		If (OB Is defined:C1231($res; "ParsedText"))
			$ocrText:=$res.ParsedText
			break  // on prend le premier résultat
		End if 
	End for each 
	
End if 

$0:=$ocrText
