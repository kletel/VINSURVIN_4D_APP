//%attributes = {"publishedWeb":true}
// 888_Fenêtre
//par PK
//Modifiée le 19/03/98
//cette procédure reçoi :
//$1 largeur de la fenetre
//$2 hauteur de la fenetre
//$3 type de la fenetre
//$4 titre de la fenetre
//$5 Procédure de fermeture de la fenetre
//$6 vrai si resizable

$nb:=Count parameters:C259
$largeur:=$1
$hauteur:=$2
$type:=$3
$titre:=$4
$Proc:=$5
If (($Proc="") & ($type=4))
	$Proc:="888_close_simple"
End if 
If ($nb=6)
	$resizable:=$6
Else 
	$resizable:=False:C215
End if 
If (Type:C295($type)=5)
	$Wtype:=1
Else 
	$Wtype:=$3
End if 
If (Type:C295($titre)=5)
	$Wtitre:="4ème Dimension"
Else 
	$Wtitre:=$4
End if 
If ($resizable=True:C214)
	$Wtype:=$Wtype+4
End if 
If (($Wtype#0) & ($Wtype#4) & ($Wtype#8) & ($Wtype#16))
	$top:=((Screen height:C188-$hauteur-20)/2)+20
Else 
	$top:=((Screen height:C188-$hauteur-20)/2)+30
End if 
If ($Wtype=0)
	$top:=$top+10
End if 
$left:=(Screen width:C187-$largeur)/2
$bottom:=$top+$hauteur
$right:=$left+$largeur
Open window:C153($left; $top; $right; $bottom; $Wtype; $Wtitre; $Proc)
