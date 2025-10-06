Case of 
	: (Form event code:C388=Sur affichage corps:K2:22)
		V_Conv:=Replace string:C233([Degustation:12]Convives:3; Char:C90(13); " / "; 99)
		V_Plat:=Replace string:C233([Degustation:12]Plats:5; Char:C90(13); " / "; 99)
		
End case 