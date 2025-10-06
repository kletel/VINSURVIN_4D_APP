//%attributes = {}
_O_ARRAY STRING:C218(31; Struct; 100)
ARRAY INTEGER:C220(StructNum; 100)
// Traduction de la table Interface
DELETE FROM ARRAY:C228(Struct; 1; Size of array:C274(Struct))
DELETE FROM ARRAY:C228(StructNum; 1; Size of array:C274(StructNum))
INSERT IN ARRAY:C227(Struct; 1; 5)
INSERT IN ARRAY:C227(StructNum; 1; 5)
Struct{1}:="Rubrique1"
Struct{2}:="Serie"
Struct{3}:="Nb_Util"
Struct{4}:="Texte_OK_"
Struct{5}:="Image_OK"

StructNum{1}:=1
StructNum{2}:=2
StructNum{3}:=3
StructNum{4}:=4
StructNum{5}:=5

Restructuration_Tableau_Traduc
SET FIELD TITLES:C602([Interface:1]; Struct; StructNum)

// Traduction de la table Cave
DELETE FROM ARRAY:C228(Struct; 1; Size of array:C274(Struct))
DELETE FROM ARRAY:C228(StructNum; 1; Size of array:C274(StructNum))
INSERT IN ARRAY:C227(Struct; 1; 47)
INSERT IN ARRAY:C227(StructNum; 1; 47)
Struct{1}:="Name"
Struct{2}:="Appellation"
Struct{3}:="Producer"
Struct{4}:="Type of wine"
Struct{5}:="Region"
Struct{6}:="Vintage"
Struct{7}:="Number of bottles"
Struct{8}:="Number of drunk bottles"
Struct{9}:="Minimum apogee"
Struct{10}:="Date of purchase"
Struct{11}:="Place of purchase"
Struct{12}:="Place of bottling"
Struct{13}:="Bottle type"
Struct{14}:="Maturing in"
Struct{15}:="Notes"
Struct{16}:="Purchase price"
Struct{17}:="Value"
Struct{18}:="Tasting"
Struct{19}:="Remaining bottles in cellar"
Struct{20}:="Purchase price"
Struct{21}:="Total val remaining bottles"
Struct{22}:="Total value (Fr)"
Struct{23}:="Estimated value"
Struct{24}:="Country"
Struct{25}:="Label"
Struct{26}:="Reference of cellar"
Struct{27}:="Reference of country"
Struct{28}:="Reference of region"
Struct{29}:="Maximum apogee"
Struct{30}:="Temperature"
Struct{31}:="Alcohol"
Struct{32}:="Wine rack"
Struct{33}:="Reference of producer"
Struct{34}:="Variety of vine"
Struct{35}:="Remarks"
Struct{36}:="Sight"
Struct{37}:="Nose / smell"
Struct{38}:="Taste"
Struct{39}:="Global"
Struct{40}:="Cellar"
Struct{41}:="Sudden impulse"
Struct{42}:="Surplus value (Fr)"
Struct{43}:="Surplus value (€)"
Struct{44}:="Has to be ordered ?"
Struct{42}:="Map"
Struct{43}:="Winecase"
Struct{44}:="Row"

StructNum{1}:=1
StructNum{2}:=2
StructNum{3}:=3
StructNum{4}:=4
StructNum{5}:=5
StructNum{6}:=6
StructNum{7}:=7
StructNum{8}:=8
StructNum{9}:=9
StructNum{10}:=10
StructNum{11}:=11
StructNum{12}:=12
StructNum{13}:=13
StructNum{14}:=14
StructNum{15}:=15
StructNum{16}:=16
StructNum{17}:=17
StructNum{18}:=18
StructNum{19}:=19
StructNum{20}:=20
StructNum{21}:=21
StructNum{22}:=22
StructNum{23}:=23
StructNum{24}:=24
StructNum{25}:=25
StructNum{26}:=26
StructNum{27}:=27
StructNum{28}:=28
StructNum{29}:=29
StructNum{30}:=30
StructNum{31}:=31
StructNum{32}:=32
StructNum{33}:=33
StructNum{34}:=34
StructNum{35}:=35
StructNum{36}:=36
StructNum{37}:=37
StructNum{38}:=38
StructNum{39}:=39
StructNum{40}:=40
StructNum{41}:=41
StructNum{42}:=42
StructNum{43}:=43
StructNum{44}:=44
StructNum{45}:=45
StructNum{46}:=46
StructNum{47}:=47

Restructuration_Tableau_Traduc
SET FIELD TITLES:C602([Cave:2]; Struct; StructNum)

// Traduction de la table Appellation
DELETE FROM ARRAY:C228(Struct; 1; Size of array:C274(Struct))
DELETE FROM ARRAY:C228(StructNum; 1; Size of array:C274(StructNum))
INSERT IN ARRAY:C227(Struct; 1; 9)
INSERT IN ARRAY:C227(StructNum; 1; 9)
Struct{1}:="Appellation"
Struct{2}:="Région"
Struct{3}:="Pays"
Struct{4}:="Commune"
Struct{5}:="Region détaillée"
Struct{6}:="Ref_Pays"
Struct{7}:="Ref_Region"
Struct{8}:="Association"
Struct{9}:="Nb"

StructNum{1}:=1
StructNum{2}:=2
StructNum{3}:=3
StructNum{4}:=4
StructNum{5}:=5
StructNum{6}:=6
StructNum{7}:=7
StructNum{8}:=8
StructNum{9}:=9

Restructuration_Tableau_Traduc
SET FIELD TITLES:C602([Appellation:3]; Struct; StructNum)

// Traduction de la table Millésimes
DELETE FROM ARRAY:C228(Struct; 1; Size of array:C274(Struct))
DELETE FROM ARRAY:C228(StructNum; 1; Size of array:C274(StructNum))
INSERT IN ARRAY:C227(Struct; 1; 12)
INSERT IN ARRAY:C227(StructNum; 1; 12)
Struct{1}:="Année"
Struct{2}:="Bordeau Rouge"
Struct{3}:="Bordeau Blanc Liquoreux"
Struct{4}:="Bordeau Blanc Sec"
Struct{5}:="Bourgogne Rouge"
Struct{6}:="Bourgogne Blanc"
Struct{7}:="Champagne"
Struct{8}:="Loire"
Struct{9}:="Rhône"
Struct{10}:="Alsace"
Struct{11}:="Pays"
Struct{12}:="Ref_Pays"

StructNum{1}:=1
StructNum{2}:=2
StructNum{3}:=3
StructNum{4}:=4
StructNum{5}:=5
StructNum{6}:=6
StructNum{7}:=7
StructNum{8}:=8
StructNum{9}:=9
StructNum{10}:=10
StructNum{11}:=11
StructNum{12}:=12

Restructuration_Tableau_Traduc
SET FIELD TITLES:C602([Millésimes:4]; Struct; StructNum)

// Traduction de la table Vocabulaire
DELETE FROM ARRAY:C228(Struct; 1; Size of array:C274(Struct))
DELETE FROM ARRAY:C228(StructNum; 1; Size of array:C274(StructNum))
INSERT IN ARRAY:C227(Struct; 1; 11)
INSERT IN ARRAY:C227(StructNum; 1; 11)
Struct{1}:="Nom"
Struct{2}:="Texte"
Struct{3}:="TexteDA"
Struct{4}:="TexteAng"
Struct{5}:="TexteEsp"
Struct{6}:="TexteALL"
Struct{7}:="Nom_Fr"
Struct{8}:="Nom_Da"
Struct{9}:="Nom_Ang"
Struct{10}:="Nom_Esp"
Struct{11}:="Nom_All"

StructNum{1}:=1
StructNum{2}:=2
StructNum{3}:=3
StructNum{4}:=4
StructNum{5}:=5
StructNum{6}:=6
StructNum{7}:=7
StructNum{8}:=8
StructNum{9}:=9
StructNum{10}:=10
StructNum{11}:=11

Restructuration_Tableau_Traduc
SET FIELD TITLES:C602([Vocabulaire:5]; Struct; StructNum)

// Traduction de la table Cépages
DELETE FROM ARRAY:C228(Struct; 1; Size of array:C274(Struct))
DELETE FROM ARRAY:C228(StructNum; 1; Size of array:C274(StructNum))
INSERT IN ARRAY:C227(Struct; 1; 9)
INSERT IN ARRAY:C227(StructNum; 1; 9)
Struct{1}:="Vin"
Struct{2}:="Cépage"
Struct{3}:="Texte"
Struct{4}:="Texte_OK_"
Struct{5}:="TexteDA"
Struct{6}:="Texte_Ang"
Struct{7}:="Texte_Esp"
Struct{8}:="Texte_All"
Struct{9}:="Langue"

StructNum{1}:=1
StructNum{2}:=2
StructNum{3}:=3
StructNum{4}:=4
StructNum{5}:=5
StructNum{6}:=6
StructNum{7}:=7
StructNum{8}:=8
StructNum{9}:=9

Restructuration_Tableau_Traduc
SET FIELD TITLES:C602([Cépages:6]; Struct; StructNum)

// Traduction de la table Association
DELETE FROM ARRAY:C228(Struct; 1; Size of array:C274(Struct))
DELETE FROM ARRAY:C228(StructNum; 1; Size of array:C274(StructNum))
INSERT IN ARRAY:C227(Struct; 1; 5)
INSERT IN ARRAY:C227(StructNum; 1; 5)
Struct{1}:="Catégorie"
Struct{2}:="Sous Catégorie"
Struct{3}:="Met"
Struct{4}:="Vin"
Struct{5}:="Langue"

StructNum{1}:=1
StructNum{2}:=2
StructNum{3}:=3
StructNum{4}:=4
StructNum{5}:=5

Restructuration_Tableau_Traduc
SET FIELD TITLES:C602([Association:7]; Struct; StructNum)

// Traduction de la table Pays
DELETE FROM ARRAY:C228(Struct; 1; Size of array:C274(Struct))
DELETE FROM ARRAY:C228(StructNum; 1; Size of array:C274(StructNum))
INSERT IN ARRAY:C227(Struct; 1; 14)
INSERT IN ARRAY:C227(StructNum; 1; 14)
Struct{1}:="Ref_Pays"
Struct{2}:="Carte"
Struct{3}:="Nom_Fr"
Struct{4}:="Nom_Eng"
Struct{5}:="Nom_Espa"
Struct{6}:="Nom_Deuch"
Struct{7}:="Nom_Jap"
Struct{8}:="Nom_Danois"
Struct{9}:="Nb_Bouteilles"
Struct{10}:="Nb_Vins"
Struct{11}:="Carte_Dk"
Struct{12}:="Carte_En"
Struct{13}:="Carte_Es"
Struct{14}:="Carte_All"

StructNum{1}:=1
StructNum{2}:=2
StructNum{3}:=3
StructNum{4}:=4
StructNum{5}:=5
StructNum{6}:=6
StructNum{7}:=7
StructNum{8}:=8
StructNum{9}:=9
StructNum{10}:=10
StructNum{11}:=11
StructNum{12}:=12
StructNum{13}:=13
StructNum{14}:=14

Restructuration_Tableau_Traduc
SET FIELD TITLES:C602([Pays:8]; Struct; StructNum)

// Traduction de la table Region
DELETE FROM ARRAY:C228(Struct; 1; Size of array:C274(Struct))
DELETE FROM ARRAY:C228(StructNum; 1; Size of array:C274(StructNum))
INSERT IN ARRAY:C227(Struct; 1; 10)
INSERT IN ARRAY:C227(StructNum; 1; 10)
Struct{1}:="Ref_Region"
Struct{2}:="Nom_Fr"
Struct{3}:="Nom_Eng"
Struct{4}:="Nom_Espa"
Struct{5}:="Nom_Deuch"
Struct{6}:="Nom_Jap"
Struct{7}:="Nom_Danois"
Struct{8}:="Nb_Bouteilles"
Struct{9}:="Nb_Vins"
Struct{10}:="Ref_Pays"

StructNum{1}:=1
StructNum{2}:=2
StructNum{3}:=3
StructNum{4}:=4
StructNum{5}:=5
StructNum{6}:=6
StructNum{7}:=7
StructNum{8}:=8
StructNum{9}:=9
StructNum{10}:=10

Restructuration_Tableau_Traduc
SET FIELD TITLES:C602([Region:9]; Struct; StructNum)

// Traduction de la table Informations
DELETE FROM ARRAY:C228(Struct; 1; Size of array:C274(Struct))
DELETE FROM ARRAY:C228(StructNum; 1; Size of array:C274(StructNum))
INSERT IN ARRAY:C227(Struct; 1; 27)
INSERT IN ARRAY:C227(StructNum; 1; 27)
Struct{1}:="Rubrique"
Struct{2}:="Sous_Rubrique"
Struct{3}:="Ref_Fiche"
Struct{4}:="Texte_Info_Fr_"
Struct{5}:="Titre_Info_Fr"
Struct{6}:="Texte_Info_DA_"
Struct{7}:="verif"
Struct{8}:="RubriqueDA"
Struct{9}:="RubriqueEN"
Struct{10}:="RubriqueES"
Struct{11}:="RubriqueAL"
Struct{12}:="Sous_RubriqueDA"
Struct{13}:="Sous_RubriqueEN"
Struct{14}:="Sous_RubriqueES"
Struct{15}:="Sous_RubriqueAL"
Struct{16}:="Titre_InfoDA"
Struct{17}:="Titre_InfoEN"
Struct{18}:="Titre_InfoES"
Struct{19}:="Titre_InfoAL"
Struct{20}:="Texte_Info_EN_"
Struct{21}:="Texte_Info_ES_"
Struct{22}:="Texte_Info_AL_"
Struct{23}:="Actif_FR"
Struct{24}:="Actif_DA"
Struct{25}:="Actif_En"
Struct{26}:="Actif_Es"
Struct{27}:="Actif_AL"

StructNum{1}:=1
StructNum{2}:=2
StructNum{3}:=3
StructNum{4}:=4
StructNum{5}:=5
StructNum{6}:=6
StructNum{7}:=7
StructNum{8}:=8
StructNum{9}:=9
StructNum{10}:=10
StructNum{11}:=11
StructNum{12}:=12
StructNum{13}:=13
StructNum{14}:=14
StructNum{15}:=15
StructNum{16}:=16
StructNum{17}:=17
StructNum{18}:=18
StructNum{19}:=19
StructNum{20}:=20
StructNum{21}:=21
StructNum{22}:=22
StructNum{23}:=23
StructNum{24}:=24
StructNum{25}:=25
StructNum{26}:=26
StructNum{27}:=27

Restructuration_Tableau_Traduc
SET FIELD TITLES:C602([Informations:10]; Struct; StructNum)

// Traduction de la table Textes
DELETE FROM ARRAY:C228(Struct; 1; Size of array:C274(Struct))
DELETE FROM ARRAY:C228(StructNum; 1; Size of array:C274(StructNum))
INSERT IN ARRAY:C227(Struct; 1; 7)
INSERT IN ARRAY:C227(StructNum; 1; 7)
Struct{1}:="Type_Enumération"
Struct{2}:="Positions"
Struct{3}:="Texte_Fr"
Struct{4}:="Texte_Danois"
Struct{5}:="Texte_Ang"
Struct{6}:="Texte_Espagnol"
Struct{7}:="Texte_Allemand"

StructNum{1}:=1
StructNum{2}:=2
StructNum{3}:=3
StructNum{4}:=4
StructNum{5}:=5
StructNum{6}:=6
StructNum{7}:=7

Restructuration_Tableau_Traduc
SET FIELD TITLES:C602([Textes:11]; Struct; StructNum)

// Traduction de la table Degustation
DELETE FROM ARRAY:C228(Struct; 1; Size of array:C274(Struct))
DELETE FROM ARRAY:C228(StructNum; 1; Size of array:C274(StructNum))
INSERT IN ARRAY:C227(Struct; 1; 8)
INSERT IN ARRAY:C227(StructNum; 1; 8)
Struct{1}:="Tasting reference"
Struct{2}:="Date of tasting"
Struct{3}:="Guests"
Struct{4}:="Occasion"
Struct{5}:="Dishes"
Struct{6}:="Remarks"
Struct{7}:="Cellar reference"
Struct{8}:="Number of bottles"

StructNum{1}:=1
StructNum{2}:=2
StructNum{3}:=3
StructNum{4}:=4
StructNum{5}:=5
StructNum{6}:=6
StructNum{7}:=7
StructNum{8}:=8

Restructuration_Tableau_Traduc
SET FIELD TITLES:C602([Degustation:12]; Struct; StructNum)

// Traduction de la table Producteur
DELETE FROM ARRAY:C228(Struct; 1; Size of array:C274(Struct))
DELETE FROM ARRAY:C228(StructNum; 1; Size of array:C274(StructNum))
INSERT IN ARRAY:C227(Struct; 1; 14)
INSERT IN ARRAY:C227(StructNum; 1; 14)
Struct{1}:="Producer reference"
Struct{2}:="Company"
Struct{3}:="Name"
Struct{4}:="First name"
Struct{5}:="Address"
Struct{6}:="ZIP code"
Struct{7}:="City"
Struct{8}:="Country"
Struct{9}:="Tel"
Struct{10}:="Fax"
Struct{11}:="Cell phone number"
Struct{12}:="Mail"
Struct{13}:="Website"
Struct{14}:="Remarks"

StructNum{1}:=1
StructNum{2}:=2
StructNum{3}:=3
StructNum{4}:=4
StructNum{5}:=5
StructNum{6}:=6
StructNum{7}:=7
StructNum{8}:=8
StructNum{9}:=9
StructNum{10}:=10
StructNum{11}:=11
StructNum{12}:=12
StructNum{13}:=13
StructNum{14}:=14

Restructuration_Tableau_Traduc
SET FIELD TITLES:C602([Producteur:13]; Struct; StructNum)

// Traduction de la table Titre_Millesime
DELETE FROM ARRAY:C228(Struct; 1; Size of array:C274(Struct))
DELETE FROM ARRAY:C228(StructNum; 1; Size of array:C274(StructNum))
INSERT IN ARRAY:C227(Struct; 1; 13)
INSERT IN ARRAY:C227(StructNum; 1; 13)
Struct{1}:="Pays"
Struct{2}:="Ref_Pays"
Struct{3}:="Langue"
Struct{4}:="Titre1"
Struct{5}:="Titre2"
Struct{6}:="Titre3"
Struct{7}:="Titre4"
Struct{8}:="Titre5"
Struct{9}:="Titre6"
Struct{10}:="Titre7"
Struct{11}:="Titre8"
Struct{12}:="Titre9"
Struct{13}:="Titre10"

StructNum{1}:=1
StructNum{2}:=2
StructNum{3}:=3
StructNum{4}:=4
StructNum{5}:=5
StructNum{6}:=6
StructNum{7}:=7
StructNum{8}:=8
StructNum{9}:=9
StructNum{10}:=10
StructNum{11}:=11
StructNum{12}:=12
StructNum{13}:=13

Restructuration_Tableau_Traduc
SET FIELD TITLES:C602([Titre_Millesime:14]; Struct; StructNum)

// Traduction de la table Sites
DELETE FROM ARRAY:C228(Struct; 1; Size of array:C274(Struct))
DELETE FROM ARRAY:C228(StructNum; 1; Size of array:C274(StructNum))
INSERT IN ARRAY:C227(Struct; 1; 3)
INSERT IN ARRAY:C227(StructNum; 1; 3)
Struct{1}:="Rubric"
Struct{2}:="Website - URL"
Struct{3}:="Description"

StructNum{1}:=1
StructNum{2}:=2
StructNum{3}:=3

Restructuration_Tableau_Traduc
SET FIELD TITLES:C602([Sites:15]; Struct; StructNum)

// Traduction de la table Etiquettes
DELETE FROM ARRAY:C228(Struct; 1; Size of array:C274(Struct))
DELETE FROM ARRAY:C228(StructNum; 1; Size of array:C274(StructNum))
INSERT IN ARRAY:C227(Struct; 1; 10)
INSERT IN ARRAY:C227(StructNum; 1; 10)
Struct{1}:="Nom"
Struct{2}:="Type"
Struct{3}:="Pays"
Struct{4}:="Region"
Struct{5}:="Appellation"
Struct{6}:="Millesime"
Struct{7}:="Prix"
Struct{8}:="Appo_Min"
Struct{9}:="Appo_Max"
Struct{10}:="Casier"

StructNum{1}:=1
StructNum{2}:=2
StructNum{3}:=3
StructNum{4}:=4
StructNum{5}:=5
StructNum{6}:=6
StructNum{7}:=7
StructNum{8}:=8
StructNum{9}:=9
StructNum{10}:=10

Restructuration_Tableau_Traduc
SET FIELD TITLES:C602([Etiquettes:16]; Struct; StructNum)

// Traduction de la table Utilisateur
DELETE FROM ARRAY:C228(Struct; 1; Size of array:C274(Struct))
DELETE FROM ARRAY:C228(StructNum; 1; Size of array:C274(StructNum))
INSERT IN ARRAY:C227(Struct; 1; 13)
INSERT IN ARRAY:C227(StructNum; 1; 13)
Struct{1}:="Nom"
Struct{2}:="Prénom"
Struct{3}:="Société"
Struct{4}:="Adresse1"
Struct{5}:="Adresse2"
Struct{6}:="Adresse3"
Struct{7}:="CodePostal"
Struct{8}:="Etat"
Struct{9}:="Pays"
Struct{10}:="EMail"
Struct{11}:="Ville"
Struct{12}:="NumLicence"
Struct{13}:="CarteImprimée"

StructNum{1}:=1
StructNum{2}:=2
StructNum{3}:=3
StructNum{4}:=4
StructNum{5}:=5
StructNum{6}:=6
StructNum{7}:=7
StructNum{8}:=8
StructNum{9}:=9
StructNum{10}:=10
StructNum{11}:=11
StructNum{12}:=12
StructNum{13}:=13

Restructuration_Tableau_Traduc
SET FIELD TITLES:C602([Utilisateur:17]; Struct; StructNum)

// Traduction des nom de table 
DELETE FROM ARRAY:C228(Struct; 1; Size of array:C274(Struct))
DELETE FROM ARRAY:C228(StructNum; 1; Size of array:C274(StructNum))
INSERT IN ARRAY:C227(Struct; 1; 17)
INSERT IN ARRAY:C227(StructNum; 1; 17)
Struct{1}:="Interface"
Struct{2}:="Wine Cellar"
Struct{3}:="Appellation"
Struct{4}:="Millésimes"
Struct{5}:="Vocabulaire"
Struct{6}:="Cépages"
Struct{7}:="Association"
Struct{8}:="Pays"
Struct{9}:="Region"
Struct{10}:="Informations"
Struct{11}:="Textes"
Struct{12}:="Tasting"
Struct{13}:="Producer"
Struct{14}:="Titre_Millesime"
Struct{15}:="Website"
Struct{16}:="Etiquettes"
Struct{17}:="Utilisateur"

StructNum{1}:=1
StructNum{2}:=2
StructNum{3}:=3
StructNum{4}:=4
StructNum{5}:=5
StructNum{6}:=6
StructNum{7}:=7
StructNum{8}:=8
StructNum{9}:=9
StructNum{10}:=10
StructNum{11}:=11
StructNum{12}:=12
StructNum{13}:=13
StructNum{14}:=14
StructNum{15}:=15
StructNum{16}:=16
StructNum{17}:=17

Restructuration_Tableau_Traduc
SET TABLE TITLES:C601(Struct; StructNum)
