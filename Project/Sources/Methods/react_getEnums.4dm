//%attributes = {"publishedWeb":true}
ARRAY TEXT:C222($tVnom; 0)
ARRAY TEXT:C222($tVal; 0)
WEB GET VARIABLES:C683($tVnom; $tVal)

$langue:=KST_web_Lire_param(->$tVnom; ->$tVal; "langue")


$lstEnums:=ds:C1482.Enum.query("langue=:1"; $langue)

$lstEnums_col:=$lstEnums.toCollection()
$chaineJSON:=JSON Stringify:C1217($lstEnums_col; *)
//collection v
CONVERT FROM TEXT:C1011($chaineJSON; "utf-8"; $chaineJSON)

$chaineJSON:=BLOB to text:C555($chaineJSON; UTF8 texte sans longueur:K22:17)
WEB SEND TEXT:C677($chaineJSON; "application/json")

//[Cave]Note_sur_20