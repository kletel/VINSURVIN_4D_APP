//%attributes = {}
QUERY:C277([Region:9]; [Region:9]Nom_Fr:2="Champage")
If (Records in selection:C76([Region:9])=1)
	[Region:9]Nom_Fr:2:="Champagne"
	SAVE RECORD:C53([Region:9])
End if 

QUERY:C277([Sites:15]; [Sites:15]Site:2="http://www.didiers.ne")
If (Records in selection:C76([Sites:15])=1)
	[Sites:15]Site:2:="http://www.didiers.net"
	SAVE RECORD:C53([Sites:15])
End if 

QUERY:C277([Cépages:6]; [Cépages:6]Langue:9=0)
If (Records in selection:C76([Cépages:6])>0)
	APPLY TO SELECTION:C70([Cépages:6]; [Cépages:6]Langue:9:=1)
End if 

QUERY:C277([Cave:2]; [Cave:2]Cave:40="")
If (Records in selection:C76([Cave:2])>0)
	APPLY TO SELECTION:C70([Cave:2]; [Cave:2]Cave:40:=Get indexed string:C510(<>strLang; 156))
End if 

QUERY:C277([Vocabulaire:5]; [Vocabulaire:5]Nom_Fr:7=""; *)
QUERY:C277([Vocabulaire:5];  & ; [Vocabulaire:5]Nom_All:11=""; *)
QUERY:C277([Vocabulaire:5];  & ; [Vocabulaire:5]Nom_Ang:9=""; *)
QUERY:C277([Vocabulaire:5];  & ; [Vocabulaire:5]Nom_Da:8=""; *)
QUERY:C277([Vocabulaire:5];  & ; [Vocabulaire:5]Nom_Esp:10="")
While (Not:C34(End selection:C36([Vocabulaire:5])))
	[Vocabulaire:5]Nom_Fr:7:=[Vocabulaire:5]Nom:1
	SAVE RECORD:C53([Vocabulaire:5])
	NEXT RECORD:C51([Vocabulaire:5])
End while 

QUERY:C277([Association:7]; [Association:7]Langue:5="")
If (Records in selection:C76([Association:7])>0)
	APPLY TO SELECTION:C70([Association:7]; [Association:7]Langue:5:="Fr")
End if 


ALL RECORDS:C47([Cave:2])
ORDER BY:C49([Cave:2]Ref_Cave:26; >)
$nb:=0
While (Not:C34(End selection:C36([Cave:2])))
	If ($nb=[Cave:2]Ref_Cave:26)
		[Cave:2]Ref_Cave:26:=0
		SAVE RECORD:C53([Cave:2])
	Else 
		$nb:=[Cave:2]Ref_Cave:26
	End if 
	NEXT RECORD:C51([Cave:2])
End while 

//Correction d'une erreur de référence région pour l'Afrique du Sud (ref pays=19)
//On recherche avant tout que la référence 19 correspond bien au pays afrique du sud (pour eviter de faire de mauvaise modidifcations)
ALL RECORDS:C47([Pays:8])
QUERY:C277([Pays:8]; [Pays:8]Ref_Pays:1=19)
If (Records in selection:C76([Pays:8])=1) & ([Pays:8]Nom_Fr:3="Afrique du Sud")
	ALL RECORDS:C47([Region:9])
	QUERY:C277([Region:9]; [Region:9]Ref_Region:1>=51; *)
	QUERY:C277([Region:9];  & ; [Region:9]Ref_Region:1<=63; *)
	QUERY:C277([Region:9];  & ; [Region:9]Ref_Pays:10=5)
	If (Records in selection:C76([Region:9])>0)
		APPLY TO SELECTION:C70([Region:9]; [Region:9]Ref_Pays:10:=19)
	End if 
End if 

//Correction du nom de la région sud Africaine en langue francaise qui contient un espace devant son nom (il ne doit y avoir qu'une seule région touchée par cette erreur)
ALL RECORDS:C47([Region:9])
QUERY:C277([Region:9]; [Region:9]Ref_Region:1>=59; *)
QUERY:C277([Region:9];  & ; [Region:9]Nom_Fr:2=" Worcester")
If (Records in selection:C76([Region:9])=1)
	APPLY TO SELECTION:C70([Region:9]; [Region:9]Nom_Fr:2:="Worcester")
End if 

//Correction de la référence du pays europe de l'est dans la table titre_millésimes puis corrections de la références dans la table millésimes
READ WRITE:C146([Titre_Millesime:14])
ALL RECORDS:C47([Titre_Millesime:14])
QUERY:C277([Titre_Millesime:14]; [Titre_Millesime:14]Pays:1="Europe de l'est"; *)
QUERY:C277([Titre_Millesime:14];  | ; [Titre_Millesime:14]Pays:1="Eastern Europe")
QUERY SELECTION:C341([Titre_Millesime:14]; [Titre_Millesime:14]Ref_Pays:2=15)
If (Records in selection:C76([Titre_Millesime:14])>0)
	APPLY TO SELECTION:C70([Titre_Millesime:14]; [Titre_Millesime:14]Ref_Pays:2:=12)
End if 
//Mise à jour des références pays dans la table millésimes
ALL RECORDS:C47([Millésimes:4])
QUERY:C277([Millésimes:4]; [Millésimes:4]Ref_Pays:12=15)
If (Records in selection:C76([Millésimes:4])>0)
	APPLY TO SELECTION:C70([Millésimes:4]; [Millésimes:4]Ref_Pays:12:=12)
	APPLY TO SELECTION:C70([Millésimes:4]; [Millésimes:4]Pays:11:="Europe de l'est")
End if 

//Correction de la référence du pays New-Zealand dans la table titre_millésimes puis corrections de la références dans la table millésimes
READ WRITE:C146([Titre_Millesime:14])
ALL RECORDS:C47([Titre_Millesime:14])
QUERY:C277([Titre_Millesime:14]; [Titre_Millesime:14]Pays:1="Nouvelle Zélande / Afrique du Sud"; *)
QUERY:C277([Titre_Millesime:14];  | ; [Titre_Millesime:14]Pays:1="New Zealand / South Africa")
QUERY SELECTION:C341([Titre_Millesime:14]; [Titre_Millesime:14]Ref_Pays:2=17)
If (Records in selection:C76([Titre_Millesime:14])>0)
	//Tant que (Non(Fin de selection([Titre_Millesime])))
	//Si ([Titre_Millesime]Ref_Pays=15)
	//[Titre_Millesime]Ref_Pays:=12
	//Fin de si 
	//ENREGISTREMENT SUIVANT([Titre_Millesime])
	//Fin tant que 
	APPLY TO SELECTION:C70([Titre_Millesime:14]; [Titre_Millesime:14]Ref_Pays:2:=15)
End if 
//Mise à jour des références pays dans la table millésimes
ALL RECORDS:C47([Millésimes:4])
QUERY:C277([Millésimes:4]; [Millésimes:4]Ref_Pays:12=17)
If (Records in selection:C76([Millésimes:4])>0)
	APPLY TO SELECTION:C70([Millésimes:4]; [Millésimes:4]Ref_Pays:12:=15)
	APPLY TO SELECTION:C70([Millésimes:4]; [Millésimes:4]Pays:11:="Nouvelle Zélande / Afrique du Sud")
End if 