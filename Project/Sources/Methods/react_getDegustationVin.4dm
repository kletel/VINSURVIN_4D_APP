//%attributes = {"publishedWeb":true}
ARRAY TEXT:C222($tVnom; 0)
ARRAY TEXT:C222($tVal; 0)
WEB GET VARIABLES:C683($tVnom; $tVal)


$vin:=KST_web_Lire_param(->$tVnom; ->$tVal; "nomVin")
$uuidUser:=KST_web_Lire_param(->$tVnom; ->$tVal; "uuidUser")
$uuidCave:=KST_web_Lire_param(->$tVnom; ->$tVal; "UUID_")

If (($uuidUser#Null:C1517) && Not:C34(Undefined:C82($uuidUser)))
	If (($uuidCave=Null:C1517) || Undefined:C82($uuidCave))
		$degustation:=ds:C1482.Vin_Association.query("UUID_Utilisateur =:1 and nomVin =:2"; $uuidUser; $vin).toCollection()
	Else 
		//$degustation:=ds.Vin_Association.query("UUID_Utilisateur =:1 and UUID_Cave =:2"; $uuidUser; $uuidCave).toCollection().first()
		$degustation:=ds:C1482.Vin_Association.query("UUID_Utilisateur =:1 and UUID_Cave =:2"; $uuidUser; $uuidCave).toCollection()
	End if 
End if 

$chaineJSON:=JSON Stringify:C1217($degustation; *)
CONVERT FROM TEXT:C1011($chaineJSON; "utf-8"; $chaineJSON)
$chaineJSON:=BLOB to text:C555($chaineJSON; UTF8 texte sans longueur:K22:17)
WEB SEND TEXT:C677($chaineJSON; "application/json")

//[Cave]Lieu_Achat