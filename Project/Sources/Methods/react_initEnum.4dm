//%attributes = {"publishedWeb":true}
C_COLLECTION:C1488($typeVin)
$typeVin:=New collection:C1472
$typeVin.push(New object:C1471("Libelle"; "Tranquille"; "sous_collection"; "Douceur Tranquille"))
$typeVin.push(New object:C1471("Libelle"; "VDN/VDL (vins mutés/fortifiés)"; "sous_collection"; "Douceur Tranquille"))
$typeVin.push(New object:C1471("Libelle"; "Effervescent"; "sous_collection"; "Douceur Tranquille"))
READ WRITE:C146([Enum:27])
QUERY:C277([Enum:27]; [Enum:27]titre:3="Type de vin"; *)
QUERY:C277([Enum:27];  & ; [Enum:27]langue:4="FR")

If (Records in selection:C76([Enum:27])=0)
	CREATE RECORD:C68([Enum:27])
	[Enum:27]titre:3:="Type de vin"
	[Enum:27]langue:4:="FR"
End if 
[Enum:27]Valeur_Enum:1:=(New object:C1471("Valeur"; $typeVin))
SAVE RECORD:C53([Enum:27])
UNLOAD RECORD:C212([Enum:27])


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
[Enum:27]Valeur_Enum:1:=(New object:C1471("Valeur"; $douceurEffervescent))
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
[Enum:27]Valeur_Enum:1:=(New object:C1471("Valeur"; $contenant))
SAVE RECORD:C53([Enum:27])
UNLOAD RECORD:C212([Enum:27])

/********** * **** LIEU D'ACHAT **** * **********/
C_COLLECTION:C1488($lieuAchat)
$lieuAchat:=New collection:C1472
$lieuAchat.push(New object:C1471("Libelle"; "Domaine"))
$lieuAchat.push(New object:C1471("Libelle"; "Négociant"))
$lieuAchat.push(New object:C1471("Libelle"; "Caviste"))
$lieuAchat.push(New object:C1471("Libelle"; "Grande Distribution"))
$lieuAchat.push(New object:C1471("Libelle"; "Salon/Foire"))
$lieuAchat.push(New object:C1471("Libelle"; "Site internet"))
$lieuAchat.push(New object:C1471("Libelle"; "Autres"))
READ WRITE:C146([Enum:27])
QUERY:C277([Enum:27]; [Enum:27]titre:3="Lieu d'achat"; *)
QUERY:C277([Enum:27];  & ; [Enum:27]langue:4="FR")
If (Records in selection:C76([Enum:27])=0)
	CREATE RECORD:C68([Enum:27])
	[Enum:27]titre:3:="Lieu d'achat"
	[Enum:27]langue:4:="FR"
End if 
[Enum:27]Valeur_Enum:1:=(New object:C1471("Valeur"; $lieuAchat))
SAVE RECORD:C53([Enum:27])
UNLOAD RECORD:C212([Enum:27])

/********** * **** NEZ INTENSITÉ **** * **********/
C_COLLECTION:C1488($intensité_nez)
$intensité_nez:=New collection:C1472
$intensité_nez.push(New object:C1471("Libelle"; "légère"))
$intensité_nez.push(New object:C1471("Libelle"; "moyenne (-)"))
$intensité_nez.push(New object:C1471("Libelle"; "moyenne"))
$intensité_nez.push(New object:C1471("Libelle"; "moyenne (+)"))
$intensité_nez.push(New object:C1471("Libelle"; "prononcée"))
READ WRITE:C146([Enum:27])
QUERY:C277([Enum:27]; [Enum:27]titre:3="Nez intensite"; *)
QUERY:C277([Enum:27];  & ; [Enum:27]langue:4="FR")
If (Records in selection:C76([Enum:27])=0)
	CREATE RECORD:C68([Enum:27])
	[Enum:27]titre:3:="Nez intensite"
	[Enum:27]langue:4:="FR"
End if 
[Enum:27]Valeur_Enum:1:=(New object:C1471("Valeur"; $intensité_nez))
SAVE RECORD:C53([Enum:27])
UNLOAD RECORD:C212([Enum:27])




/********** * **** NEZ AROME **** * **********/
C_OBJECT:C1216($aromes)
$aromes:=New object:C1471
$aromes["Primaires"]:=New object:C1471
$aromes["Secondaires"]:=New object:C1471
$aromes["Tertiaires"]:=New object:C1471

// ------------------
// PRIMAIRES
// ------------------
C_COLLECTION:C1488($primaires)
$primaires:=New collection:C1472
$primaires.push(New object:C1471("categorie"; "Floral"; "libelle"; New collection:C1472("acacia"; "chèvrefeuille"; "camomille"; "sureau"; "géranium"; "fleurs"; "rose"; "violette")))
$primaires.push(New object:C1471("categorie"; "Fruits verts"; "libelle"; New collection:C1472("pomme"; "groseille à maquereau"; "poire"; "bonbon anglais"; "coing"; "raisin")))
$primaires.push(New object:C1471("categorie"; "Agrumes"; "libelle"; New collection:C1472("pamplemousse"; "citron"; "citron vert"; "écorce d’orange"; "écorce de citron")))
$primaires.push(New object:C1471("categorie"; "Fruits à noyau"; "libelle"; New collection:C1472("pêche"; "abricot"; "nectarine")))
$primaires.push(New object:C1471("categorie"; "Fruits exotiques"; "libelle"; New collection:C1472("banane"; "litchi"; "mangue"; "melon"; "fruit de la passion"; "ananas")))
$primaires.push(New object:C1471("categorie"; "Fruits rouges"; "libelle"; New collection:C1472("groseille"; "airelle"; "framboise"; "fraise"; "cerise"; "prune rouge")))
$primaires.push(New object:C1471("categorie"; "Fruits noirs"; "libelle"; New collection:C1472("cassis"; "mûre"; "fruits des bois"; "myrtille"; "cerise noire"; "prune bleue")))
$primaires.push(New object:C1471("categorie"; "Fruits séchés/cuits"; "libelle"; New collection:C1472("figue"; "pruneau"; "raisins secs"; "raisins de Corinthe"; "kirsch"; "confiture"; "fruits cuits au four"; "en compote"; "en conserve")))
$primaires.push(New object:C1471("categorie"; "Végétal"; "libelle"; New collection:C1472("poivron vert"; "herbe coupée"; "feuilles de tomate"; "asperge"; "feuilles de cassis")))
$primaires.push(New object:C1471("categorie"; "Herbes"; "libelle"; New collection:C1472("eucalyptus"; "menthe"; "plantes médicinales"; "lavande"; "fenouil"; "aneth")))
$primaires.push(New object:C1471("categorie"; "Épices fortes"; "libelle"; New collection:C1472("poivre blanc/noir"; "réglisse")))
$primaires.push(New object:C1471("categorie"; "Autres"; "libelle"; New collection:C1472("silex"; "pierres mouillées"; "laine mouillée")))
$aromes["Primaires"]["Categories"]:=$primaires
// ------------------
// SECONDAIRES
// ------------------
C_COLLECTION:C1488($secondaires)
$secondaires:=New collection:C1472
$secondaires.push(New object:C1471("categorie"; "Levures"; "libelle"; New collection:C1472("biscuit"; "pain"; "pain grillé"; "pâtisserie"; "brioche"; "pâte à pain"; "fromage")))
$secondaires.push(New object:C1471("categorie"; "FML (fermentation malolactique)"; "libelle"; New collection:C1472("beurre"; "fromage"; "crème")))
$secondaires.push(New object:C1471("categorie"; "Chêne"; "libelle"; New collection:C1472("vanille"; "clou de girofle"; "noix de muscade"; "noix de coco"; "caramel au beurre salé"; "pain grillé"; "cèdre"; "bois brûlé"; "fumée"; "chocolat"; "café"; "résine")))
$aromes["Secondaires"]["Categories"]:=$secondaires
// ------------------
// TERTIAIRES
// ------------------
C_COLLECTION:C1488($tertiaires)
$tertiaires:=New collection:C1472
$tertiaires.push(New object:C1471("categorie"; "Oxydation délibérée"; "libelle"; New collection:C1472("amande"; "pâte d’amande"; "noisette"; "noix"; "chocolat"; "café"; "bonbon au caramel"; "caramel")))
$tertiaires.push(New object:C1471("categorie"; "Évolution des notes fruitées (blanc)"; "libelle"; New collection:C1472("abricot sec"; "marmelade"; "pomme séchée"; "banane séchée")))
$tertiaires.push(New object:C1471("categorie"; "Évolution des notes fruitées (rouge)"; "libelle"; New collection:C1472("figue"; "pruneau"; "goudron"; "mûre séchée"; "mûre cuite"; "prune rouge cuite")))
$tertiaires.push(New object:C1471("categorie"; "Vieillissement en bouteille (blanc)"; "libelle"; New collection:C1472("essence"; "kérosène"; "cannelle"; "gingembre"; "noix de muscade"; "pain grillé"; "fruits secs"; "champignon"; "foin"; "miel")))
$tertiaires.push(New object:C1471("categorie"; "Vieillissement en bouteille (rouge)"; "libelle"; New collection:C1472("cuir"; "sous-bois"; "terre"; "champignon"; "gibier"; "tabac"; "végétal"; "feuilles mouillées"; "viande"; "basse-cour")))
$aromes["Tertiaires"]["Categories"]:=$tertiaires

READ WRITE:C146([Enum:27])
QUERY:C277([Enum:27]; [Enum:27]titre:3="Arômes Primaires"; *)
QUERY:C277([Enum:27];  & ; [Enum:27]langue:4="FR")
If (Records in selection:C76([Enum:27])=0)
	CREATE RECORD:C68([Enum:27])
	[Enum:27]titre:3:="Arômes Primaires"
	[Enum:27]langue:4:="FR"
End if 
[Enum:27]Valeur_Enum:1:=(New object:C1471("Valeur"; $primaires))
SAVE RECORD:C53([Enum:27])
UNLOAD RECORD:C212([Enum:27])
//
READ WRITE:C146([Enum:27])
QUERY:C277([Enum:27]; [Enum:27]titre:3="Arômes Secondaires"; *)
QUERY:C277([Enum:27];  & ; [Enum:27]langue:4="FR")
If (Records in selection:C76([Enum:27])=0)
	CREATE RECORD:C68([Enum:27])
	[Enum:27]titre:3:="Arômes Secondaires"
	[Enum:27]langue:4:="FR"
End if 
[Enum:27]Valeur_Enum:1:=(New object:C1471("Valeur"; $secondaires))
SAVE RECORD:C53([Enum:27])
UNLOAD RECORD:C212([Enum:27])
//
READ WRITE:C146([Enum:27])
QUERY:C277([Enum:27]; [Enum:27]titre:3="Arômes Tertiaires"; *)
QUERY:C277([Enum:27];  & ; [Enum:27]langue:4="FR")
If (Records in selection:C76([Enum:27])=0)
	CREATE RECORD:C68([Enum:27])
	[Enum:27]titre:3:="Arômes Tertiaires"
	[Enum:27]langue:4:="FR"
End if 
[Enum:27]Valeur_Enum:1:=(New object:C1471("Valeur"; $tertiaires))
SAVE RECORD:C53([Enum:27])
UNLOAD RECORD:C212([Enum:27])


/********** * **** ACIDITÉ **** * **********/
C_COLLECTION:C1488($acidite)
$acidite:=New collection:C1472
$acidite.push(New object:C1471("Libelle"; "faible"))
$acidite.push(New object:C1471("Libelle"; "moyenne (-)"))
$acidite.push(New object:C1471("Libelle"; "moyenne"))
$acidite.push(New object:C1471("Libelle"; "moyenne (+)"))
$acidite.push(New object:C1471("Libelle"; "élevée"))
READ WRITE:C146([Enum:27])
QUERY:C277([Enum:27]; [Enum:27]titre:3="Acidité"; *)
QUERY:C277([Enum:27];  & ; [Enum:27]langue:4="FR")
If (Records in selection:C76([Enum:27])=0)
	CREATE RECORD:C68([Enum:27])
	[Enum:27]titre:3:="Acidité"
	[Enum:27]langue:4:="FR"
End if 
[Enum:27]Valeur_Enum:1:=(New object:C1471("Valeur"; $acidite))
SAVE RECORD:C53([Enum:27])
UNLOAD RECORD:C212([Enum:27])

/********** * **** TANNINS **** * **********/
C_COLLECTION:C1488($tannins)
$tannins:=New collection:C1472
$tannins.push(New object:C1471("Libelle"; "faibles"))
$tannins.push(New object:C1471("Libelle"; "moyens (-)"))
$tannins.push(New object:C1471("Libelle"; "moyens"))
$tannins.push(New object:C1471("Libelle"; "moyens (+)"))
$tannins.push(New object:C1471("Libelle"; "puissants"))
READ WRITE:C146([Enum:27])
QUERY:C277([Enum:27]; [Enum:27]titre:3="Tannins"; *)
QUERY:C277([Enum:27];  & ; [Enum:27]langue:4="FR")
If (Records in selection:C76([Enum:27])=0)
	CREATE RECORD:C68([Enum:27])
	[Enum:27]titre:3:="Tannins"
	[Enum:27]langue:4:="FR"
End if 
[Enum:27]Valeur_Enum:1:=(New object:C1471("Valeur"; $tannins))
SAVE RECORD:C53([Enum:27])
UNLOAD RECORD:C212([Enum:27])

/********** * **** ALCOOL **** * **********/
C_COLLECTION:C1488($alcool)
$alcool:=New collection:C1472
$alcool.push(New object:C1471("Libelle"; "faible"))
$alcool.push(New object:C1471("Libelle"; "moyen"))
$alcool.push(New object:C1471("Libelle"; "fort"))
READ WRITE:C146([Enum:27])
QUERY:C277([Enum:27]; [Enum:27]titre:3="Alcool"; *)
QUERY:C277([Enum:27];  & ; [Enum:27]langue:4="FR")
If (Records in selection:C76([Enum:27])=0)
	CREATE RECORD:C68([Enum:27])
	[Enum:27]titre:3:="Alcool"
	[Enum:27]langue:4:="FR"
End if 
[Enum:27]Valeur_Enum:1:=(New object:C1471("Valeur"; $alcool))
SAVE RECORD:C53([Enum:27])
UNLOAD RECORD:C212([Enum:27])


/********** * **** CORPS **** * **********/
C_COLLECTION:C1488($corps)
$corps:=New collection:C1472
$corps.push(New object:C1471("Libelle"; "léger"))
$corps.push(New object:C1471("Libelle"; "moyen (-)"))
$corps.push(New object:C1471("Libelle"; "moyen"))
$corps.push(New object:C1471("Libelle"; "moyen (+)"))
$corps.push(New object:C1471("Libelle"; "charpenté"))
READ WRITE:C146([Enum:27])
QUERY:C277([Enum:27]; [Enum:27]titre:3="Corps"; *)
QUERY:C277([Enum:27];  & ; [Enum:27]langue:4="FR")
If (Records in selection:C76([Enum:27])=0)
	CREATE RECORD:C68([Enum:27])
	[Enum:27]titre:3:="Corps"
	[Enum:27]langue:4:="FR"
End if 
[Enum:27]Valeur_Enum:1:=(New object:C1471("Valeur"; $corps))
SAVE RECORD:C53([Enum:27])
UNLOAD RECORD:C212([Enum:27])


/********** * **** INTENSITÉ DES SAVEURS**** * **********/
C_COLLECTION:C1488($intensiteSaveur)
$intensiteSaveur:=New collection:C1472
$intensiteSaveur.push(New object:C1471("Libelle"; "légère"))
$intensiteSaveur.push(New object:C1471("Libelle"; "moyenne (-)"))
$intensiteSaveur.push(New object:C1471("Libelle"; "moyenne"))
$intensiteSaveur.push(New object:C1471("Libelle"; "moyenne (+)"))
$intensiteSaveur.push(New object:C1471("Libelle"; "prononcée"))
READ WRITE:C146([Enum:27])
QUERY:C277([Enum:27]; [Enum:27]titre:3="Intensité des saveurs"; *)
QUERY:C277([Enum:27];  & ; [Enum:27]langue:4="FR")
If (Records in selection:C76([Enum:27])=0)
	CREATE RECORD:C68([Enum:27])
	[Enum:27]titre:3:="Intensité des saveurs"
	[Enum:27]langue:4:="FR"
End if 
[Enum:27]Valeur_Enum:1:=(New object:C1471("Valeur"; $intensiteSaveur))
SAVE RECORD:C53([Enum:27])
UNLOAD RECORD:C212([Enum:27])

/********** * **** SAVEUR PRIMAIRE **** * **********/
C_COLLECTION:C1488($saveurPrimaire)
$saveurPrimaire:=New collection:C1472
$saveurPrimaire.push(New object:C1471("Libelle"; "délicates - intenses"))
$saveurPrimaire.push(New object:C1471("Libelle"; "simples - complexes"))
$saveurPrimaire.push(New object:C1471("Libelle"; "fraiches - cuites"))
$saveurPrimaire.push(New object:C1471("Libelle"; "pas assez mûres - mûres - trop mûre"))
READ WRITE:C146([Enum:27])
QUERY:C277([Enum:27]; [Enum:27]titre:3="Saveurs primaires"; *)
QUERY:C277([Enum:27];  & ; [Enum:27]langue:4="FR")
If (Records in selection:C76([Enum:27])=0)
	CREATE RECORD:C68([Enum:27])
	[Enum:27]titre:3:="Saveurs primaires"
	[Enum:27]langue:4:="FR"
End if 
[Enum:27]Valeur_Enum:1:=(New object:C1471("Valeur"; $saveurPrimaire))
SAVE RECORD:C53([Enum:27])
UNLOAD RECORD:C212([Enum:27])

/********** * **** TEXTURES **** * **********/
C_COLLECTION:C1488($texture)
$texture:=New collection:C1472
$texture.push(New object:C1471("Libelle"; "vive"))
$texture.push(New object:C1471("Libelle"; "brillante"))
$texture.push(New object:C1471("Libelle"; "lisse"))
$texture.push(New object:C1471("Libelle"; "crémeurse"))
$texture.push(New object:C1471("Libelle"; "soyeuse"))
$texture.push(New object:C1471("Libelle"; "grasse"))
$texture.push(New object:C1471("Libelle"; "granuleuse"))
$texture.push(New object:C1471("Libelle"; "lourde"))
$texture.push(New object:C1471("Libelle"; "austère"))
READ WRITE:C146([Enum:27])
QUERY:C277([Enum:27]; [Enum:27]titre:3="Textures"; *)
QUERY:C277([Enum:27];  & ; [Enum:27]langue:4="FR")
If (Records in selection:C76([Enum:27])=0)
	CREATE RECORD:C68([Enum:27])
	[Enum:27]titre:3:="Textures"
	[Enum:27]langue:4:="FR"
End if 
[Enum:27]Valeur_Enum:1:=(New object:C1471("Valeur"; $texture))
SAVE RECORD:C53([Enum:27])
UNLOAD RECORD:C212([Enum:27])


/********** * **** FINALE **** * **********/
C_COLLECTION:C1488($finale)
$finale:=New collection:C1472
$finale.push(New object:C1471("Libelle"; "courte"))
$finale.push(New object:C1471("Libelle"; "moyenne (-)"))
$finale.push(New object:C1471("Libelle"; "moyenne"))
$finale.push(New object:C1471("Libelle"; "moyenne (+)"))
$finale.push(New object:C1471("Libelle"; "longue"))
READ WRITE:C146([Enum:27])
QUERY:C277([Enum:27]; [Enum:27]titre:3="Finale"; *)
QUERY:C277([Enum:27];  & ; [Enum:27]langue:4="FR")
If (Records in selection:C76([Enum:27])=0)
	CREATE RECORD:C68([Enum:27])
	[Enum:27]titre:3:="Finale"
	[Enum:27]langue:4:="FR"
End if 
[Enum:27]Valeur_Enum:1:=(New object:C1471("Valeur"; $finale))
SAVE RECORD:C53([Enum:27])
UNLOAD RECORD:C212([Enum:27])

/********** * **** NEZ AROME **** * **********/
/*
C_OBJET($aromes)
$aromes:=Créer objet
$aromes["Primaires"]:=Créer objet
$aromes["Secondaires"]:=Créer objet
$aromes["Tertiaires"]:=Créer objet

// ------------------
// PRIMAIRES
// ------------------
C_COLLECTION($primaires)
$primaires:=Créer collection
$primaires.push(Créer objet("categorie"; "Floral"; "libelle"; Créer collection("acacia"; "chèvrefeuille"; "camomille"; "sureau"; "géranium"; "fleurs"; "rose"; "violette")))
$primaires.push(Créer objet("categorie"; "Fruits verts"; "libelle"; Créer collection("pomme"; "groseille à maquereau"; "poire"; "bonbon anglais"; "coing"; "raisin")))
$primaires.push(Créer objet("categorie"; "Agrumes"; "libelle"; Créer collection("pamplemousse"; "citron"; "citron vert"; "écorce d’orange"; "écorce de citron")))
$primaires.push(Créer objet("categorie"; "Fruits à noyau"; "libelle"; Créer collection("pêche"; "abricot"; "nectarine")))
$primaires.push(Créer objet("categorie"; "Fruits exotiques"; "libelle"; Créer collection("banane"; "litchi"; "mangue"; "melon"; "fruit de la passion"; "ananas")))
$primaires.push(Créer objet("categorie"; "Fruits rouges"; "libelle"; Créer collection("groseille"; "airelle"; "framboise"; "fraise"; "cerise"; "prune rouge")))
$primaires.push(Créer objet("categorie"; "Fruits noirs"; "libelle"; Créer collection("cassis"; "mûre"; "fruits des bois"; "myrtille"; "cerise noire"; "prune bleue")))
$primaires.push(Créer objet("categorie"; "Fruits séchés/cuits"; "libelle"; Créer collection("figue"; "pruneau"; "raisins secs"; "raisins de Corinthe"; "kirsch"; "confiture"; "fruits cuits au four"; "en compote"; "en conserve")))
$primaires.push(Créer objet("categorie"; "Végétal"; "libelle"; Créer collection("poivron vert"; "herbe coupée"; "feuilles de tomate"; "asperge"; "feuilles de cassis")))
$primaires.push(Créer objet("categorie"; "Herbes"; "libelle"; Créer collection("eucalyptus"; "menthe"; "plantes médicinales"; "lavande"; "fenouil"; "aneth")))
$primaires.push(Créer objet("categorie"; "Épices fortes"; "libelle"; Créer collection("poivre blanc/noir"; "réglisse")))
$primaires.push(Créer objet("categorie"; "Autres"; "libelle"; Créer collection("silex"; "pierres mouillées"; "laine mouillée")))
$aromes["Primaires"]["Categories"]:=$primaires
// ------------------
// SECONDAIRES
// ------------------
C_COLLECTION($secondaires)
$secondaires:=Créer collection
$secondaires.push(Créer objet("categorie"; "Levures"; "libelle"; Créer collection("biscuit"; "pain"; "pain grillé"; "pâtisserie"; "brioche"; "pâte à pain"; "fromage")))
$secondaires.push(Créer objet("categorie"; "FML (fermentation malolactique)"; "libelle"; Créer collection("beurre"; "fromage"; "crème")))
$secondaires.push(Créer objet("categorie"; "Chêne"; "libelle"; Créer collection("vanille"; "clou de girofle"; "noix de muscade"; "noix de coco"; "caramel au beurre salé"; "pain grillé"; "cèdre"; "bois brûlé"; "fumée"; "chocolat"; "café"; "résine")))
$aromes["Secondaires"]["Categories"]:=$secondaires
// ------------------
// TERTIAIRES
// ------------------
C_COLLECTION($tertiaires)
$tertiaires:=Créer collection
$tertiaires.push(Créer objet("categorie"; "Oxydation délibérée"; "libelle"; Créer collection("amande"; "pâte d’amande"; "noisette"; "noix"; "chocolat"; "café"; "bonbon au caramel"; "caramel")))
$tertiaires.push(Créer objet("categorie"; "Évolution des notes fruitées (blanc)"; "libelle"; Créer collection("abricot sec"; "marmelade"; "pomme séchée"; "banane séchée")))
$tertiaires.push(Créer objet("categorie"; "Évolution des notes fruitées (rouge)"; "libelle"; Créer collection("figue"; "pruneau"; "goudron"; "mûre séchée"; "mûre cuite"; "prune rouge cuite")))
$tertiaires.push(Créer objet("categorie"; "Vieillissement en bouteille (blanc)"; "libelle"; Créer collection("essence"; "kérosène"; "cannelle"; "gingembre"; "noix de muscade"; "pain grillé"; "fruits secs"; "champignon"; "foin"; "miel")))
$tertiaires.push(Créer objet("categorie"; "Vieillissement en bouteille (rouge)"; "libelle"; Créer collection("cuir"; "sous-bois"; "terre"; "champignon"; "gibier"; "tabac"; "végétal"; "feuilles mouillées"; "viande"; "basse-cour")))
$aromes["Tertiaires"]["Categories"]:=$tertiaires

LECTURE ÉCRITURE([Enum])
CHERCHER([Enum]; [Enum]titre="Nez arômes"; *)
CHERCHER([Enum];  & ; [Enum]langue="FR")
Si (Enregistrements trouvés([Enum])=0)
CRÉER ENREGISTREMENT([Enum])
[Enum]titre:="Nez arômes"
[Enum]langue:="FR"
Fin de si 
[Enum]Valeur_Enum:=(Créer objet("Valeur"; $aromes))
STOCKER ENREGISTREMENT([Enum])
LIBÉRER ENREGISTREMENT([Enum])
*/