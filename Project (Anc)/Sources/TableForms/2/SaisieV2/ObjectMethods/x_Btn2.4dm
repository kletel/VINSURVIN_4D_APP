Case of 
	: (Form event code:C388=Sur chargement:K2:1)
		If ([Cave:2]Pos_Acid_X:50>0) & ([Cave:2]Pos_Acid_Y:51>0)
			OBJECT SET VISIBLE:C603(*; "Point2"; True:C214)
			OBJECT GET COORDINATES:C663(x_btn2; $gauche; $haut; $droite; $bas)
			OBJECT MOVE:C664(*; "Point2"; $gauche+[Cave:2]Pos_Acid_X:50-8; $haut+[Cave:2]Pos_Acid_Y:51-8; $gauche+[Cave:2]Pos_Acid_X:50+8; $haut+[Cave:2]Pos_Acid_Y:51+8; *)
		Else 
			OBJECT SET VISIBLE:C603(*; "Point2"; False:C215)
		End if 
		
	: (Form event code:C388=Sur clic:K2:4)
		
		OBJECT GET COORDINATES:C663(x_btn2; $gauche; $haut; $droite; $bas)
		GET MOUSE:C468($x; $y; $clic)
		OBJECT SET VISIBLE:C603(*; "Point2"; True:C214)
		OBJECT MOVE:C664(*; "Point2"; $x-8; $y-8; $x+8; $y+8; *)
		[Cave:2]Pos_Acid_X:50:=$x-$gauche
		[Cave:2]Pos_Acid_Y:51:=$Y-$haut
		
		
		
End case 
