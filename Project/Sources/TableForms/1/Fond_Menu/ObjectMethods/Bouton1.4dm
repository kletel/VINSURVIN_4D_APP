If (Macintosh control down:C544) | (Windows Ctrl down:C562)
	If (Macintosh option down:C545) | (Windows Alt down:C563)
		$ref:=Pop up menu:C542("Suppression des n° de serie")
		If ($ref=1)
			Sup_Serie
		End if 
	End if 
End if 
//
//Si (◊Langue=3)  `Anglais
//CHOIX VISIBLE(*;"Fr_@";Faux)
//CHOIX VISIBLE(*;"US_@";Vrai)
//Sinon 
//CHOIX VISIBLE(*;"Fr_@";Vrai)
//CHOIX VISIBLE(*;"US_@";Faux)
//Fin de si 