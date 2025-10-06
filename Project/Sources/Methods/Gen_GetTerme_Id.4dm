//%attributes = {}
// $Traduction:=Gen_GetTerme_Id($idAtraduire;$LangueVoulue)
//$0 contient la valeur texte
//$1 contient l'id du termes
//$2 contient l'id de la langue voulue


C_LONGINT:C283($1)
C_LONGINT:C283($2)
C_TEXT:C284($0)
$0:=""

QUERY:C277([Termes:22]; [Termes:22]ID_Termes:1=$1)

If (Records in selection:C76([Termes:22])=1)
	Case of 
		: ($2=1)  //
			$0:=[Termes:22]Termes_Langue1:10
		: ($2=2)  //
			$0:=[Termes:22]Termes_Langue2:11
		: ($2=3)  //
			$0:=[Termes:22]Termes_Langue3:12
		: ($2=4)  //
			$0:=[Termes:22]Termes_Langue4:13
		: ($2=5)  //
			$0:=[Termes:22]Termes_Langue5:14
		: ($2=6)  //
			$0:=[Termes:22]Termes_Langue6:15
		: ($2=7)  //
			$0:=[Termes:22]Termes_Langue7:16
		: ($2=8)  //
			$0:=[Termes:22]Termes_Langue8:17
		: ($2=9)
			$0:=[Termes:22]Termes_Langue9:18
		: ($2=10)  //
			$0:=[Termes:22]Termes_Langue10:19
	End case 
	If ($0="")
		$0:=[Termes:22]Termes_Langue1:10
	End if 
Else 
	$0:="Traduction non trouvée "+String:C10($1)
End if 