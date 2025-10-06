//%attributes = {}
re$chemindata:=Data file:C490
//recherche de l'ancien data

_O_PLATFORM PROPERTIES:C365($plat)
Case of 
	: ($plat=3)  //On est sur Window
		
		$ref:=Open document:C264(""; ".4DD")
	: ($plat=1) | ($plat=2)  //On est sur Mac !!!
		
		$ref:=Open document:C264(""; "dat5")
End case 

If (ok=1)
	$chemin:=document
	CLOSE DOCUMENT:C267($ref)
	
	$x_ref:=Create document:C266(Get 4D folder:C485+"CAV_Commande")
	SEND PACKET:C103($x_ref; "Exporter"+Char:C90(13))
	SEND PACKET:C103($x_ref; $chemindata+Char:C90(13))
	SEND PACKET:C103($x_ref; $chemin+Char:C90(13))
	
	CLOSE DOCUMENT:C267($x_Ref)
	
	OPEN DATA FILE:C312($chemin)
	
End if 








//$chemindata:=Fichier donnees

//  `recherche de l'ancien data

//PROPRIETES PLATE FORME($plat)

//Au cas ou 

//: ($plat=3)  `On est sur Window

//$ref:=Ouvrir document("";".4DD")

//: ($plat=1) | ($plat=2)  `On est sur Mac !!!

//$ref:=Ouvrir document("";"dat5")

//Fin de cas 

//

//Si (ok=1)

//$chemin:=document

//FERMER DOCUMENT($ref)

//

//$ref:=OUVRIR FICHIER DONNEES($chemin)

//

//TOUT SELECTIONNER([Cave])

//DEBUT SELECTION

//REGLER SERIE(10;Dossier 4D+"Exp_Cave")

//TOUT SELECTIONNER([Cave])

//DEBUT SELECTION([Cave])

//Tant que (Non(Fin de selection([Cave])

//ENVOYER ENREGISTREMENT([Cave])

//ENREGISTREMENT SUIVANT([Cave])

//Fin tant que 

//

//REGLER SERIE(11)

//

//$ref:=OUVRIR FICHIER DONNEES($chemindata)

//

//REGLER SERIE(10;Dossier 4D+"Exp_Cave")

//RECEVOIR ENREGISTREMENT([Cave])

//Tant que (Ok=1)

//STOCKER ENREGISTREMENT([Cave])

//RECEVOIR ENREGISTREMENT([Cave])

//Fin tant que 

//

//REGLER SERIE(11)

//Fin de si 

