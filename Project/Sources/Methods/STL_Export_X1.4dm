//%attributes = {}


// ----------------------------------------------------
// Nom utilisateur (OS) : seb
// Date et heure : 03/02/11, 20:39:55
// ----------------------------------------------------
// Méthode : STL_Export_X1
// Description
// 
//
// Paramètres
// ----------------------------------------------------


USE CHARACTER SET:C205("utf-8"; 0)
$langueNum:=$1
C_TEXT:C284($entete)
C_LONGINT:C283($langueNum)
$entete:=""
C_TIME:C306($xref; $2)
$xref:=$2
C_POINTER:C301($pchamp)

Case of 
	: ($langueNum=1)  //francais
		$pchamp:=->[Termes:22]Termes_Langue1:10
		$StringLang:="19660"
	: ($langueNum=2)  //Danois
		$pchamp:=->[Termes:22]Termes_Langue2:11
		$StringLang:="22000"
	: ($langueNum=3)  //Anglais
		$pchamp:=->[Termes:22]Termes_Langue3:12
		$StringLang:="24000"
	: ($langueNum=4)  //Espagnol
		$pchamp:=->[Termes:22]Termes_Langue4:13
		$StringLang:="26000"
	: ($langueNum=5)  //Allemand
		$pchamp:=->[Termes:22]Termes_Langue5:14
		$StringLang:="28000"
End case 
//francais


$entete:=$entete+"<group resname=\"STR# "+$StringLang+"\" id=\""+$StringLang+"\">"+Char:C90(13)+Char:C90(10)
SEND PACKET:C103($xref; $entete)
QUERY:C277([Termes:22]; [Termes:22]Categorie:9=1)
ORDER BY:C49([Termes:22]; [Termes:22]Valeur_Numerique:8; >)
FIRST RECORD:C50([Termes:22])
While (Not:C34(End selection:C36([Termes:22])))
	$entete:="<trans-unit id=\""+String:C10([Termes:22]Valeur_Numerique:8)+"\" resname=\""+Util_XML_texte_Encode($pchamp->)+"\" translate=\"no\">"+Char:C90(13)+Char:C90(10)
	$entete:=$entete+"<source>"+Util_XML_texte_Encode($pchamp->)+"</source>"+Char:C90(13)+Char:C90(10)
	$entete:=$entete+"</trans-unit>"+Char:C90(13)+Char:C90(10)
	SEND PACKET:C103($xref; $entete)
	NEXT RECORD:C51([Termes:22])
End while 

$entete:="</group>"+Char:C90(13)+Char:C90(10)

SEND PACKET:C103($xref; $entete)