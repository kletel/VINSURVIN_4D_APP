//%attributes = {"publishedWeb":true}
C_OBJECT:C1216($prodObj; $adresseObj; $contactObj)
C_TEXT:C284($adresseTexte)
ARRAY TEXT:C222($tVnom; 0)
ARRAY TEXT:C222($tVal; 0)
WEB GET VARIABLES:C683($tVnom; $tVal)

$uuid:=KST_web_Lire_param(->$tVnom; ->$tVal; "UUID_")
$cave_champsModifie:=KST_web_Lire_param(->$tVnom; ->$tVal; "champsModif")
$action:=KST_web_Lire_param(->$tVnom; ->$tVal; "action")
$uuid_user:=KST_web_Lire_param(->$tVnom; ->$tVal; "UUIDuser")

$token:=KST_web_Lire_param(->$tVnom; ->$tVal; "token")
//$verifToken:=react_verifToken_K($token)
$verifToken:=react_verifToken_Table($token)

If ($verifToken.validate)
	
	If ($action#"creation")
		$cave:=ds:C1482.Cave.query("UUID_=:1"; $uuid).first()
	Else 
		$cave:=ds:C1482.Cave.new()
		$cave.UUID_User:=$uuid_user
	End if 
	C_OBJECT:C1216($obj_champsMod)
	$obj_champsMod:=JSON Parse:C1218($cave_champsModifie)
	If ($obj_champsMod.Etiquette=Null:C1517)
		$path:=Get 4D folder:C485(Current resources folder:K5:16)+"Pictos"+Folder separator:K24:12+"Cadre.png"  //trouver l'image source
		READ PICTURE FILE:C678($path; $picture)
		$obj_champsMod.Etiquette:=$picture
	End if 
	
	
	C_BLOB:C604($blobImg)
	If (Not:C34(Undefined:C82($obj_champsMod.base64_etiquette)))
		BASE64 DECODE:C896($obj_champsMod.base64_etiquette; $blobImg)
		//OB SUPPRIMER($obj_champsMod; "base64_etiquette")
	End if 
	OB REMOVE:C1226($obj_champsMod; "Etiquette")
	OB REMOVE:C1226($obj_champsMod; "valeurCave")
	OB REMOVE:C1226($obj_champsMod; "Reste_en_Cave")
	
	If (OB Is defined:C1231($obj_champsMod; "Producteur_Infos"))
		If (Value type:C1509($obj_champsMod.Producteur_Infos)#Is object:K8:27)
			$obj_champsMod.Producteur_Infos:=New object:C1471
		End if 
		
		$prodObj:=$obj_champsMod.Producteur_Infos
		
		$nomComplet:=""
		If (OB Is defined:C1231($prodObj; "Prenom") & ($prodObj.Prenom#""))
			$nomComplet:=$prodObj.Prenom
		End if 
		
		If (OB Is defined:C1231($prodObj; "Nom") & ($prodObj.Nom#""))
			If ($nomComplet#"")
				$nomComplet:=$nomComplet+" "
			End if 
			$nomComplet:=$nomComplet+$prodObj.Nom
		End if 
		
		If (OB Is defined:C1231($prodObj; "Entreprise") & ($prodObj.Entreprise#""))
			If ($nomComplet#"")
				$nomComplet:=$nomComplet+" – "
			End if 
			$nomComplet:=$nomComplet+$prodObj.Entreprise
		End if 
		
		If ($nomComplet#"")
			$obj_champsMod.Producteur:=$nomComplet
		End if 
		
		$adresseTexte:=""
		If (OB Is defined:C1231($prodObj; "Adresse") & (Value type:C1509($prodObj.Adresse)=Is object:K8:27))
			$adresseObj:=$prodObj.Adresse
			C_TEXT:C284($ligne1; $ligne2; $cp; $ville; $pays)
			
			$ligne1:=Choose:C955(OB Is defined:C1231($adresseObj; "Ligne1"); String:C10($adresseObj.Ligne1); "")
			$ligne2:=Choose:C955(OB Is defined:C1231($adresseObj; "Ligne2"); String:C10($adresseObj.Ligne2); "")
			$cp:=Choose:C955(OB Is defined:C1231($adresseObj; "CodePostal"); String:C10($adresseObj.CodePostal); "")
			$ville:=Choose:C955(OB Is defined:C1231($adresseObj; "Ville"); String:C10($adresseObj.Ville); "")
			$pays:=Choose:C955(OB Is defined:C1231($adresseObj; "Pays"); String:C10($adresseObj.Pays); "")
			
			If ($ligne1#"")
				$adresseTexte:=$ligne1
			End if 
			If ($ligne2#"")
				If ($adresseTexte#"")
					$adresseTexte:=$adresseTexte+Char:C90(Carriage return:K15:38)
				End if 
				$adresseTexte:=$adresseTexte+$ligne2
			End if 
			
			If (($cp#"") | ($ville#""))
				If ($adresseTexte#"")
					$adresseTexte:=$adresseTexte+Char:C90(Carriage return:K15:38)
				End if 
				$adresseTexte:=$adresseTexte+Substring:C12(($cp+" "+$ville); 1; Length:C16($cp+" "+$ville))
			End if 
			
			If ($pays#"")
				If ($adresseTexte#"")
					$adresseTexte:=$adresseTexte+Char:C90(Carriage return:K15:38)
				End if 
				$adresseTexte:=$adresseTexte+$pays
			End if 
		End if 
		
		If ($adresseTexte#"")
			$obj_champsMod.Producteur_Adresse:=$adresseTexte
		End if 
		
	End if 
	
	$cave.fromObject($obj_champsMod)
	//$cave.Douceur:=$obj_champsMod.Degustation_Palais.Douceur
	If (OB Is defined:C1231($obj_champsMod; "Degustation_Palais"))
		If (OB Is defined:C1231($obj_champsMod.Degustation_Palais; "Douceur"))
			$cave.Douceur:=$obj_champsMod.Degustation_Palais.Douceur
		End if 
	End if 
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
	$chaineJSON:=BLOB to text:C555($chaineJSON; UTF8 text without length:K22:17)
	WEB SEND TEXT:C677($chaineJSON; "application/json")
	
	
	If ($action="creation")
		If ((Not:C34(Undefined:C82($cave.Association_Mets))) && ($cave.Association_Mets#Null:C1517))
			If ($cave.Association_Mets#"")
				$colPlat:=Split string:C1554($cave.Association_Mets; ",")
				For each ($met; $colPlat)
					
					If ((Substring:C12($met; 1; 1))=Char:C90(Space:K15:42))
						$met:=Substring:C12($met; 2; Length:C16($met))
						$met:=Uppercase:C13(Substring:C12($met; 1; 1))+Substring:C12($met; 2; Length:C16($met))
					End if 
					
					$degustation:=ds:C1482.Vin_Association.new()
					$degustation.nomVin:=$nomVin
					$degustation.nomMet:=$met
					$degustation.UUID_Utilisateur:=$uuid_user
					$degustation.UUID_Cave:=$uuid
					$uuid_degu:=$degustation.UUID_
					$degustation.save()
					
					$param:=New object:C1471("met"; $met; "uuid_vinAssociation"; $uuid_degu)
					While (Semaphore:C143("Recette : "+$met; 10))
						IDLE:C311
						If (False:C215)
							CLEAR SEMAPHORE:C144("Recette : "+$met)
						End if 
					End while 
					$ref_p:=New process:C317("react_analyseIA_Met"; 128*1024; "Recette : "+$met; $param)
					CLEAR SEMAPHORE:C144("Recette : "+$met)
					
				End for each 
				
				//$refp:=Nouveau process("react_AnalyseMet_col"; $colPlat)
				
			End if 
		End if 
	End if 
End if 