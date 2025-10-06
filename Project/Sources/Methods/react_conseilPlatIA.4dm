//%attributes = {"publishedWeb":true}
ARRAY TEXT:C222($tVnom; 0)
ARRAY TEXT:C222($tVal; 0)
WEB GET VARIABLES:C683($tVnom; $tVal)

//var$client:=cs.AIKit.OpenAI.new("sk-proj-Ewo9zxKuLZMJndYONIXVT3BlbkFJwwDmvA3HFW7Stk96w83h")
$uuidUser:=KST_web_Lire_param(->$tVnom; ->$tVal; "uuidUser")
$uuidTable:=KST_web_Lire_param(->$tVnom; ->$tVal; "uuidTable")
$platsChoisi:=KST_web_Lire_param(->$tVnom; ->$tVal; "platsChoisi")
$budget:=KST_web_Lire_param(->$tVnom; ->$tVal; "budget")
$qteBouteille:=KST_web_Lire_param(->$tVnom; ->$tVal; "bouteille")
$typeCase:=KST_web_Lire_param(->$tVnom; ->$tVal; "typeCase")
$choice:=KST_web_Lire_param(->$tVnom; ->$tVal; "choice")
$vinsfiltre:=KST_web_Lire_param(->$tVnom; ->$tVal; "vinsfiltre")


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

If ($table.Plats=Null:C1517)
	$platsObj:=New object:C1471("result"; $platsChoisi)
	$table.Plats:=$platsObj
End if 

If ($table.Cave#Null:C1517)
	$lstVins:=$table.Cave
	$lstVins:=JSON Stringify array:C1228($lstVins)
End if 

//case of pour le conseil
Case of 
	: ($typeCase="conseilVin")
		$adaptePlat:=KST_web_Lire_param(->$tVnom; ->$tVal; "adaptePlat")
		
		
		If ($vinsfiltre#"")
			$vinsfiltre:=JSON Parse:C1218($vinsfiltre)
			$vinsfiltreobj:=New object:C1471("result"; $vinsfiltre)
			$table.Cave:=$vinsfiltreobj
			$lstVins:=JSON Stringify array:C1228($vinsfiltreobj)
		End if 
		
		//case of pour option rayon
		Case of 
			: ($adaptePlat="false")
				$requete:="Analyse chaque vin ce qui est dans cette liste "+$lstVins+". Donne moi 1 seul vin qui est le plus intéressant pour chaque catégorie de prix(Moins Cher, Meillure Qualité prix(moyen prix), le meilleur sans limite de prix (Le Top)). Retourne moi le résultat en tableau JSON ["+"] sans"+" les champs vid"+"es avec tous ces critères dans ce for"+"mat (suit strictem"+"ent le f"+"ormat e"+"t tou"+"tes les clés d"+"ans"+" l"+"e json): [catégorie (Moins Cher"+",Meilleure Qualité prix,Le T"+"op):{nom, coul"+"e"+"ur, prix,appellation,région,caractéristique}] ."
			Else 
				$requete:="Je vais manger "+$platsChoisi+", analyse chaque vin ce qui est dans cette liste "+$lstVins+".Analyse si c'est un vrai plat. Donne moi 1 seul vin pour chaque catégorie de prix par rapport à mon plat (Moin"+"sC"+"her, Meillure Qualité p"+"rix"+"(moyen p"+"rix), le meilleur sa"+"ns limite "+"de prix (Le Top)) suivan"+"t la contenance que j'ai donné. Retourne moi le résultat en tableau JSON ["+"] sans"+" les champs vid"+"es avec tous ces critères dans ce for"+"mat (suit strictem"+"ent le f"+"ormat e"+"t tou"+"tes les clés d"+"ans"+" l"+"e json): [catégorie (Moins Cher"+",Meilleure Qualité prix,Le T"+"op):{nom, coul"+"e"+"ur, prix(lister tous les prix par contenance),appellation,région,caractéristique},(dans un autre objet){vraiplat(met à false si plat n'est pas vrai)}] ."
		End case 
		
	: ($typeCase="conseilCave")
		$vinCave:=ds:C1482.Cave.all().toCollection("Nom,Appellation,Région,Reste_en_Cave")
		$vinCave:=JSON Stringify:C1217($vinCave)
		
		//$requete:="Vous êtes un caviste expert avec 30 ans d’expérience. Voici l’état actuel de ma cave : "+$vinCave+".Conseille-moi une ou plusieurs références de vin à acheter pour compléter intelligemment ma cave en fonction de temps de garde des vins (Vin jeunes,dans les 5 ans, Longue garde),des régions des vins et types des vins (rosés,rouges,blanc,...).Ret"+"ourne uniquement un tableau JSON [], contenant uniquement les champs "+"non vides suivants : nom, couleur, quantité, appellation, periodedegarde(Vin jeunes,dans les 5 ans, Longue garde), région, caractéristique."
		$requete:="Vous êtes un caviste expert avec 30 ans d’expérience. Voici l’état actuel de ma cave : "+$vinCave+".Conseille-moi les caractéristique des vins à acheter pour compléter intelligemment ma cave en fonction de temps de garde des vins (Vin jeunes,dans les 5 ans, Longue garde),des régions des vins et types des vins (Rosés,Rouges,Blanc,...).Retourne "+"uniquement un tableau JSON [], contenant uniquement les champs "+"non vides suivants : couleur,type,exempleNomVin(3 exemples),region,tempsDeGarde,quantite"
	: ($typeCase="conseilPlat")
		Case of 
			: ($choice="acheter")  //Acheter un nouveau vin
				
				$budget:=KST_web_Lire_param(->$tVnom; ->$tVal; "budget")
				$requete:="Vous êtes un caviste expert (30 ans d’expérience). Je vais manger "+$platsChoisi+".Analyse si c'est un vrai plat. À partir de mes choix des plats, conseil moi un vin par plat et le meillure qua"+"lit"+"é prix selon ce budget to"+"tal"+" maximum"+" de "+$budget+" €. Pas d'explication. Retourne moi le résultat en un tableau de JSON [] avec :plat(plat que j'ai donné), nom, couleur, prix,appellation,region,vraiplat(met à false si plat n'est pas vrai) ."
				
				
			: ($choice="cave")  //Prendre dans la cave
				
				$lstVin:=ds:C1482.Cave.all().toCollection("Nom,Appellation,Région,Reste_en_Cave")
				$jsonVin:=JSON Stringify:C1217($lstVin)
				
				$requete:="Vous êtes un caviste expert (30 ans d’expérience). Je vais manger "+$platsChoisi+".Analyse si c'est un vrai plat. À partir de mes choix des plats et cette liste des vins et nombre de bouteille "+"qui"+" reste dans la cave (si 0"+" ne"+" le pren"+"d pas) "+$jsonVin+" , conseil moi un vin par plat qui est le plus adapté à mes plats.Pas d'explication. Retourne moi le résultat en un tableau de JSON []  avec :plat(plat que j'ai donné), nom, couleur,appellation,region,vraiplat(met à false si plat n'est pas v"+"rai)."
				
			: ($choice="mix")  //Mixer les choix
				
				$lstVin:=ds:C1482.Cave.all().toCollection("Nom,Appellation,Région,Reste_en_Cave")
				$jsonVin:=JSON Stringify:C1217($lstVin)
				$budget:=KST_web_Lire_param(->$tVnom; ->$tVal; "budget")
				
				
				$requete:="Vous êtes un caviste expert (30 ans d’expérience). Je vais manger "+$platsChoisi+".Analyse si c'est un vrai plat.Analyse mes choix des plats. J'ai cette liste des vins et nombre de bouteille qu"+"i r"+"este dans la cave (si 0 n"+"e l"+"e prend "+"pas) "+$jsonVin+".À partir de cette liste ou autre vins qui ne sont pas dans la liste selon ce budget total maximum de "+$budget+" €, conseil moi un vin par plat qui est le plus adapté à mes plats.  Retourne moi le résultat en un tableau de JSON []  avec :plat(plat que j'ai donné), nom, couleur,appellation,re"+"gion,,vraiplat(met à false si plat n'est pas vrai)."
				
		End case 
	Else 
		TRACE:C157
		
End case 
$table.Prompt:=$requete
//vrai
//$jsonBrut:=$client.chat.vision.create($b64; {model: "gpt-5"}).prompt($requete).choice.message.content

$api_key:="sk-proj-Ewo9zxKuLZMJndYONIXVT3BlbkFJwwDmvA3HFW7Stk96w83h"
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
	$refdoc:=Create document:C266(System folder:C487(Desktop:K41:16)+"Analyse_IA3.txt")
	$file:=Folder:C1567(fk desktop folder:K87:19).file("Analyse_IA3.txt")
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
		
		// Conversion JSON brute pour log
		//$jsonBrut:=JSON Stringify($reponse)
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
$payload:=New object:C1471("model"; "gpt-4.1-mini"; "max_completion_tokens"; 2800)

OB SET ARRAY:C1227($payload; "messages"; $arrmessage)

$txtjson:=JSON Stringify:C1217($payload)

C_BLOB:C604($request)
CONVERT FROM TEXT:C1011($txtjson; "utf-8"; $request)

$endpoint:="https://api.openai.com/v1/chat/completions"

$vhStartTime:=((Current date:C33-!1980-01-01!)*86400)+Current time:C178  //Save the start time, seconds after 1.1.1980
$reponse:=KSF_HTTP_POST($endpoint; $headers; $request)
$vhEndTime:=((Current date:C33-!1980-01-01!)*86400)+Current time:C178
$tempsTotal:=$vhEndTime-$vhStartTime

C_TEXT:C284($txtmessage)
$jsonBrut:=$reponse.choices[0].message.content


$json:=Substring:C12($jsonBrut; Position:C15("["; $jsonBrut))

$json:=Replace string:C233($json; "```json"; ""; 99999)
$json:=Replace string:C233($json; "```"; ""; 99999)
$json:=Replace string:C233($json; "\n"; ""; 99999)


$result:=JSON Parse:C1218($json)

$vraiplat:=$result[0].vraiplat
If (Undefined:C82($vraiplat))
	$vraiplat:=$result[3].vraiplat
End if 

C_OBJECT:C1216($responseObject)
$responseObject:=New object:C1471("conseil"; $result; "uuid"; $uuidTable; "vraiPlat"; $vraiplat)

/*If ($typeCase#"conseilCave")
$vraiplat:=$result[0].vraiplat


If ($vraiplat)

$resultText:=JSON Stringify array($result)
$table.Conseil:=$resultText
$table.Temps_Analyse:=$tempsTotal
Else 
$responseObject:=New object("error"; $result[0].message)
End if 
Else 
$responseObject:=New object("conseil"; $result; "uuid"; $uuidTable)

End if */


$jsonSend:=JSON Stringify:C1217($responseObject)
WEB SEND TEXT:C677($jsonSend; "application/json")

$table.save()

