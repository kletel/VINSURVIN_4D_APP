//%attributes = {"publishedWeb":true}
ARRAY TEXT:C222($tVnom; 0)
ARRAY TEXT:C222($tVal; 0)
WEB GET VARIABLES:C683($tVnom; $tVal)

$uuid:=KST_web_Lire_param(->$tVnom; ->$tVal; "UUID_")
$cave_champsModifie:=KST_web_Lire_param(->$tVnom; ->$tVal; "champsModif")
$action:=KST_web_Lire_param(->$tVnom; ->$tVal; "action")
$uuid_user:=KST_web_Lire_param(->$tVnom; ->$tVal; "UUIDuser")

If ($action#"creation")
	$cave:=ds:C1482.Cave.query("UUID_=:1"; $uuid).first()
Else 
	$cave:=ds:C1482.Cave.new()
	$cave.UUID_User:=$uuid_user
End if 
C_OBJECT:C1216($obj_champsMod)
$obj_champsMod:=JSON Parse:C1218($cave_champsModifie)
If ($obj_champsMod.Etiquette=Null:C1517)
	$path:=Get 4D folder:C485(Dossier Resources courant:K5:16)+"Pictos"+Séparateur dossier:K24:12+"Cadre.png"  //trouver l'image source
	READ PICTURE FILE:C678($path; $picture)
	$obj_champsMod.Etiquette:=$picture
End if 


C_BLOB:C604($blobImg)
If (Not:C34(Undefined:C82($obj_champsMod.base64_etiquette)))
	BASE64 DECODE:C896($obj_champsMod.base64_etiquette; $blobImg)
	OB REMOVE:C1226($obj_champsMod; "base64_etiquette")
End if 
OB REMOVE:C1226($obj_champsMod; "Etiquette")
OB REMOVE:C1226($obj_champsMod; "valeurCave")
OB REMOVE:C1226($obj_champsMod; "Reste_en_Cave")
//$enumTypeVin:=ds.Enum.query("titre = :1"; "Type de vin").toCollection().first()
//si type # $enum.... (faire en js)
$cave.fromObject($obj_champsMod)
$cave.Douceur:=$obj_champsMod.Degustation_Palais.Douceur
If (BLOB size:C605($blobImg)>0)
	C_PICTURE:C286($Img)
	BLOB TO PICTURE:C682($blobImg; $Img)
	$cave.Etiquette:=$Img
End if 
If ($action="creation")
	$uuid:=$cave.UUID_
	$nomVin:=$cave.Nom
End if 
$cave.save()
$cave:=ds:C1482.Cave.query("UUID_=:1"; $uuid).toCollection().first()


$chaineJSON:=JSON Stringify:C1217($cave; *)
CONVERT FROM TEXT:C1011($chaineJSON; "utf-8"; $chaineJSON)
$chaineJSON:=BLOB to text:C555($chaineJSON; UTF8 texte sans longueur:K22:17)
WEB SEND TEXT:C677($chaineJSON; "application/json")


If ($action="creation")
	If ((Not:C34(Undefined:C82($cave.Association_Mets))) && ($cave.Association_Mets#Null:C1517))
		If ($cave.Association_Mets#"")
			$colPlat:=Split string:C1554($cave.Association_Mets; ",")
			For each ($met; $colPlat)
				
				If ((Substring:C12($met; 1; 1))=Char:C90(Espacement:K15:42))
					$met:=Substring:C12($met; 2; Length:C16($met))
					$met:=Uppercase:C13(Substring:C12($met; 1; 1))+Substring:C12($met; 2; Length:C16($met))
				End if 
				
				$degustation:=ds:C1482.Vin_Association.new()
				$degustation.nomVin:=$nomVin
				$degustation.nomMet:=$met
				$degustation.UUID_Utilisateur:=$uuid_user
				$degustation.UUID_Cave:=$uuid
				$degustation.save()
			End for each 
		End if 
	End if 
End if 