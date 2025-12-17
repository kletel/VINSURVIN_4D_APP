//%attributes = {}
// KST_IA_OptimizeB64Image ($1 : Text) -> $0 : Text
// $1 : data:image/...;base64,xxxxxx
// $0 : data:image/jpeg;base64,xxxxxx optimisé (ou original si problème)

C_TEXT:C284($1; $0)
C_TEXT:C284($header; $rawB64)
C_LONGINT:C283($pos)
C_BLOB:C604($blob)
C_PICTURE:C286($pict)

// 1) Séparer header et base64 brut
$pos:=Position:C15(","; $1)
If ($pos=0)
	// format inattendu, on renvoie tel quel
	$0:=$1
	QUIT METHOD
End if 

$header:=Substring:C12($1; 1; $pos)  // "data:image/...;base64,"
$rawB64:=Substring:C12($1; $pos+1)

// 2) Décoder base64 -> BLOB
BASE64 DECODE:C896($rawB64; $blob)

// 3) BLOB -> PICTURE
// "" = laisser 4D deviner le format
BLOB TO PICTURE:C682($blob; $pict; "")

// Si l'image est invalide ou vide -> on renvoie l'original
If (Undefined:C82($pict))
	$0:=$1
	QUIT METHOD
End if 

// 4) PICTURE -> BLOB JPEG
// On réencode systématiquement en JPEG, souvent plus compact
PICTURE TO BLOB:C692($pict; $blob; ".jpg")

// 5) BLOB -> base64
BASE64 ENCODE:C895($blob; $rawB64)

// 6) Reconstruire la data URL en JPEG
$0:="data:image/jpeg;base64,"+$rawB64
