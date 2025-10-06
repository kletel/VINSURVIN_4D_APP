Case of 
	: (Form event code:C388=Sur chargement:K2:1)
		If ([Cave:2]Pos_Tan_X:52>0) & ([Cave:2]Pos_Tan_Y:53>0)
			OBJECT SET VISIBLE:C603(*; "Point1"; True:C214)
			OBJECT GET COORDINATES:C663(x_btn1; $gauche; $haut; $droite; $bas)
			OBJECT MOVE:C664(*; "Point1"; $gauche+[Cave:2]Pos_Tan_X:52-8; $haut+[Cave:2]Pos_Tan_Y:53-8; $gauche+[Cave:2]Pos_Tan_X:52+8; $haut+[Cave:2]Pos_Tan_Y:53+8; *)
		Else 
			OBJECT SET VISIBLE:C603(*; "Point1"; False:C215)
		End if 
		
		
	: (Form event code:C388=Sur clic:K2:4)
		
		OBJECT GET COORDINATES:C663(x_btn1; $gauche; $haut; $droite; $bas)
		GET MOUSE:C468($x; $y; $clic)
		OBJECT SET VISIBLE:C603(*; "Point1"; True:C214)
		OBJECT MOVE:C664(*; "Point1"; $x-8; $y-8; $x+8; $y+8; *)
		[Cave:2]Pos_Tan_X:52:=$x-$gauche
		[Cave:2]Pos_Tan_Y:53:=$Y-$haut
		
End case 