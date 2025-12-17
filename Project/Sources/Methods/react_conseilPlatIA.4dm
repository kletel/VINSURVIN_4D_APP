//%attributes = {"publishedWeb":true}
ARRAY TEXT:C222($tVnom; 0)
ARRAY TEXT:C222($tVal; 0)
WEB GET VARIABLES:C683($tVnom; $tVal)


$uuidUser:=KST_web_Lire_param(->$tVnom; ->$tVal; "uuidUser")
$uuidTable:=KST_web_Lire_param(->$tVnom; ->$tVal; "uuidTable")
$platsChoisi:=KST_web_Lire_param(->$tVnom; ->$tVal; "platsChoisi")
//$budget:=KST_web_Lire_param(->$tVnom; ->$tVal; "budget")
$qteBouteille:=KST_web_Lire_param(->$tVnom; ->$tVal; "bouteille")
$typeCase:=KST_web_Lire_param(->$tVnom; ->$tVal; "typeCase")
$choice:=KST_web_Lire_param(->$tVnom; ->$tVal; "choice")
$vinsfiltre:=KST_web_Lire_param(->$tVnom; ->$tVal; "vinsfiltre")
$aperitif:=KST_web_Lire_param(->$tVnom; ->$tVal; "aperitif")
$digestif:=KST_web_Lire_param(->$tVnom; ->$tVal; "digestif")
$refine:=KST_web_Lire_param(->$tVnom; ->$tVal; "refine")
/*$ref_couleur:=KST_web_Lire_param(->$tVnom; ->$tVal; "ref_couleur")
$ref_region:=KST_web_Lire_param(->$tVnom; ->$tVal; "ref_region")*/
$ref_free:=KST_web_Lire_param(->$tVnom; ->$tVal; "refine_free")

KST_IA_Log("Sommelier_Text/INIT"; \
"uuidUser="+$uuidUser+\
" ; uuidTable="+$uuidTable+\
" ; typeCase="+$typeCase+\
" ; choice="+$choice)


If ($uuidTable="")
	$uuidTable:=Generate UUID:C1066
	$table:=ds:C1482.Mon_Oenologue.new()
	$table.UUID:=$uuidTable
	$table.UUID_Utilisateur:=$uuidUser
	$table.Crea_Date:=Current date:C33(*)
	$table.Crea_Heure:=Current time:C178
	
Else 
	$table:=ds:C1482.Mon_Oenologue.query("UUID=:1"; $uuidTable).first()
End if 

C_COLLECTION:C1488($Prompt)
$Prompt:=ds:C1482.Prompt.all().toCollection("Libelle,Prompt")
var $row : Object

$platsChoisi:=KST_web_Lire_param(->$tVnom; ->$tVal; "platsChoisi")

C_COLLECTION:C1488($colPlats)
$colPlats:=New collection:C1472

If ($table.Plats#Null:C1517)
	$old:=$table.Plats.result
	For each ($p; $old)
		$pNom:=String:C10($p.nom)
		If ($pNom#"")
			If ($colPlats.query("nom = :1"; $pNom).length>0)
				OB SET:C1220($p; "selected"; True:C214)
			End if 
		End if 
	End for each 
	$table.Plats:=New object:C1471("result"; $old)
Else 
	$table.Plats:=New object:C1471("result"; $colPlats)
End if 

If ($colPlats.length>0)
	$table.Plats:=New object:C1471("result"; $colPlats)
End if 

If ($table.Cave#Null:C1517)
	$lstVins:=$table.Cave
	$lstVins:=JSON Stringify array:C1228($lstVins)
End if 

$userCave:=ds:C1482.Cave.query("UUID_User = :1"; $uuidUser).toCollection("Nom,Appellation,Région,Reste_en_Cave")

$ajoutAperitif:=""
$jsonAperitif:=""
If ($aperitif="true")
	$row:=$Prompt.query("Libelle = :1"; "APERITIF_INSTRUCTION").first()
	If ($row#Null:C1517)
		$ajoutAperitif:=$row.Prompt
		$jsonAperitif:="vinaperitif"
	End if 
End if 

$ajoutDigestif:=""
$jsonDigestif:=""
If ($digestif="true")
	$row:=$Prompt.query("Libelle = :1"; "DIGESTIF_INSTRUCTION").first()
	If ($row#Null:C1517)
		$ajoutDigestif:=$row.Prompt
		$jsonDigestif:="vindigestif"
	End if 
End if 

$affinage:=""
If ($refine="true")
/*If ($ref_couleur#"")
$affinage:=$affinage+"Affine la recherche par cette couleur de vins = "+$ref_couleur+". "
End if 
If ($ref_region#"")
$affinage:=$affinage+"Affine la recherche par cette région de vins = "+$ref_region+" (corrige les fautes/variantes ; si la région n'existe pas, mets region:false et fais la recherche sans filtrage par région). "
End if */
	If ($ref_free#"")
		$affinage:=$affinage+"Affine la recherche par cette demande = "+$ref_free+". "+"Analyse et normalise ma demande (couleur, région, appellation, style, cépage, prix max, label bio, millésime, sucre, etc.). "+"Si la demande est incohérente/impossible/contradictoire, ou ne contient aucune contrainte reconnue parmi ces champs {couleur, region, appellation, style, cepage, prixMax, bio, millesime, sucre} ou ne permet pas d’affiner mets 'vraiAffin': false et "+"ignore l'affinage ; sinon 'vraiAffin': true et applique-le. "
	End if 
End if 

//case of pour le conseil
Case of 
	: ($typeCase="rayonPlatSupermarche")
		$row:=$Prompt.query("Libelle = :1"; "RAYON_PLAT_SUPERMARCHE").first()
		If ($row#Null:C1517)
			$requete:=$row.Prompt
			$requete:=Replace string:C233($requete; "{platsChoisi}"; $platsChoisi)
		End if 
		
	: ($typeCase="restoPlatProfil")
		$row:=$Prompt.query("Libelle = :1"; "RESTAURANT_PLAT_PROFIL").first()
		If ($row#Null:C1517)
			$requete:=$row.Prompt
			$requete:=Replace string:C233($requete; "{platsChoisi}"; $platsChoisi)
		End if 
		
	: ($typeCase="rayonPlatProfil")
		$row:=$Prompt.query("Libelle = :1"; "RAYON_PLAT_PROFIL").first()
		If ($row#Null:C1517)
			$requete:=$row.Prompt
			$requete:=Replace string:C233($requete; "{platsChoisi}"; $platsChoisi)
		End if 
	: ($typeCase="conseilVin")
		$adaptePlat:=KST_web_Lire_param(->$tVnom; ->$tVal; "adaptePlat")
		
		If ($vinsfiltre#"")
			$vinsfiltre:=JSON Parse:C1218($vinsfiltre)
			
			C_COLLECTION:C1488($onlyVins)
			$onlyVins:=New collection:C1472
			
			For each ($v; $vinsfiltre)
				If (OB Is defined:C1231($v; "couleur")) | (OB Is defined:C1231($v; "appellation")) | (OB Is defined:C1231($v; "format"))
					$onlyVins.push($v)
				End if 
			End for each 
			
			$vinsfiltreobj:=New object:C1471("result"; $onlyVins)
			$table.Cave:=$vinsfiltreobj
			
			$lstVins:=JSON Stringify array:C1228($vinsfiltreobj)
		End if 
		
		//case of pour option rayon
		Case of 
			: ($adaptePlat="false")
				$row:=$Prompt.query("Libelle = :1"; "RAYON_CONSEIL_VIN").first()
				If ($row#Null:C1517)
					$requete:=$row.Prompt
					$requete:=Replace string:C233($requete; "{lstVins}"; $lstVins)
				End if 
			Else 
				$row:=$Prompt.query("Libelle = :1"; "RAYON_ADAPTE_PLAT").first()
				If ($row#Null:C1517)
					$requete:=$row.Prompt
					$requete:=Replace string:C233($requete; "{platsChoisi}"; $platsChoisi)
					$requete:=Replace string:C233($requete; "{lstVins}"; $lstVins)
				End if 
		End case 
		
	: ($typeCase="conseilCave")
		$vinCave:=ds:C1482.Cave.query("UUID_User = :1"; $uuidUser).toCollection("Nom,Appellation,Région,Reste_en_Cave")
		$vinCave:=JSON Stringify:C1217($vinCave)
		
		$row:=$Prompt.query("Libelle = :1"; "COMPLETER_VIN_CAVE").first()
		If ($row#Null:C1517)
			$requete:=$row.Prompt
			$requete:=Replace string:C233($requete; "{vinCave}"; $vinCave)
		End if 
		
	: ($typeCase="conseilPlat")
		Case of 
			: ($choice="acheter")
				
				$lstVin:=ds:C1482.Cave.query("UUID_User = :1"; $uuidUser).toCollection("Nom,Appellation,Région,Reste_en_Cave")
				$jsonVin:=JSON Stringify:C1217($lstVin)
				
				$row:=$Prompt.query("Libelle = :1"; "CONSEIL_VIN_PLAT_ACHETER").first()
				If ($row#Null:C1517)
					$requete:=$row.Prompt
					
					$requete:=Replace string:C233($requete; "{platsChoisi}"; $platsChoisi)
					$requete:=Replace string:C233($requete; "{ajoutAperitif}"; $ajoutAperitif)
					$requete:=Replace string:C233($requete; "{ajoutDigestif}"; $ajoutDigestif)
					$requete:=Replace string:C233($requete; "{jsonAperitif}"; $jsonAperitif)
					$requete:=Replace string:C233($requete; "{jsonDigestif}"; $jsonDigestif)
					$requete:=Replace string:C233($requete; "{jsonVin}"; $jsonVin)
					$requete:=Replace string:C233($requete; "{affinage}"; $affinage)
				End if 
				
			: ($choice="cave")  //Prendre dans la cave
				
				$lstVin:=ds:C1482.Cave.query("UUID_User = :1"; $uuidUser).toCollection("Nom,Appellation,Région,Reste_en_Cave")
				$jsonVin:=JSON Stringify:C1217($lstVin)
				
				$row:=$Prompt.query("Libelle = :1"; "CONSEIL_VIN_PLAT_CAVE").first()
				If ($row#Null:C1517)
					$requete:=$row.Prompt
					
					$requete:=Replace string:C233($requete; "{platsChoisi}"; $platsChoisi)
					$requete:=Replace string:C233($requete; "{jsonVin}"; $jsonVin)
					$requete:=Replace string:C233($requete; "{ajoutAperitif}"; $ajoutAperitif)
					$requete:=Replace string:C233($requete; "{ajoutDigestif}"; $ajoutDigestif)
					$requete:=Replace string:C233($requete; "{jsonAperitif}"; $jsonAperitif)
					$requete:=Replace string:C233($requete; "{jsonDigestif}"; $jsonDigestif)
					$requete:=Replace string:C233($requete; "{affinage}"; $affinage)
				End if 
				
			: ($choice="mix")  //Mixer les choix
				
				$lstVin:=ds:C1482.Cave.query("UUID_User = :1"; $uuidUser).toCollection("Nom,Appellation,Région,Reste_en_Cave")
				$jsonVin:=JSON Stringify:C1217($lstVin)
				$budget:=KST_web_Lire_param(->$tVnom; ->$tVal; "budget")
				
				$row:=$Prompt.query("Libelle = :1"; "CONSEIL_VIN_PLAT_MIX").first()
				If ($row#Null:C1517)
					$requete:=$row.Prompt
					
					$requete:=Replace string:C233($requete; "{platsChoisi}"; $platsChoisi)
					$requete:=Replace string:C233($requete; "{jsonVin}"; $jsonVin)
					$requete:=Replace string:C233($requete; "{budget}"; String:C10($budget))
					$requete:=Replace string:C233($requete; "{ajoutAperitif}"; $ajoutAperitif)
					$requete:=Replace string:C233($requete; "{ajoutDigestif}"; $ajoutDigestif)
					$requete:=Replace string:C233($requete; "{jsonAperitif}"; $jsonAperitif)
					$requete:=Replace string:C233($requete; "{jsonDigestif}"; $jsonDigestif)
					$requete:=Replace string:C233($requete; "{affinage}"; $affinage)
				End if 
				
		End case 
	: ($typeCase="similarFromCave")
		$vinsDemandesTxt:=KST_web_Lire_param(->$tVnom; ->$tVal; "vinsDemandes")
		$vinsDemandes:=JSON Parse:C1218($vinsDemandesTxt)
		
		$lstVin:=$userCave.query("Reste_en_Cave > :1"; 0)
		$caveJSON:=JSON Stringify:C1217($lstVin)
		
		$targetsJSON:=JSON Stringify:C1217($vinsDemandes)
		
		$row:=$Prompt.query("Libelle = :1"; "SIMILAR_VIN_CAVE").first()
		If ($row#Null:C1517)
			$requete:=$row.Prompt
			$requete:=Replace string:C233($requete; "{targetsJSON}"; $targetsJSON)
			$requete:=Replace string:C233($requete; "{caveJSON}"; $caveJSON)
		End if 
	Else 
		TRACE:C157
		
End case 
$table.Prompt:=$requete

KST_IA_Log("Sommelier_Text/PROMPT_READY"; \
"typeCase="+$typeCase+\
" ; choice="+$choice+\
" ; longueurPrompt="+String:C10(Length:C16($requete)))
//vrai
//$jsonBrut:=$client.chat.vision.create($b64; {model: "gpt-5"}).prompt($requete).choice.message.content

$api_key:=API_OPENAI("OPENAI")  //
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
	$refdoc:=Create document:C266(System folder:C487(Bureau:K41:16)+"Analyse_IA3.txt")
	$file:=Folder:C1567(fk dossier bureau:K87:19).file("Analyse_IA3.txt")
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

//$payload:=New object("model"; "gpt-4o-mini"; "max_tokens"; 1800)
//$payload:=New object("model"; "gpt-4.1-mini"; "max_completion_tokens"; 2000)

If (($typeCase="rayonPlatSupermarche") | ($typeCase="restoPlatProfil"))
	$payload:=New object:C1471("model"; "gpt-4.1-mini"; "max_completion_tokens"; 1500)
Else 
	$payload:=New object:C1471("model"; "gpt-4.1-mini"; "max_completion_tokens"; 2200)
End if 


OB SET ARRAY:C1227($payload; "messages"; $arrmessage)

$txtjson:=JSON Stringify:C1217($payload)

C_BLOB:C604($request)
CONVERT FROM TEXT:C1011($txtjson; "utf-8"; $request)

$endpoint:="https://api.openai.com/v1/chat/completions"

KST_IA_Log("Sommelier_Text/API_CALL_START"; \
"model=gpt-4.1-mini ; endpoint="+$endpoint+" ; uuidTable="+$uuidTable)

$vhStartTime:=((Current date:C33-!1980-01-01!)*86400)+Current time:C178  //Save the start time, seconds after 1.1.1980
$reponse:=KSF_HTTP_POST($endpoint; $headers; $request)
$vhEndTime:=((Current date:C33-!1980-01-01!)*86400)+Current time:C178
$tempsTotal:=$vhEndTime-$vhStartTime

KST_IA_Log("Sommelier_Text/API_CALL_END"; \
"duree_s="+String:C10($tempsTotal)+" ; uuidTable="+$uuidTable)

C_TEXT:C284($txtmessage)
$jsonBrut:=$reponse.choices[0].message.content

$json:=Substring:C12($jsonBrut; Position:C15("["; $jsonBrut))

$json:=Replace string:C233($json; "```json"; ""; 99999)
$json:=Replace string:C233($json; "```"; ""; 99999)
$json:=Replace string:C233($json; "\n"; ""; 99999)


$result:=JSON Parse:C1218($json)

$vraiplat:=True:C214
If (OB Is defined:C1231($result[0]; "vraiplat"))
	$vraiplat:=$result[0].vraiplat
End if 

If ($vraiplat=True:C214)
	For each ($item; $result)
		If (OB Is defined:C1231($item; "vraiplat"))
			If (Value type:C1509($item.vraiplat)=Est un objet:K8:27)
				If (OB Is defined:C1231($item.vraiplat; "vraiplat"))
					If ($item.vraiplat.vraiplat=False:C215)
						$vraiplat:=False:C215
						break
					End if 
				End if 
			Else 
				If ($item.vraiplat=False:C215)
					$vraiplat:=False:C215
					break
				End if 
			End if 
		End if 
	End for each 
End if 

If (Value type:C1509($result)#Est une collection:K8:32)
	C_COLLECTION:C1488($wrap)
	$wrap:=New collection:C1472($result)
	$result:=$wrap
End if 

C_TEXT:C284($name)
C_OBJECT:C1216($item; $vinObj; $vinCave)

#DECLARE($vinObj : Object)

For each ($item; $result)
	If (Value type:C1509($item)=Est un objet:K8:27)
		
		If (OB Is defined:C1231($item; "nomvin"))
			If (Value type:C1509($item.nomvin)=Est un texte:K8:3)
				$vinCave:=ds:C1482.Cave.query("UUID_User = :1 and Nom = :2"; $uuidUser; $item.nomvin).first()
				If ($vinCave#Null:C1517)
					OB SET:C1220($item; "base64_132etiquette"; $vinCave.base64_132etiquette)
					OB SET:C1220($item; "Etagere"; $vinCave.Etagere)
					OB SET:C1220($item; "UUID_"; $vinCave.UUID_)
				End if 
			End if 
		End if 
		
		If (OB Is defined:C1231($item; "vinaperitif"))
			C_VARIANT:C1683($vinAny)
			$vinAny:=OB Get:C1224($item; "vinaperitif")
			
			Case of 
				: (Value type:C1509($vinAny)=Est un objet:K8:27)
					$vinObj:=$vinAny
					$name:=""
					
					If (OB Is defined:C1231($vinObj; "Nom"))
						If (Value type:C1509($vinObj.Nom)=Est un texte:K8:3)
							$name:=$vinObj.Nom
						End if 
					End if 
					If ($name="")
						If (OB Is defined:C1231($vinObj; "nom"))
							If (Value type:C1509($vinObj.nom)=Est un texte:K8:3)
								$name:=$vinObj.nom
							End if 
						End if 
					End if 
					If ($name="")
						If (OB Is defined:C1231($vinObj; "nomvin"))
							If (Value type:C1509($vinObj.nomvin)=Est un texte:K8:3)
								$name:=$vinObj.nomvin
							End if 
						End if 
					End if 
					
					If ($name#"")
						$vinCave:=ds:C1482.Cave.query("UUID_User = :1 and Nom = :2"; $uuidUser; $name).first()
						If ($vinCave#Null:C1517)
							OB SET:C1220($vinObj; "base64_132etiquette"; $vinCave.base64_132etiquette)
							OB SET:C1220($vinObj; "Etagere"; $vinCave.Etagere)
							OB SET:C1220($vinObj; "UUID_"; $vinCave.UUID_)
							OB SET:C1220($item; "vinaperitif"; $vinObj)
						End if 
					End if 
					
				: (Value type:C1509($vinAny)=Est un texte:K8:3)
					C_TEXT:C284($vinTxt; $raw; $firstToken)
					C_LONGINT:C283($pos; $len)
					C_OBJECT:C1216($obj)
					
					$vinTxt:=$vinAny
					$raw:=$vinTxt
					
					$pos:=Position:C15(","; $raw)
					If ($pos>0)
						$firstToken:=Substring:C12($raw; 1; $pos-1)
					Else 
						$firstToken:=$raw
					End if 
					
					$len:=Length:C16($firstToken)
					While ($len>0) & (Substring:C12($firstToken; 1; 1)=" ")
						$firstToken:=Substring:C12($firstToken; 2; $len-1)
						$len:=Length:C16($firstToken)
					End while 
					$len:=Length:C16($firstToken)
					While ($len>0) & (Substring:C12($firstToken; $len; 1)=" ")
						$firstToken:=Substring:C12($firstToken; 1; $len-1)
						$len:=Length:C16($firstToken)
					End while 
					
					$obj:=New object:C1471
					If ($firstToken#"")
						OB SET:C1220($obj; "nom"; $firstToken)
						
						$vinCave:=ds:C1482.Cave.query("UUID_User = :1 and Nom = :2"; $uuidUser; $item.nomvin).first()
						If ($vinCave#Null:C1517)
							OB SET:C1220($obj; "base64_132etiquette"; $vinCave.base64_132etiquette)
							OB SET:C1220($obj; "Etagere"; $vinCave.Etagere)
							OB SET:C1220($obj; "UUID_"; $vinCave.UUID_)
						End if 
					End if 
					
					OB SET:C1220($item; "vinaperitif"; $obj)
					
				Else 
			End case 
		End if 
		
		If (OB Is defined:C1231($item; "vindigestif"))
			C_VARIANT:C1683($vinAny2)
			$vinAny2:=OB Get:C1224($item; "vindigestif")
			
			Case of 
				: (Value type:C1509($vinAny2)=Est un objet:K8:27)
					$vinObj:=$vinAny2
					$name:=""
					
					If (OB Is defined:C1231($vinObj; "Nom"))
						If (Value type:C1509($vinObj.Nom)=Est un texte:K8:3)
							$name:=$vinObj.Nom
						End if 
					End if 
					If ($name="")
						If (OB Is defined:C1231($vinObj; "nom"))
							If (Value type:C1509($vinObj.nom)=Est un texte:K8:3)
								$name:=$vinObj.nom
							End if 
						End if 
					End if 
					If ($name="")
						If (OB Is defined:C1231($vinObj; "nomvin"))
							If (Value type:C1509($vinObj.nomvin)=Est un texte:K8:3)
								$name:=$vinObj.nomvin
							End if 
						End if 
					End if 
					
					If ($name#"")
						$vinCave:=ds:C1482.Cave.query("UUID_User = :1 and Nom = :2"; $uuidUser; $name).first()
						If ($vinCave#Null:C1517)
							OB SET:C1220($vinObj; "base64_132etiquette"; $vinCave.base64_132etiquette)
							OB SET:C1220($vinObj; "Etagere"; $vinCave.Etagere)
							OB SET:C1220($vinObj; "UUID_"; $vinCave.UUID_)
							OB SET:C1220($item; "vindigestif"; $vinObj)
						End if 
					End if 
					
				: (Value type:C1509($vinAny2)=Est un texte:K8:3)
					C_TEXT:C284($vinTxt2; $raw2; $firstToken2)
					C_LONGINT:C283($pos2; $len2)
					C_OBJECT:C1216($obj2)
					
					$vinTxt2:=$vinAny2
					$raw2:=$vinTxt2
					
					$pos2:=Position:C15(","; $raw2)
					If ($pos2>0)
						$firstToken2:=Substring:C12($raw2; 1; $pos2-1)
					Else 
						$firstToken2:=$raw2
					End if 
					
					$len2:=Length:C16($firstToken2)
					While ($len2>0) & (Substring:C12($firstToken2; 1; 1)=" ")
						$firstToken2:=Substring:C12($firstToken2; 2; $len2-1)
						$len2:=Length:C16($firstToken2)
					End while 
					$len2:=Length:C16($firstToken2)
					While ($len2>0) & (Substring:C12($firstToken2; $len2; 1)=" ")
						$firstToken2:=Substring:C12($firstToken2; 1; $len2-1)
						$len2:=Length:C16($firstToken2)
					End while 
					
					$obj2:=New object:C1471
					If ($firstToken2#"")
						OB SET:C1220($obj2; "nom"; $firstToken2)
						
						$vinCave:=ds:C1482.Cave.query("UUID_User = :1 and Nom = :2"; $uuidUser; $item.nomvin).first()
						If ($vinCave#Null:C1517)
							OB SET:C1220($obj2; "base64_132etiquette"; $vinCave.base64_132etiquette)
							OB SET:C1220($obj2; "Etagere"; $vinCave.Etagere)
							OB SET:C1220($obj2; "UUID_"; $vinCave.UUID_)
						End if 
					End if 
					
					OB SET:C1220($item; "vindigestif"; $obj2)
					
				Else 
			End case 
		End if 
		
		If ($typeCase="similarFromCave")
			If (OB Is defined:C1231($item; "match")) & (Value type:C1509($item.match)=Est un objet:K8:27)
				C_OBJECT:C1216($m)
				$m:=$item.match
				
				C_TEXT:C284($uuidMatch)
				$uuidMatch:=""
				If (OB Is defined:C1231($m; "UUID_")) & (Value type:C1509($m.UUID_)=Est un texte:K8:3) & ($m.UUID_#"")
					$uuidMatch:=$m.UUID_
				Else 
					If (OB Is defined:C1231($m; "uuid")) & (Value type:C1509($m.uuid)=Est un texte:K8:3) & ($m.uuid#"")
						$uuidMatch:=$m.uuid
					End if 
				End if 
				
				C_OBJECT:C1216($vinCave)
				If ($uuidMatch#"")
					$vinCave:=ds:C1482.Cave.query("UUID_User = :1 and UUID_ = :2 and Reste_en_Cave > :3"; $uuidUser; $uuidMatch; 0).first()
				End if 
				
				If ($vinCave=Null:C1517)
					C_TEXT:C284($name)
					$name:=""
					If (OB Is defined:C1231($m; "Nom")) & (Value type:C1509($m.Nom)=Est un texte:K8:3)
						$name:=$m.Nom
					Else 
						If (OB Is defined:C1231($m; "nom")) & (Value type:C1509($m.nom)=Est un texte:K8:3)
							$name:=$m.nom
						End if 
					End if 
					
					If ($name#"")
						$vinCave:=ds:C1482.Cave.query("UUID_User = :1 and Nom = :2 and Reste_en_Cave > :3"; \
							$uuidUser; String:C10($name); 0).first()
					End if 
				End if 
				
				If ($vinCave#Null:C1517)
					C_TEXT:C284($UUID_; $B64; $Nom; $App; $Reg)
					If (Value type:C1509($vinCave)=Est un objet:K8:27)
						$UUID_:=String:C10($vinCave.UUID_)
						$B64:=String:C10($vinCave.base64_132etiquette)
						$Nom:=String:C10($vinCave.Nom)
						$App:=String:C10($vinCave.Appellation)
						$Reg:=String:C10($vinCave.Région)
					Else   // entité
						$UUID_:=String:C10($vinCave.UUID_)
						$B64:=String:C10($vinCave.base64_132etiquette)
						$Nom:=String:C10($vinCave.Nom)
						$App:=String:C10($vinCave.Appellation)
						$Reg:=String:C10($vinCave.Région)
					End if 
					
					OB SET:C1220($item.match; "UUID_"; $UUID_)
					OB SET:C1220($item.match; "base64_132etiquette"; $B64)
					
					If (Not:C34(OB Is defined:C1231($item.match; "nom")))
						OB SET:C1220($item.match; "nom"; $Nom)
					End if 
					If (Not:C34(OB Is defined:C1231($item.match; "appellation")))
						OB SET:C1220($item.match; "appellation"; $App)
					End if 
					If (Not:C34(OB Is defined:C1231($item.match; "region")))
						OB SET:C1220($item.match; "region"; $Reg)
					End if 
				End if 
			End if 
		End if 
		
		If (OB Is defined:C1231($item; "vinCave")) & (Value type:C1509($item.vinCave)=Est un objet:K8:27)
			C_OBJECT:C1216($vc)
			$vc:=$item.vinCave
			
			C_TEXT:C284($nameVC)
			$nameVC:=""
			
			If (OB Is defined:C1231($vc; "Nom")) & (Value type:C1509($vc.Nom)=Est un texte:K8:3)
				$nameVC:=$vc.Nom
			Else 
				If (OB Is defined:C1231($vc; "nom")) & (Value type:C1509($vc.nom)=Est un texte:K8:3)
					$nameVC:=$vc.nom
				Else 
					If (OB Is defined:C1231($vc; "nomvin")) & (Value type:C1509($vc.nomvin)=Est un texte:K8:3)
						$nameVC:=$vc.nomvin
					End if 
				End if 
			End if 
			
			If ($nameVC#"")
				$vinCave:=ds:C1482.Cave.query("UUID_User = :1 and Nom = :2 and Reste_en_Cave > :3"; $uuidUser; $nameVC; 0).first()
				If ($vinCave#Null:C1517)
					OB SET:C1220($vc; "UUID_"; String:C10($vinCave.UUID_))
					OB SET:C1220($vc; "base64_132etiquette"; String:C10($vinCave.base64_132etiquette))
					OB SET:C1220($vc; "Etagere"; String:C10($vinCave.Etagere))
					
					OB SET:C1220($item; "vinCave"; $vc)
				End if 
			End if 
		End if 
		
		If (OB Is defined:C1231($item; "vinsCave")) & (Value type:C1509($item.vinsCave)=Est une collection:K8:32)
			C_COLLECTION:C1488($colVC)
			$colVC:=$item.vinsCave  // tableau de vins de la cave
			
			For each ($vc; $colVC)
				If (Value type:C1509($vc)=Est un objet:K8:27)
					C_TEXT:C284($nameVC)
					$nameVC:=""
					
					// On récupère le nom du vin tel qu'il est dans la cave
					If (OB Is defined:C1231($vc; "Nom")) & (Value type:C1509($vc.Nom)=Est un texte:K8:3)
						$nameVC:=$vc.Nom
					Else 
						If (OB Is defined:C1231($vc; "nom")) & (Value type:C1509($vc.nom)=Est un texte:K8:3)
							$nameVC:=$vc.nom
						Else 
							If (OB Is defined:C1231($vc; "nomvin")) & (Value type:C1509($vc.nomvin)=Est un texte:K8:3)
								$nameVC:=$vc.nomvin
							End if 
						End if 
					End if 
					
					If ($nameVC#"")
						// On va chercher le vin dans la table Cave de l'utilisateur
						$vinCave:=ds:C1482.Cave.query("UUID_User = :1 and Nom = :2 and Reste_en_Cave > :3"; $uuidUser; $nameVC; 0).first()
						If ($vinCave#Null:C1517)
							// On pousse les infos utiles pour le front : UUID, image, étagère
							OB SET:C1220($vc; "UUID_"; String:C10($vinCave.UUID_))
							OB SET:C1220($vc; "base64_132etiquette"; String:C10($vinCave.base64_132etiquette))
							OB SET:C1220($vc; "Etagere"; String:C10($vinCave.Etagere))
						End if 
					End if 
				End if 
			End for each 
			
			// On remet la collection enrichie dans l'item
			OB SET:C1220($item; "vinsCave"; $colVC)
		End if 
		
		
		
	End if 
End for each 

KST_IA_Log("Sommelier_Text/JSON_PARSED"; \
"vraiPlat="+String:C10($vraiplat)+" ; vraiAffin="+String:C10($vraiAffin)+\
" ; nbItems="+String:C10($result.length))

$vraiAffin:=True:C214

If (OB Is defined:C1231($result[0]; "affinValide"))
	$vraiAffin:=$result[0].affinValide
Else 
	If (OB Is defined:C1231($result[0]; "affin")) & (Value type:C1509($result[0].affin)=Est un booléen:K8:9)
		$vraiAffin:=$result[0].affin
	End if 
End if 

If (OB Is defined:C1231($result[0]; "vraiAffin"))
	$vraiAffin:=$result[0].vraiAffin
Else 
	If (OB Is defined:C1231($result[0]; "vraiaffin"))
		$vraiAffin:=$result[0].vraiaffin
	Else 
		If (OB Is defined:C1231($result[0]; "regionValide"))
			$vraiAffin:=$result[0].regionValide
		Else 
			If (OB Is defined:C1231($result[0]; "region")) & (Value type:C1509($result[0].region)=Est un booléen:K8:9)
				$vraiAffin:=$result[0].region
			End if 
		End if 
	End if 
End if 

If ($vraiAffin=True:C214)
	For each ($item; $result)
		// a) vraiAffin (camelCase)
		If (OB Is defined:C1231($item; "vraiAffin"))
			If (Value type:C1509($item.vraiAffin)=Est un objet:K8:27)
				If (OB Is defined:C1231($item.vraiAffin; "vraiAffin"))
					If ($item.vraiAffin.vraiAffin=False:C215)
						$vraiAffin:=False:C215
						break
					End if 
				End if 
			Else 
				If ($item.vraiAffin=False:C215)
					$vraiAffin:=False:C215
					break
				End if 
			End if 
			
			If (OB Is defined:C1231($item; "vraiaffin"))
				If (Value type:C1509($item.vraiaffin)=Est un objet:K8:27)
					If (OB Is defined:C1231($item.vraiaffin; "vraiaffin"))
						If ($item.vraiaffin.vraiaffin=False:C215)
							$vraiAffin:=False:C215
							break
						End if 
					End if 
				Else 
					If ($item.vraiaffin=False:C215)
						$vraiAffin:=False:C215
						break
					End if 
				End if 
			End if 
			
		Else 
			If (OB Is defined:C1231($item; "affinValide"))
				If (Value type:C1509($item.affinValide)=Est un objet:K8:27)
					If (OB Is defined:C1231($item.affinValide; "affinValide"))
						If ($item.affinValide.affinValide=False:C215)
							$vraiAffin:=False:C215
							break
						End if 
					End if 
				Else 
					If (Value type:C1509($item.affinValide)=Est un booléen:K8:9)
						If ($item.affinValide=False:C215)
							$vraiAffin:=False:C215
							break
						End if 
					End if 
				End if 
			Else 
				If (OB Is defined:C1231($item; "affin"))
					If (Value type:C1509($item.affin)=Est un objet:K8:27)
						If (OB Is defined:C1231($item.affin; "affin"))
							If ($item.affin.affin=False:C215)
								$vraiAffin:=False:C215
								break
							End if 
						End if 
					Else 
						If (Value type:C1509($item.affin)=Est un booléen:K8:9)
							If ($item.affin=False:C215)
								$vraiAffin:=False:C215
								break
							End if 
						End if 
					End if 
				End if 
			End if 
		End if 
	End for each 
End if 

KST_IA_Log("Sommelier_Text/JSON_PARSED"; \
"vraiPlat="+String:C10($vraiplat)+" ; vraiAffin="+String:C10($vraiAffin)+\
" ; nbItems="+String:C10($result.length))


// --- Construction de la réponse JSON envoyée au frontend
C_OBJECT:C1216($responseObject)
$responseObject:=New object:C1471("conseil"; $result; "uuid"; $uuidTable; "vraiPlat"; $vraiplat; "vraiAffin"; $vraiAffin)

KST_IA_Log("Sommelier_Text/JSON_PARSED"; \
"vraiPlat="+String:C10($vraiplat)+" ; vraiAffin="+String:C10($vraiAffin)+\
" ; nbItems="+String:C10($result.length))

$jsonSend:=JSON Stringify:C1217($responseObject)
WEB SEND TEXT:C677($jsonSend; "application/json")

$table.save()

