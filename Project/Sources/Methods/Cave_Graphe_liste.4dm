//%attributes = {}

C_LONGINT:C283(<>Systeme; <>Realise)
_O_PLATFORM PROPERTIES:C365(<>Plateforme; <>Systeme; <>Realise)
<>Systeme:=Int:C8(<>Systeme/256)
If (<>Plateforme=3)
	<>Separateur:="\\"
Else 
	<>Separateur:=":"
End if 

SELECTION TO ARRAY:C260([Cave:2]Etiquette:25; tab_Cave1; [Cave:2]Nom:1; tab_Cave2)
_O_ARRAY STRING:C218(32; Ref_Svg; 0)
ARRAY LONGINT:C221(Ref_Enr; 0)
ARRAY LONGINT:C221(Ref_Enr2; 0)
Img_Lst:=SVG_New

FIRST RECORD:C50([Cave:2])
OBJECT GET COORDINATES:C663(Img_Lst; $gauche; $haut; $droite; $bas)

$larg:=$droite-$gauche
$nbC:=Int:C8($larg/150)-1
V_NB_C:=$nbC
$HauterL:=160
$Li:=0
$Col:=0
C_PICTURE:C286(Im_Fond)
C_PICTURE:C286(Im_Etagere)
C_PICTURE:C286(Im_Cadre)
$coef:=$larg/714
READ PICTURE FILE:C678(Get 4D folder:C485(6)+"Pictos"+<>Separateur+"fond.png"; Im_Fond)
TRANSFORM PICTURE:C988(Im_Fond; 1; $coef; 1)
CONVERT PICTURE:C1002(Im_Fond; "JPEG")
READ PICTURE FILE:C678(Get 4D folder:C485(6)+"Pictos"+<>Separateur+"etagere.jpg"; Im_Etagere)
TRANSFORM PICTURE:C988(Im_Etagere; 1; $coef; 1)
READ PICTURE FILE:C678(Get 4D folder:C485(6)+"Pictos"+<>Separateur+"Cadre2.png"; Im_Cadre)
$hauteur:=0

$ref_Svg:=SVG_New_embedded_image(Img_Lst; Im_Fond; 0; $hauteur)
$ref_Svg:=SVG_New_embedded_image(Img_Lst; Im_Etagere; 0; $hauteur+140)

FIRST RECORD:C50([Cave:2])
While (Not:C34(End selection:C36([Cave:2])))
	C_PICTURE:C286($Img)
	$img:=[Cave:2]Etiquette:25
	PICTURE PROPERTIES:C457($img; $LargIm; $HautIm)
	If ($LargIm<10)
		Case of 
			: ([Cave:2]Type:4="Rouge")
				READ PICTURE FILE:C678(Get 4D folder:C485(6)+"Liste"+<>Separateur+"Rouge.png"; $Img)
				
			: ([Cave:2]Type:4="Rose")
				READ PICTURE FILE:C678(Get 4D folder:C485(6)+"Liste"+<>Separateur+"Rose.png"; $Img)
				
			: ([Cave:2]Type:4="Blanc")
				READ PICTURE FILE:C678(Get 4D folder:C485(6)+"Liste"+<>Separateur+"Blanc.png"; $Img)
				
			Else 
				READ PICTURE FILE:C678(Get 4D folder:C485(6)+"Liste"+<>Separateur+"Champagne.png"; $Img)
				
		End case 
		
		PICTURE PROPERTIES:C457($img; $LargIm; $HautIm)
	End if 
	$txt:=[Cave:2]Nom:1+" "+String:C10([Cave:2]Millesime:6)
	//$txt:="XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
	$maxIm:=$LargIm
	If ($maxIm<$HautIm)
		$maxIm:=$HautIm
	End if 
	
	$img:=$img*(110/$maxIm)
	
	CONVERT PICTURE:C1002($img; "TIF")
	PICTURE PROPERTIES:C457($img; $LargIm; $HautIm)
	$decal:=Int:C8((120-$LargIm)/2)
	
	//CREER IMAGETTE([Cave]Etiquette;$img;128;128)
	$ref_Svg:=SVG_New_embedded_image(Img_Lst; Im_Cadre; $Col*145+10; $Li*$HauterL+10)
	
	
	
	INSERT IN ARRAY:C227(Ref_Enr; Size of array:C274(Ref_Enr)+1; 1)
	Ref_Enr{Size of array:C274(Ref_Enr)}:=[Cave:2]Ref_Cave:26
	INSERT IN ARRAY:C227(Ref_Enr2; Size of array:C274(Ref_Enr2)+1; 1)
	Ref_Enr2{Size of array:C274(Ref_Enr2)}:=Record number:C243([Cave:2])
	
	$ref_Svg:=SVG_New_embedded_image(Img_Lst; $img; $Col*145+15+$decal; $Li*$HauterL+15)
	INSERT IN ARRAY:C227(Ref_Svg; Size of array:C274(Ref_Svg)+1; 1)
	Ref_Svg{Size of array:C274(Ref_Svg)}:=$ref_Svg
	$ref_Svg:=SVG_New_textArea(Img_Lst; $txt; $Col*145+25; ($Li*$HauterL)+15+112; 100; 22; "Arial"; 10; 1; 3)
	//$ref_Svg:=SVG_SET_VIEWBOX (Img_Lst;$txt;$Col*145+20;($Li*$HauterL)+15+112;100;22;"Arial";10;1;3)
	$Col:=$Col+1
	If ($Col>$nbC)
		$li:=$li+1
		$Col:=0
		$hauteur:=$hauteur+160
		$ref_Svg:=SVG_New_embedded_image(Img_Lst; Im_Fond; 0; $hauteur)
		$ref_Svg:=SVG_New_embedded_image(Img_Lst; Im_Etagere; 0; $hauteur+140)
	End if 
	NEXT RECORD:C51([Cave:2])
End while 

V_Cadre:=SVG_New_rect(Img_Lst; 2; 2; 145; 160; 10; 10; "Aqua"; "lightblue"; 2)
//SVG_SET_ROUNDING_RECT ($object;20)  `Arrondir les angles
SVG_SET_OPACITY(V_Cadre; 20)
SVG_SET_VISIBILITY(V_Cadre; False:C215)

//SVGTool_SHOW_IN_VIEWER (Img_Lst)

Img_Lst_SVG:=SVG_Export_to_picture(Img_Lst; 1)
//CONVERTIR IMAGE(Img_Lst_SVG;".jpg")
