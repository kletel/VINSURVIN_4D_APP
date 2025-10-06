//%attributes = {"publishedWeb":true}
//C_ALPHA(80;$1;$NomUtilisateur;$2;$PrénomUtilisateur;$3;$NuméroLicence;$0)
//
//
//$NomUtilisateur:=$1
//$PrénomUtilisateur:=$2
//$NuméroLicence:=$3
//
//vStr:=$NuméroLicence
//  `vResult:=IM_Serial_Get (9237;Majusc($NomUtilisateur);Majusc($PrénomUtilisateur);vStr)
//Si (vResult#8569)
//$0:="Pas de numéro d'enregistrement"
//Sinon 
//$0:=vStr
//Fin de si 
