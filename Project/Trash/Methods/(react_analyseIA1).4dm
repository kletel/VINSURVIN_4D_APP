//%attributes = {"publishedWeb":true}
ARRAY TEXT:C222($tVnom; 0)
ARRAY TEXT:C222($tVal; 0)
WEB GET VARIABLES:C683($tVnom; $tVal)

var $client:=cs:C1710.AIKit.OpenAI.new("sk-proj-Ewo9zxKuLZMJndYONIXVT3BlbkFJwwDmvA3HFW7Stk96w83h")
$b64:="data:image/png;base64,"+KST_web_Lire_param(->$tVnom; ->$tVal; "b64")
$uuidUser:=KST_web_Lire_param(->$tVnom; ->$tVal; "uuidUser")


//$jsonBrut:=$client.chat.vision.create($b64).prompt($requete).choice.message.content

////var $result:=$client.chat.completions.create($messages; {model: "gpt-4o-mini"})
If (False:C215)
	$refdoc:=Create document:C266(System folder:C487(Bureau:K41:16)+"Analyse_IA2.txt")
	$file:=Folder:C1567(fk dossier bureau:K87:19).file("Analyse_IA2.txt")
	SEND PACKET:C103($refdoc; "Creation document "+$file.fullName+Char:C90(13))
	SEND PACKET:C103($refdoc; "prompt envoyé avec même image en 0.256 MB : ")
	For ($i; 1; 2)
		//GPT-4o = melleur
		$TP_gpt40_d:=Timestamp:C1445
		$jsonBrut:=$client.chat.vision.create($b64; {model: "gpt-4o"}).prompt($requete).choice.message.content
		$TP_gpt40_f:=Timestamp:C1445
		SEND PACKET:C103($refdoc; "modele 'gpt-4o' : "+Char:C90(13)+" [début] = "+$TP_gpt40_d)
		SEND PACKET:C103($refdoc; " [fin] = "+$TP_gpt40_f)
		SEND PACKET:C103($refdoc; Char:C90(13)+"réponses : "+Char:C90(13)+$jsonBrut)
		
		//SEPARATION
		SEND PACKET:C103($refdoc; Char:C90(13)+Char:C90(13)+Char:C90(13))
		
		
		$TP_d:=Timestamp:C1445
		$jsonBrut:=$client.chat.vision.create($b64; {model: "gpt-4o-mini"}).prompt($requete).choice.message.content
		$TP_f:=Timestamp:C1445
		SEND PACKET:C103($refdoc; "modele 'gpt-4o-mini' : "+Char:C90(13)+" [début] = "+$TP_d)
		SEND PACKET:C103($refdoc; " [fin] = "+$TP_f)
		SEND PACKET:C103($refdoc; Char:C90(13)+"réponses : "+Char:C90(13)+$jsonBrut)
		
		//SEPARATION
		SEND PACKET:C103($refdoc; Char:C90(13)+Char:C90(13)+Char:C90(13))
		
		
		$TP_d:=Timestamp:C1445
		$jsonBrut:=$client.chat.vision.create($b64; {model: "gpt-4-turbo"}).prompt($requete).choice.message.content
		$TP_f:=Timestamp:C1445
		SEND PACKET:C103($refdoc; "modele 'gpt-4-turbo' : "+Char:C90(13)+" [début] = "+$TP_d)
		SEND PACKET:C103($refdoc; " [fin] = "+$TP_f)
		SEND PACKET:C103($refdoc; Char:C90(13)+"réponses : "+Char:C90(13)+$jsonBrut)
		
		//SEPARATION
		SEND PACKET:C103($refdoc; Char:C90(13)+Char:C90(13)+Char:C90(13))
		
		//[Cave]Douceur
		$TP_d:=Timestamp:C1445
		$jsonBrut:=$client.chat.vision.create($b64; {model: "o3"}).prompt($requete).choice.message.content
		$TP_f:=Timestamp:C1445
		SEND PACKET:C103($refdoc; "modele 'o3' : "+Char:C90(13)+" [début] = "+$TP_d)
		SEND PACKET:C103($refdoc; " [fin] = "+$TP_f)
		SEND PACKET:C103($refdoc; Char:C90(13)+"réponses : "+Char:C90(13)+$jsonBrut)
	End for 
	CLOSE DOCUMENT:C267($refdoc)
End if 


$requete:="Vous êtes un caviste expert (30 ans d’expérience). À partir de l’image, décrivez l’étiquette du vin en JSON avec : nom, région, la sous région, le pays, l'appellation, millésime, type, apogée ('APOGEE'), alcool, contenance, conservation"+", site, producteur (nom, adresse), prix moyen, couleur (Rouge,Blanc,Rosé), cépages, domaine, conseils mets et vins ('CONSEIL'), douceur à choisir parmi ces valeurs : ('Sec','pas tout à fait sec', 'demi-sec', 'moelleux', 'doux', 'brut nature', 'ext"+"ra-brut', 'brut', 'extra-dry'). Si des infos manquent, complétez-les selon vos connaissances œnologiques sans retourner de champs vides."


//vrai
//$jsonBrut:=$client.chat.vision.create($b64; {model: "gpt-5"}).prompt($requete).choice.message.content
//$requete:="Vous êtes un caviste expert (30 ans d’expérience). À partir de l’image, décrivez l’étiquette du vin en JSON avec : nom, région, la sous région, le pays, l'appellation, millésime, type(Tranquille,VDN/VDL (vins mutés/fortifiés), Efferves"+"cent), apogée ('APOGEE'), alcool, contenance, conservation, site, producteur (nom, adresse), prix moyen, couleur (Rouge,Blanc,Rosé), cépages, domaine, conseils mets et vins ('CONSEIL'), douceur à choisir parmi ces valeurs : ('Sec','pas tout à fai"+"t sec', 'demi-sec', 'moelleux', 'doux', 'brut nature', 'extra-brut', 'brut', 'extra-dry'), degustation sous forme de chaine plat1,plat2,plat3. Si des infos manquent, complétez-les selon vos connaissances œnologiques sans retourner de champs vides."

If (True:C214)
	$refdoc:=Create document:C266(System folder:C487(Bureau:K41:16)+"Analyse_IA2.txt")
	$file:=Folder:C1567(fk dossier bureau:K87:19).file("Analyse_IA2.txt")
	SEND PACKET:C103($refdoc; "Creation document "+$file.fullName+Char:C90(13))
	SEND PACKET:C103($refdoc; "prompt envoyé avec même image en 0.256 MB : ")
	For ($i; 1; 2)
		//GPT-4o = melleur
		$TP_gpt40_d:=Timestamp:C1445
		$jsonBrut:=$client.chat.vision.create($b64; {model: "gpt-4o"}).prompt($requete).choice.message.content
		$TP_gpt40_f:=Timestamp:C1445
		SEND PACKET:C103($refdoc; "modele 'gpt-4o' : "+Char:C90(13)+" [début] = "+$TP_gpt40_d)
		SEND PACKET:C103($refdoc; " [fin] = "+$TP_gpt40_f)
		SEND PACKET:C103($refdoc; Char:C90(13)+"réponses : "+Char:C90(13)+$jsonBrut)
		
		//SEPARATION
		SEND PACKET:C103($refdoc; Char:C90(13)+Char:C90(13)+Char:C90(13))
		
		
		$TP_d:=Timestamp:C1445
		$jsonBrut:=$client.chat.vision.create($b64; {model: "gpt-4o-mini"}).prompt($requete).choice.message.content
		$TP_f:=Timestamp:C1445
		SEND PACKET:C103($refdoc; "modele 'gpt-4o-mini' : "+Char:C90(13)+" [début] = "+$TP_d)
		SEND PACKET:C103($refdoc; " [fin] = "+$TP_f)
		SEND PACKET:C103($refdoc; Char:C90(13)+"réponses : "+Char:C90(13)+$jsonBrut)
		
		//SEPARATION
		SEND PACKET:C103($refdoc; Char:C90(13)+Char:C90(13)+Char:C90(13))
		
		
		$TP_d:=Timestamp:C1445
		$jsonBrut:=$client.chat.vision.create($b64; {model: "gpt-4-turbo"}).prompt($requete).choice.message.content
		$TP_f:=Timestamp:C1445
		SEND PACKET:C103($refdoc; "modele 'gpt-4-turbo' : "+Char:C90(13)+" [début] = "+$TP_d)
		SEND PACKET:C103($refdoc; " [fin] = "+$TP_f)
		SEND PACKET:C103($refdoc; Char:C90(13)+"réponses : "+Char:C90(13)+$jsonBrut)
		
		//SEPARATION
		SEND PACKET:C103($refdoc; Char:C90(13)+Char:C90(13)+Char:C90(13))
		
		//[Cave]Douceur
		$TP_d:=Timestamp:C1445
		$jsonBrut:=$client.chat.vision.create($b64; {model: "gpt-5"}).prompt($requete).choice.message.content
		$TP_f:=Timestamp:C1445
		SEND PACKET:C103($refdoc; "modele 'gpt-5' : "+Char:C90(13)+" [début] = "+$TP_d)
		SEND PACKET:C103($refdoc; " [fin] = "+$TP_f)
		SEND PACKET:C103($refdoc; Char:C90(13)+"réponses : "+Char:C90(13)+$jsonBrut)
	End for 
	CLOSE DOCUMENT:C267($refdoc)
End if 


$json:=Substring:C12($jsonBrut; Position:C15("{"; $jsonBrut))

$json:=Replace string:C233($json; "```json"; ""; 99999)
$json:=Replace string:C233($json; "```"; ""; 99999)
C_BLOB:C604($blobImg)
C_PICTURE:C286($Img)
$tableIA:=ds:C1482.Analyse_IA.new()
$tableIA.requete:=$requete
$tableIA.b64:=$b64
BASE64 DECODE:C896($tableIA.b64; $blobImg)
$tableIA.blobImage:=$blobImg
BLOB TO PICTURE:C682($blobImg; $Img)
$tableIA.image:=$Img
$tableIA.reponse:=$jsonBrut
$tableIA.reponseFormate:=$json
$tableIA.date:=Current date:C33(*)
$tableIA.heure:=Current time:C178
$tableIA.save()

C_OBJECT:C1216($Obj)
$Obj:=JSON Parse:C1218($json)
/*TRACE
$plat:=$Obj.degustation
$colPlat:=Séparer chaine($plat; ",")
Pour chaque ($met; $colPlat)
//Pour chaque ($met; $Obj.degustation)

Si ((Sous chaîne($met; 1; 1))=Caractère(Espacement))
$met:=Sous chaîne($met; 2; Longueur($met))
Fin de si 

$degustation:=ds.Vin_Association.new()
$degustation.nomVin:=$Obj.nom
$degustation.nomMet:=$met
$degustation.UUID_Utilisateur:=$uuidUser
//$degustation.save()
Fin de chaque 
*/


$jsonSend:=JSON Stringify:C1217($Obj)
ALERT:C41($jsonSend)
WEB SEND TEXT:C677($jsonSend; "application/json")


$tableIA.reponseEnvoye:=$jsonSend
$tableIA.save()


