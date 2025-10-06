//%attributes = {}

// ----------------------------------------------------
// Nom utilisateur (OS) : seb
// Date et heure : 03/02/11, 20:47:02
// ----------------------------------------------------
// Méthode : STL_Importe
// Description
// 
//
// Paramètres
// ----------------------------------------------------



ARRAY TEXT:C222($Tab_f; 0)
ARRAY TEXT:C222($Tab_a; 0)
ARRAY TEXT:C222($Tab_I; 0)

TRACE:C157

C_TEXT:C284($varf; $textf; $vara; $texta)

//$path:="C:\\Program Files\\4D\\4D v12.1 Custom\\4D\\"
$path:=""
//$CR:=Caractere(13)+Caractere(10)  //pour windows
$CR:=Char:C90(13)  //pour mac
//$test:=Tester chemin acces($path)

//$Doc_f:=Ouvrir document($path+"Res_FRA.TXT";"TXT")
//$Doc_a:=Ouvrir document($path+"Res_ANG.TXT";"TXT")
//$Doc_I:=Ouvrir document($path+"Res_ITA.TXT";"TXT")
$Doc_f:=Open document:C264(""; "TXT")  //francais
$Doc_a:=Open document:C264(""; "TXT")  // danois
$Doc_I:=Open document:C264(""; "TXT")  //anglais

If (Ok=1)
	//UTILISER FILTRE("ISO-8859-1";1)  //sur windows
	USE CHARACTER SET:C205("UTF-8"; 1)  //sur mac
	Repeat 
		RECEIVE PACKET:C104($Doc_f; $varf; $CR)
		
		
		APPEND TO ARRAY:C911($Tab_f; $varf)
		
		RECEIVE PACKET:C104($Doc_a; $vara; $CR)
		
		APPEND TO ARRAY:C911($Tab_a; $vara)
		
		RECEIVE PACKET:C104($Doc_I; $varf; $CR)
		
		APPEND TO ARRAY:C911($Tab_I; $varf)
		
	Until (ok=0)
	
	CLOSE DOCUMENT:C267($Doc_f)
	CLOSE DOCUMENT:C267($Doc_a)
	CLOSE DOCUMENT:C267($Doc_I)
	
	For ($i; 1; Size of array:C274($Tab_f))
		CREATE RECORD:C68([Termes:22])
		Gen_NumerAuto(->[Termes:22])
		[Termes:22]Valeur_Numerique:8:=$i
		[Termes:22]Categorie:9:=1
		[Termes:22]Termes_Langue1:10:=$Tab_f{$i}
		[Termes:22]Termes_Langue2:11:=$Tab_a{$i}
		[Termes:22]Termes_Langue3:12:=$Tab_I{$i}
		
		SAVE RECORD:C53([Termes:22])
		
	End for 
	UNLOAD RECORD:C212([Termes:22])
	
End if 
