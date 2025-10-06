//%attributes = {}
_O_C_INTEGER:C282($long)
C_TEXT:C284($1)
$txt:="TABLEAU BOOLEEN(Colonne;0)"+Char:C90(13)
For ($j; 1; Get last field number:C255(5))
	GET FIELD PROPERTIES:C258(5; $j; $format; $long)
	
	$NomTab:="Colonne"
	Case of 
		: ($format=0)
			$txt:=$txt+"TABLEAU ALPHA("+String:C10($long)+";"+$NomTab+String:C10($j)+";0)"+Char:C90(13)
		: ($format=2)
			$txt:=$txt+"TABLEAU Texte("+$NomTab+String:C10($j)+";0)"+Char:C90(13)
		: ($format=1)
			$txt:=$txt+"TABLEAU REEL("+$NomTab+String:C10($j)+";0)"+Char:C90(13)
		: ($format=8)
			$txt:=$txt+"TABLEAU entier("+$NomTab+String:C10($j)+";0)"+Char:C90(13)
		: ($format=9)
			$txt:=$txt+"TABLEAU entier long("+$NomTab+String:C10($j)+";0)"+Char:C90(13)
		: ($format=4)
			$txt:=$txt+"TABLEAU date("+$NomTab+String:C10($j)+";0)"+Char:C90(13)
		: ($format=11)
			$txt:=$txt+"TABLEAU entier long("+$NomTab+String:C10($j)+";0)"+Char:C90(13)
		: ($format=6)
			$txt:=$txt+"TABLEAU booleen("+$NomTab+String:C10($j)+";0)"+Char:C90(13)
		: ($format=3)
			$txt:=$txt+"TABLEAU image("+$NomTab+String:C10($j)+";0)"+Char:C90(13)
		: ($format=7)
			$txt:=$txt+"TABLEAU REEL("+$NomTab+String:C10($j)+";0)"+Char:C90(13)
		: ($format=1)
			$txt:=$txt+"TABLEAU REEL("+$NomTab+String:C10($j)+";0)"+Char:C90(13)
		: ($format=30)
			$txt:=$txt+"TABLEAU BLOB("+$NomTab+String:C10($j)+";0)"+Char:C90(13)
	End case 
End for 

$Txt:=$Txt+Char:C90(13)+Char:C90(13)

_textReplace:=$txt
_Action:=1









//C_TEXTE($1)
//$txt:="TABLEAU ALPHA(31;Struct;100)"+Caractere(13)
//$txt:=$txt+"TABLEAU ENTIER(StructNum;100)"+Caractere(13)
//
//Boucle ($i;1;Nombre de tables)
//  `$Txt:=$Txt+"Struct{"+Chaine(100*$i)+"}:=\""+Nom de la table($i)+"\""+Caractere(13)
//$Txt:=$Txt+"` Traduction de la table "+Nom de la table($i)+Caractere(13)
//
//$Txt:=$Txt+"SUPPRIMER LIGNES(Struct;1;Taille tableau(Struct))"+Caractere(13)
//$Txt:=$Txt+"SUPPRIMER LIGNES(StructNum;1;Taille tableau(StructNum))"+Caractere(13)
//
//$Txt:=$Txt+"INSERER LIGNES(Struct;1;"+Chaine(Nombre de champs($i))+")"+Caractere(13)
//$Txt:=$Txt+"INSERER LIGNES(StructNum;1;"+Chaine(Nombre de champs($i))+")"+Caractere(13)
//
//Boucle ($j;1;Nombre de champs($i))
//$Txt:=$Txt+"Struct{"+Chaine($j)+"}:=\""+Nom du champ($i;$j)+"\""+Caractere(13)
//Fin de boucle 
//$Txt:=$Txt+Caractere(13)
//Boucle ($j;1;Nombre de champs($i))
//$Txt:=$Txt+"StructNum{"+Chaine($j)+"}:="+Chaine($j)+Caractere(13)
//Fin de boucle 
//$Txt:=$Txt+"FIXER TITRES CHAMPS(["+Nom de la table($i)+"];Struct;StructNum)"
//$Txt:=$Txt+Caractere(13)+Caractere(13)
//Fin de boucle 
//
//$Txt:=$Txt+"` Traduction des nom de table "+Caractere(13)
//
//$Txt:=$Txt+"SUPPRIMER LIGNES(Struct;1;Taille tableau(Struct))"+Caractere(13)
//$Txt:=$Txt+"SUPPRIMER LIGNES(StructNum;1;Taille tableau(StructNum))"+Caractere(13)
//
//$Txt:=$Txt+"INSERER LIGNES(Struct;1;"+Chaine(Nombre de tables)+")"+Caractere(13)
//$Txt:=$Txt+"INSERER LIGNES(StructNum;1;"+Chaine(Nombre de tables)+")"+Caractere(13)
//
//Boucle ($i;1;Nombre de tables)
//$Txt:=$Txt+"Struct{"+Chaine($i)+"}:=\""+Nom de la table($i)+"\""+Caractere(13)
//Fin de boucle 
//$Txt:=$Txt+Caractere(13)
//Boucle ($i;1;Nombre de tables)
//$Txt:=$Txt+"StructNum{"+Chaine($i)+"}:="+Chaine($i)+Caractere(13)
//Fin de boucle 
//$Txt:=$Txt+"FIXER TITRES TABLES(Struct;StructNum)"
//$Txt:=$Txt+Caractere(13)+Caractere(13)
//
//_textReplace:=$txt
//_Action:=1