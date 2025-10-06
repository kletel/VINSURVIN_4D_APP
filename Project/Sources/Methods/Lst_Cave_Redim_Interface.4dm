//%attributes = {}
//``Redimetionnement des bouttons
//TRACE
GET WINDOW RECT:C443($gaucheF; $hautF; $droiteF; $basF)
OBJECT GET COORDINATES:C663(Btn_Select1; $gauche; $haut; $droite; $bas)
OBJECT GET COORDINATES:C663(Btn_Select6; $gauche2; $haut2; $droite2; $bas2)

$largtt:=$droiteF-$gauche-$gaucheF
$pas:=Int:C8(($largtt)/6)
For ($i; 1; 6)
	$NomObj:="Btn_Select"+String:C10($i)
	If ($i#6)
		OBJECT MOVE:C664(*; $NomObj; $gauche+($pas*($i-1)); $haut; $gauche+($pas*($i))-2; $bas; *)
	Else 
		OBJECT MOVE:C664(*; $NomObj; $gauche+($pas*($i-1)); $haut; $droiteF-$gaucheF; $bas; *)
	End if 
End for 

//``Redimetionnement des Selections

OBJECT GET COORDINATES:C663(Lst_Pays; $gauche; $haut; $droite; $bas)
OBJECT GET COORDINATES:C663(Lst_Region; $gauche2; $haut2; $droite2; $bas2)

$pas:=Int:C8(($largtt)/3)
For ($i; 1; 3)
	Case of 
		: ($i=1)
			$NomObj:="Lst_Pays"
		: ($i=3)
			$NomObj:="Lst_Type"
		: ($i=2)
			$NomObj:="Lst_Region"
	End case 
	//$NomObj:="Lst_Select"+Chaine($i)
	If ($i#3)
		OBJECT MOVE:C664(*; $NomObj; $gauche+($pas*($i-1)); $haut; $gauche+($pas*($i))-2; $bas; *)
	Else 
		OBJECT MOVE:C664(*; $NomObj; $gauche+($pas*($i-1)); $haut; $droiteF-$gaucheF-2; $bas; *)
	End if 
End for 

OBJECT GET COORDINATES:C663(*; "Fond_Band_Haut"; $gauche; $haut; $droite; $bas)
OBJECT MOVE:C664(*; "Fond_Band_Haut"; $gauche; $haut; $droiteF-$gaucheF; $bas; *)
OBJECT GET COORDINATES:C663(*; "Fond_Band_Bas"; $gauche; $haut; $droite; $bas)
OBJECT MOVE:C664(*; "Fond_Band_Bas"; $gauche; $haut; $droiteF-$gaucheF; $bas; *)
OBJECT GET COORDINATES:C663(*; "Fond_Ligne_Bas"; $gauche; $haut; $droite; $bas)
OBJECT MOVE:C664(*; "Fond_Ligne_Bas"; $gauche; $haut; $droiteF-$gaucheF; $bas; *)
OBJECT GET COORDINATES:C663(*; "Fond_Ligne_Haut"; $gauche; $haut; $droite; $bas)
OBJECT MOVE:C664(*; "Fond_Ligne_Haut"; $gauche; $haut; $droiteF-$gaucheF; $bas; *)
OBJECT GET COORDINATES:C663(*; "Lst_Cave"; $gauche; $haut; $droite; $bas)
OBJECT MOVE:C664(*; "Lst_Cave"; $gauche; $haut; $droiteF-$gaucheF; $bas; *)
OBJECT GET COORDINATES:C663(*; "Img_Lst_Svg"; $gauche; $haut; $droite; $bas)
OBJECT MOVE:C664(*; "Img_Lst_Svg"; $gauche; $haut; $droiteF-$gaucheF-20; $bas; *)

