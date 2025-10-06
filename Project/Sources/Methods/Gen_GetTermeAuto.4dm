//%attributes = {}
//permettra lors de l'import la création automatique
//$1 contient le numero de famille de terme
//$2 contient la valeur recherché
//$0 contient lid de la fiche

C_LONGINT:C283($1)
_O_C_STRING:C293(255; $2)
C_LONGINT:C283($3; $Langue)
If (Count parameters:C259<3)
	$Langue:=2  //francais
Else 
	$Langue:=$3
End if 
QUERY:C277([Termes:22]; [Termes:22]Categorie:9=$1; *)
If ($Langue=2)  //francais
	QUERY:C277([Termes:22];  & [Termes:22]Termes_Langue1:10=$2)
Else 
	QUERY:C277([Termes:22];  & [Termes:22]Termes_Langue2:11=$2)  //anglais
End if 
REDUCE SELECTION:C351([Termes:22]; 1)
If (Records in selection:C76([Termes:22])=1)
	$0:=[Termes:22]ID_Termes:1
Else 
	CREATE RECORD:C68([Termes:22])
	Gen_NumerAuto(->[Termes:22])
	[Termes:22]Categorie:9:=$1
	If ($Langue=2)  //francais
		[Termes:22]Termes_Langue1:10:=$2
	Else 
		[Termes:22]Termes_Langue2:11:=$2
	End if 
	Gen_StampFiche(->[Termes:22])
	SAVE RECORD:C53([Termes:22])
	$0:=[Termes:22]ID_Termes:1
	UNLOAD RECORD:C212([Termes:22])
End if 