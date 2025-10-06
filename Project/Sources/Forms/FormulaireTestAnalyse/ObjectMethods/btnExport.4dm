
READ ONLY:C145([Image_Traitees2:35])

$prog:=Progress New
Progress SET BUTTON ENABLED($prog; True:C214)

// title row
$Lignett:=5

If (Records in selection:C76([Image_Traitees2:35])=1)
	//VP IMPORT FROM OBJECT("zoneReponse"; [Images_Traitees]Modele_Tableur) import un objet?
	
Else 
	
	VP SET TEXT VALUE(VP Cell("zoneReponse"; 0; $Lignett); "UUID")
	VP SET TEXT VALUE(VP Cell("zoneReponse"; 1; $Lignett); "Base64")
	VP SET TEXT VALUE(VP Cell("zoneReponse"; 2; $Lignett); "Modèle IA Utilisée")
	VP SET TEXT VALUE(VP Cell("zoneReponse"; 3; $Lignett); "Temps d'analyse")
	VP SET TEXT VALUE(VP Cell("zoneReponse"; 4; $Lignett); "Echelle")
	VP SET TEXT VALUE(VP Cell("zoneReponse"; 5; $Lignett); "HxL image")
	VP SET TEXT VALUE(VP Cell("zoneReponse"; 6; $Lignett); "Json reçu")
	
End if 
//VP SET TEXT VALUE(VP Cell("Z_XLS"; 0; 4); V_Requette)

$row:=2
//$colDeclar:=Sélection vers JSON([Declaration])

//$myCol:=JSON Parse($colDeclar)
$Lignett+=1
ALL RECORDS:C47([Image_Traitees2:35])
FIRST RECORD:C50([Image_Traitees2:35])
$analysecpt:=0
While (Not:C34(End selection:C36([Image_Traitees2:35])))
	$typeData:=[Image_Traitees2:35]typeData:8
	$typeCategorie:=[Image_Traitees2:35]typeCategorie:9
	
	For ($i; 1; 3)
		For ($taille; 1; 3)
			
			//$requete:="Analyse cette image et retourne moi le resultat en json.Si c'est une carte des vins:[result:{[nom,co"+"uleur,appellation,région, caractéristique du vin (exemple doux, fruité, sec ou autre),format:[{contenance,prix}]]}]. Si c'est un carte des plats : [result:{nom,categorie}].Si c'est un rayon dans une grande surface: {result:{nom, couleur, prix,appel"+"lation,région}}.Utilise les informations géneraux du produit s'il n'est pas affichées"
			Case of 
				: (($typeData="vin") & ($typeCategorie="carte"))
					$requete:="Tu est un oeunologue de plus de 30 ans, Analyse cette carte des vins et donne moi la liste tous les vins de cette carte. Retourne moi le résultat en JSON sans les champs vides avec : [result:{[nom,co"+"uleur,appellation,région, caractéristique du vin (exemple doux, fruité, sec ou autre),format:[{contenance,prix}]]}].Utilise les informations géneraux du vin s'ils ne sont pas affichés.Donne une réponse avec n'importe quelle qualité de l'image"
					
				: (($typeData="plat") & ($typeCategorie="carte"))
					$requete:="à partir de cette carte des plats, analyse chaque plat ce qui est dans la carte.Je veux une liste de tous les plats qui sont separés par le type de plat(exemple:pizza,pates,steak,dessert). Retourne moi le résultat en JSON sans les champs vi"+"des avec"+" :[result:{nom,categorie}].Donne une réponse avec n'importe quelle qualité de l'image"
					
				: (($typeData="vin") & ($typeCategorie="rayon"))
					$requete:="à partir de ce rayon dans une grande surface, analyse tous les vins ce qui est dans le rayon.Tous les vins visibles.Utilise le prix moyen du vin dans une grande surface s'il n'est pas visible sur l'image.Retourne moi le résultat en JSON sans les cha"+"mps vides avec les info"+"rmations du vin dans ce format : {result:{nom, couleur, prix,appellation,région}} .Donne une réponse avec n'importe quelle qualité de l'image"
			End case 
			
			Case of 
					
				: ($i=1)
					$modelIA:="gpt-5-mini"
					$tokens:=5800
					
				: ($i=2)
					$modelIA:="gpt-4.1"
					$tokens:=2800
					
				: ($i=3)
					$modelIA:="gpt-4.1-mini"
					$tokens:=2800
					
			End case 
			$payload:=New object:C1471("model"; $modelIA; "max_completion_tokens"; $tokens)
			
			$image:=[Image_Traitees2:35]Photo:2
			PICTURE PROPERTIES:C457($image; $largeur; $hauteur)
			
			var $imgtf : Picture
			Case of 
					
				: ($taille=1)
					$echelle:=1
					
				: ($taille=2)
					$echelle:=0.75
					
				: ($taille=3)
					$echelle:=0.5
					
			End case 
			
			$imgtf:=$image*$echelle
			PICTURE PROPERTIES:C457($imgtf; $largeur; $hauteur)
			PICTURE TO BLOB:C692($imgtf; $blobImage; "image/jpg")
			If (($blobImage)#Null:C1517)
				BASE64 ENCODE:C895($blobImage; $b64)
				
			End if 
			$b64:="data:image/png;base64,"+$b64
			
			
			
			
			$api_key:="sk-proj-Ewo9zxKuLZMJndYONIXVT3BlbkFJwwDmvA3HFW7Stk96w83h"
			$auth:="Bearer "+$api_key
			$headers:=New collection:C1472("Content-Type"; "application/json"; "Authorization"; $auth)
			
			// Préparer la partie image + prompt une seule fois
			C_OBJECT:C1216($content; $content2; $messagecontentobj)
			$content:=New object:C1471("type"; "text"; "text"; $requete)  // $2 = ton prompt
			
			$content2:=New object:C1471("type"; "image_url"; "image_url"; New object:C1471("url"; $b64))
			
			ARRAY OBJECT:C1221($arrcontent; 0)
			APPEND TO ARRAY:C911($arrcontent; $content)
			
			APPEND TO ARRAY:C911($arrcontent; $content2)
			
			$messagecontentobj:=New object:C1471("role"; "user")
			OB SET ARRAY:C1227($messagecontentobj; "content"; $arrcontent)
			
			ARRAY OBJECT:C1221($arrmessage; 0)
			APPEND TO ARRAY:C911($arrmessage; $messagecontentobj)
			
			OB SET ARRAY:C1227($payload; "messages"; $arrmessage)
			$txtjson:=JSON Stringify:C1217($payload)
			
			
			C_BLOB:C604($request)
			CONVERT FROM TEXT:C1011($txtjson; "utf-8"; $request)
			
			$endpoint:="https://api.openai.com/v1/chat/completions"
			
			$vhStartTime:=((Current date:C33-!1980-01-01!)*86400)+Current time:C178
			$reponse:=KSF_HTTP_POST($endpoint; $headers; $request)
			$vhEndTime:=((Current date:C33-!1980-01-01!)*86400)+Current time:C178
			$tempsTotal:=$vhEndTime-$vhStartTime
			$analysecpt:=$analysecpt+1
			Progress SET PROGRESS($prog; Selected record number:C246([Image_Traitees2:35])/Records in selection:C76([Image_Traitees2:35]); String:C10($analysecpt))
			C_TEXT:C284($txtmessage)
			$jsonBrut:=$reponse.choices[0].message.content
			
			
			$json:=Substring:C12($jsonBrut; Position:C15("{"; $jsonBrut))
			
			$json:=Replace string:C233($json; "```json"; ""; 99999)
			$json:=Replace string:C233($json; "```"; ""; 99999)
			
			$result:=JSON Parse:C1218($json)
			
			var imageHL : Text
			$imageHL:=String:C10($hauteur)+"x"+String:C10($largeur)
			
			// remplir le tableau excel
			$row:=$row+1
			// add new rows
			//  add values
			VP INSERT ROWS(VP Row("zoneReponse"; $Lignett; 1))
			
			VP SET TEXT VALUE(VP Cell("zoneReponse"; 0; $Lignett); [Image_Traitees2:35]UUID:1)
			VP SET TEXT VALUE(VP Cell("zoneReponse"; 1; $Lignett); $b64)
			VP SET TEXT VALUE(VP Cell("zoneReponse"; 2; $Lignett); $modelIA)
			VP SET NUM VALUE(VP Cell("zoneReponse"; 3; $Lignett); $tempsTotal)
			VP SET NUM VALUE(VP Cell("zoneReponse"; 4; $Lignett); $echelle)
			VP SET TEXT VALUE(VP Cell("zoneReponse"; 5; $Lignett); $imageHL)
			VP SET TEXT VALUE(VP Cell("zoneReponse"; 6; $Lignett); JSON Stringify:C1217($result))
		End for 
	End for 
	NEXT RECORD:C51([Image_Traitees2:35])
End while 



Progress QUIT($prog)