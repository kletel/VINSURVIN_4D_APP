//%attributes = {"publishedWeb":true}
ARRAY TEXT:C222($tVnom; 0)
ARRAY TEXT:C222($tVal; 0)
WEB GET VARIABLES:C683($tVnom; $tVal)
var $jsonBrut

$met:=KST_web_Lire_param(->$tVnom; ->$tVal; "met")
$uuidAsso:=KST_web_Lire_param(->$tVnom; ->$tVal; "uuidAssociation")

If ((Undefined:C82($uuidAsso)) || ($uuidAsso=Null:C1517))
	$uuidAsso:=""
End if 

$recette:=ds:C1482.Recette.query("nomMet =:1 "; $met).toCollection().first()
If (($recette=Null:C1517) || Undefined:C82($recette))
	$param:=New object:C1471("met"; $met; "uuid_vinAssociation"; $uuidAsso)
	While (Semaphore:C143("Recette : "+$met; 10))
		IDLE:C311
	End while 
	//$chaineJSON:=react_analyseIA_Met($param)
	react_analyseIA_Met($param)
	//WEB ENVOYER TEXTE($chaineJSON; "application/json")
	CLEAR SEMAPHORE:C144("Recette : "+$met)
	
End if 