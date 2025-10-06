//%attributes = {}
//<?xml version="1.0"Encoding ="UTF-8"?>
//
//<!00/00/00!
//Translation file.
//This file is distributed under the same license as the product package.-->
//
//<!DOCTYPE xliff PUBLIC"-//XLIFF//DTD XLIFF//EN"
//"http://www.oasis-open.org/committees/xliff/documents/xliff.dtd">
//
//<xliff version="1.0">
//<file datatype="x-STR#"original="undefined"source-language="fr"target-language="fr">
//<header>
//<prop-group name="Xliff-Editor.4dbase">
//<prop prop-Type="version">10</prop>
//</prop-group>
//</header>
//      <body>

TRACE:C157
P_enlevespace

$nomFichier:="XLIFF45.xlf"

$path:=Get 4D folder:C485(Dossier Resources courant:K5:16)+"French.lproj"+<>Separateur

$test:=Test path name:C476($path+$nomFichier)

If ($test=Est un document:K24:1)
	DELETE DOCUMENT:C159($path+$nomFichier)
End if 


$qt:=Char:C90(34)
$xref:=Create document:C266($path+$nomFichier; "TEXT")
If (ok=1)
	C_TEXT:C284($entete)
	$entete:="<?xml version=\"1.0\" encoding=\"UTF-8\"?>"+Char:C90(13)+Char:C90(10)
	$entete:=$entete+Char:C90(13)+Char:C90(10)
	
	
	$entete:=$entete+"<!DOCTYPE xliff PUBLIC "+$qt+"-//XLIFF//DTD XLIFF//EN"+$qt+Char:C90(10)
	$entete:=$entete+$qt+"http://www.oasis-open.org/committees/xliff/documents/xliff.dtd"+$qt+">"+Char:C90(13)+Char:C90(10)
	
	$entete:=$entete+Char:C90(13)+Char:C90(10)
	$entete:=$entete+"<xliff version=\"1.0\">"+Char:C90(13)+Char:C90(10)
	$entete:=$entete+"<file datatype=\"x-STR#\" original=\"undefined\" source-language=\"fr\" target-language=\"fr\">"+Char:C90(13)+Char:C90(10)
	$entete:=$entete+"<header>"+Char:C90(13)+Char:C90(10)
	$entete:=$entete+"<prop-group name=\"Xliff-Editor.4dbase\">"+Char:C90(13)+Char:C90(10)
	$entete:=$entete+"<prop prop-type=\"version\">1.0</prop>"+Char:C90(13)+Char:C90(10)
	$entete:=$entete+"</prop-group>"+Char:C90(13)+Char:C90(10)
	$entete:=$entete+"</header>"+Char:C90(13)+Char:C90(10)
	$entete:=$entete+"<body>"+Char:C90(13)+Char:C90(10)
	
	USE CHARACTER SET:C205("utf-8"; 0)
	SEND PACKET:C103($xref; $entete)
	STL_Export_X1(1; $xref)
	STL_Export_X1(2; $xref)
	STL_Export_X1(3; $xref)
	//STL_Export_X1 (4;$xref)
	//STL_Export_X1 (5;$xref)
	
	$entete:="</body>"+Char:C90(13)+Char:C90(10)
	$entete:=$entete+"</file>"+Char:C90(13)+Char:C90(10)
	$entete:=$entete+"</xliff>"+Char:C90(13)+Char:C90(10)
	SEND PACKET:C103($xref; $entete)
	CLOSE DOCUMENT:C267($xref)
End if 