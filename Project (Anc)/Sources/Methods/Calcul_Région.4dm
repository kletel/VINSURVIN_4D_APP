//%attributes = {}
FIRST RECORD:C50([Cave:2])
v_Alsace:=0
v_Beaujolais:=0
v_Bordeaux:=0
v_Bourgogne:=0
V_Champagne:=0
v_Jura:=0
v_Languedoc:=0
v_Provence:=0
v_Sud:=0
v_Loire:=0
v_Rhone:=0
v_Autre:=0
While (Not:C34(End selection:C36([Cave:2])))
	$Autre:=[Cave:2]Qte:7-[Cave:2]Dont_Bue:8
	Case of 
		: ([Cave:2]Région:5="Alsace")
			v_Alsace:=v_Alsace+[Cave:2]Qte:7-[Cave:2]Dont_Bue:8
			$Autre:=0
		: ([Cave:2]Région:5="Beaujolais et Lyonnais")
			v_Beaujolais:=v_Beaujolais+[Cave:2]Qte:7-[Cave:2]Dont_Bue:8
			$Autre:=0
		: ([Cave:2]Région:5="Bordeaux")
			v_Bordeaux:=v_Bordeaux+[Cave:2]Qte:7-[Cave:2]Dont_Bue:8
			$Autre:=0
		: ([Cave:2]Région:5="Bourgogne")
			v_Bourgogne:=v_Bourgogne+[Cave:2]Qte:7-[Cave:2]Dont_Bue:8
			$Autre:=0
		: ([Cave:2]Région:5="Champagne et Est")
			V_Champagne:=V_Champagne+[Cave:2]Qte:7-[Cave:2]Dont_Bue:8
			$Autre:=0
		: ([Cave:2]Région:5="Jura et Savoie")
			v_Jura:=v_Jura+[Cave:2]Qte:7-[Cave:2]Dont_Bue:8
			$Autre:=0
		: ([Cave:2]Région:5="Languedoc et Roussillon")
			v_Languedoc:=v_Languedoc+[Cave:2]Qte:7-[Cave:2]Dont_Bue:8
			$Autre:=0
		: ([Cave:2]Région:5="Provence et Corse")
			v_Provence:=v_Provence+[Cave:2]Qte:7-[Cave:2]Dont_Bue:8
			$Autre:=0
		: ([Cave:2]Région:5="Sud Ouest")
			v_Sud:=v_Sud+[Cave:2]Qte:7-[Cave:2]Dont_Bue:8
			$Autre:=0
		: ([Cave:2]Région:5="Loire (Vallée de la)")
			v_Loire:=v_Loire+[Cave:2]Qte:7-[Cave:2]Dont_Bue:8
			$Autre:=0
		: ([Cave:2]Région:5="Rhône (Vallée du)")
			v_Rhone:=v_Rhone+[Cave:2]Qte:7-[Cave:2]Dont_Bue:8
			$Autre:=0
	End case 
	v_Autre:=v_Autre+$Autre
	NEXT RECORD:C51([Cave:2])
End while 