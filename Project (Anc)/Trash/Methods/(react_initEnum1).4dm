//%attributes = {"publishedWeb":true}
C_COLLECTION:C1488($typeVin)
$typeVin:=New collection:C1472
$typeVin.push(New object:C1471("Libelle"; "Tranquille"; "sous_collection"; "Douceur Tranquille"))
$typeVin.push(New object:C1471("Libelle"; "VDN/VDL (vins mutés/fortifiés)"; "sous_collection"; "Douceur Tranquille"))
$typeVin.push(New object:C1471("Libelle"; "Effervescent"; "sous_collection"; "Douceur Tranquille"))
TRACE:C157
READ WRITE:C146([Enum:27])
QUERY:C277([Enum:27]; [Enum:27]titre:3="Type de vin"; *)
QUERY:C277([Enum:27];  & ; [Enum:27]langue:4="FR")

If (Records in selection:C76([Enum:27])=0)
	CREATE RECORD:C68([Enum:27])
	[Enum:27]titre:3:="Type de vin"
	[Enum:27]langue:4:="FR"
End if 
//[Enum]Valeur_Enum:=Créer objet
[Enum:27]Valeur_Enum:1:=(New object:C1471("Valeur"; $typeVin))
SAVE RECORD:C53([Enum:27])
UNLOAD RECORD:C212([Enum:27])


/*
$enum_typeVin:=ds.Enum.query("titre=:1"; "Type de vin").first()
$enum_typeVin.valeur:=$typeVin
$enum_typeVin.valeur:=Créer objet("valeur"; "Tranquille"; "sous_collection"; "Douceur Tranquille")
*/

/********** * **** Douceur Tranquille **** * **********/
C_COLLECTION:C1488($douceurTranquille)
$douceurTranquille:=New collection:C1472
$douceurTranquille.push(New object:C1471("Libelle"; "Sec"))
$douceurTranquille.push(New object:C1471("Libelle"; "Pas tout à fait sec"))
$douceurTranquille.push(New object:C1471("Libelle"; "Demi-sec"))
$douceurTranquille.push(New object:C1471("Libelle"; "Moelleux"))
$douceurTranquille.push(New object:C1471("Libelle"; "Doux"))
READ WRITE:C146([Enum:27])
QUERY:C277([Enum:27]; [Enum:27]titre:3="Douceur Tranquille"; *)
QUERY:C277([Enum:27];  & ; [Enum:27]langue:4="FR")
If (Records in selection:C76([Enum:27])=0)
	CREATE RECORD:C68([Enum:27])
	[Enum:27]titre:3:="Douceur Tranquille"
	[Enum:27]langue:4:="FR"
End if 
//[Enum]Valeur_Enum:=Créer objet
[Enum:27]Valeur_Enum:1:=(New object:C1471("Valeur"; $douceurTranquille))
SAVE RECORD:C53([Enum:27])
UNLOAD RECORD:C212([Enum:27])

/********** * **** Douceur Effervescent **** * **********/
C_COLLECTION:C1488($douceurEffervescent)
$douceurEffervescent:=New collection:C1472
$douceurEffervescent.push(New object:C1471("Libelle"; "Brut nature"))
$douceurEffervescent.push(New object:C1471("Libelle"; "Extra-brut"))
$douceurEffervescent.push(New object:C1471("Libelle"; "Brut"))
$douceurEffervescent.push(New object:C1471("Libelle"; "Extra-dry"))
$douceurEffervescent.push(New object:C1471("Libelle"; "Sec"))
$douceurEffervescent.push(New object:C1471("Libelle"; "Demi-sec"))
$douceurEffervescent.push(New object:C1471("Libelle"; "Doux"))
READ WRITE:C146([Enum:27])
QUERY:C277([Enum:27]; [Enum:27]titre:3="Douceur Effervescent"; *)
QUERY:C277([Enum:27];  & ; [Enum:27]langue:4="FR")
If (Records in selection:C76([Enum:27])=0)
	CREATE RECORD:C68([Enum:27])
	[Enum:27]titre:3:="Douceur Effervescent"
	[Enum:27]langue:4:="FR"
End if 
//[Enum]Valeur_Enum:=Créer objet
[Enum:27]Valeur_Enum:1:=(New object:C1471("Valeur"; $douceurTranquille))
SAVE RECORD:C53([Enum:27])
UNLOAD RECORD:C212([Enum:27])

/********** * **** ELEVAGE **** * **********/
C_COLLECTION:C1488($elevage)
$elevage:=New collection:C1472
$elevage.push(New object:C1471("Libelle"; "Cuve"))
$elevage.push(New object:C1471("Libelle"; "Barrique"))
$elevage.push(New object:C1471("Libelle"; "Foudre"))
$elevage.push(New object:C1471("Libelle"; "Amphore"))
$elevage.push(New object:C1471("Libelle"; "Œuf de béton"))
$elevage.push(New object:C1471("Libelle"; "Cuve béton Galiléo"))
$elevage.push(New object:C1471("Libelle"; "Bonbonne"))
$elevage.push(New object:C1471("Libelle"; "Bouteille"))
READ WRITE:C146([Enum:27])
QUERY:C277([Enum:27]; [Enum:27]titre:3="Elevage"; *)
QUERY:C277([Enum:27];  & ; [Enum:27]langue:4="FR")
If (Records in selection:C76([Enum:27])=0)
	CREATE RECORD:C68([Enum:27])
	[Enum:27]titre:3:="Elevage"
	[Enum:27]langue:4:="FR"
End if 
//[Enum]Valeur_Enum:=Créer objet
[Enum:27]Valeur_Enum:1:=(New object:C1471("Valeur"; $elevage))
SAVE RECORD:C53([Enum:27])
UNLOAD RECORD:C212([Enum:27])

/********** * **** CONTENANT **** * **********/
C_COLLECTION:C1488($contenant)
$contenant:=New collection:C1472
$contenant.push(New object:C1471("Libelle"; "Quart/Piccolo 18,75 cl"))
$contenant.push(New object:C1471("Libelle"; "Chopine 20 cl"))
$contenant.push(New object:C1471("Libelle"; "Demi-bouteille/Fillette 37,5 cl"))
$contenant.push(New object:C1471("Libelle"; "Bouteille 75 cl (par défaut)"))
$contenant.push(New object:C1471("Libelle"; "Magnum 1,5 L"))
$contenant.push(New object:C1471("Libelle"; "Jéroboam 3 L"))
$contenant.push(New object:C1471("Libelle"; "Double-Magnum (Bordeaux) 3 L"))
$contenant.push(New object:C1471("Libelle"; "Réhoboam 4,5 L"))
$contenant.push(New object:C1471("Libelle"; "Jéroboam (Bordeaux) 5 L"))
$contenant.push(New object:C1471("Libelle"; "Impériale/Mathusalem 6 L"))
$contenant.push(New object:C1471("Libelle"; "Salmanazar 9 L"))
$contenant.push(New object:C1471("Libelle"; "Balthazar 12 L"))
$contenant.push(New object:C1471("Libelle"; "Nabuchodonosor 15 L"))
$contenant.push(New object:C1471("Libelle"; "Salomon/Melchior 18 L"))
$contenant.push(New object:C1471("Libelle"; "Souverain 26,25 L"))
$contenant.push(New object:C1471("Libelle"; "Primat 27 L"))
$contenant.push(New object:C1471("Libelle"; "Melchizédec/Midas 30 L"))
READ WRITE:C146([Enum:27])
QUERY:C277([Enum:27]; [Enum:27]titre:3="Contenant"; *)
QUERY:C277([Enum:27];  & ; [Enum:27]langue:4="FR")
If (Records in selection:C76([Enum:27])=0)
	CREATE RECORD:C68([Enum:27])
	[Enum:27]titre:3:="Contenant"
	[Enum:27]langue:4:="FR"
End if 
//[Enum]Valeur_Enum:=Créer objet
[Enum:27]Valeur_Enum:1:=(New object:C1471("Valeur"; $contenant))
SAVE RECORD:C53([Enum:27])
UNLOAD RECORD:C212([Enum:27])