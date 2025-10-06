Case of 
	: (Form event code:C388=Sur clic:K2:4)
		$PosX:=MouseX
		$PosY:=MouseY
		
		$col:=Int:C8($PosX/145)+1
		If ($col>(V_NB_C+1))
			$col:=(V_NB_C+1)
		End if 
		
		$pos:=$col+(Int:C8($PosY/160)*(V_NB_C+1))
		If ($pos>0) & ($Pos<=Size of array:C274(Ref_Svg))
			SVG_Set_error_handler("ErrSVG")
			
			$x:=Int:C8($posx/145)*145
			$y:=Int:C8($posY/160)*160
			
			SVG_SET_VISIBILITY(V_Cadre; True:C214)
			SVG_SET_XY(V_Cadre; $x+2; $y+2)
			//$object:=SVG_New_rect (Img_Lst;$x;$y;145;160;10;10;"Aqua";"azure";3)
			//  `SVG_SET_ROUNDING_RECT ($object;20)  `Arrondir les angles
			//SVG_SET_OPACITY ($object;20)
			//SVG_SET_DIMENSIONS (Ref_Svg{$pos};110;120)
			Img_Lst_SVG:=SVG_Export_to_picture(Img_Lst; 1)
			REDRAW:C174(Img_Lst_SVG)
			REDRAW WINDOW:C456(Current form window:C827)
		End if 
		
	: (Form event code:C388=Sur double clic:K2:5)
		$PosX:=MouseX
		$PosY:=MouseY
		OBJECT GET COORDINATES:C663(Img_Lst; $gauche; $haut; $droite; $bas)
		
		$larg:=$droite-$gauche
		$nbC:=Int:C8($larg/150)-1
		
		$Element:=(Int:C8($PosX/150)+1)+(Int:C8($PosY/160)*($nbC+1))
		If ($Element<=Size of array:C274(Ref_Enr2))
			GOTO RECORD:C242([Cave:2]; Ref_Enr2{$Element})
			MODIFY RECORD:C57([Cave:2])
		End if 
		//ALERTE(Chaine($Element))
		
End case 