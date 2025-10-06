FIRST RECORD:C50([Association:7])
v_Ref_Asso:=[Association:7]Categorie:1
v_Ref_SousAsso:=[Association:7]Sous_Categorie:2

FORM SET INPUT:C55([Association:7]; "Saisie")
$ref:=Open form window:C675([Association:7]; "Saisie"; Form dialogue modal déplaçable:K39:8)
ADD RECORD:C56([Association:7]; *)

v_Ref_Asso:=""
v_Ref_SousAsso:=""

cat:=""
$po:=1
Lst_Cat:=New list:C375
//TOUT SELECTIONNER([Association])
QUERY:C277([Association:7]; [Association:7]Langue:5=<>LangueInitiale)
ORDER BY:C49([Association:7]Categorie:1; >)
DISTINCT VALUES:C339([Association:7]Categorie:1; L_Cat)
For (i; 1; Size of array:C274(L_Cat))
	QUERY:C277([Association:7]; [Association:7]Categorie:1=L_Cat{i})
	ORDER BY:C49([Association:7]Sous_Categorie:2; >)
	DISTINCT VALUES:C339([Association:7]Sous_Categorie:2; L_Cat2)
	
	L_Cat3:=New list:C375
	For ($j; 1; Size of array:C274(L_Cat2))
		APPEND TO LIST:C376(L_Cat3; L_Cat2{$j}; -$po)
		$po:=$po+1
	End for 
	
	APPEND TO LIST:C376(Lst_Cat; L_Cat{i}; $po; L_Cat3; False:C215)
	$po:=$po+1
	
End for 
APPEND TO LIST:C376(Lst_Cat; Get indexed string:C510(<>strLang; 132); -9999; 0; False:C215)
SET LIST ITEM PROPERTIES:C386(Lst_Cat; 0; False:C215; 0; Utiliser réf image:K28:4+886)

SET LIST PROPERTIES:C387(Lst_Cat; 0; 0; 20; 0)

//TOUT SELECTIONNER([Association])
QUERY:C277([Association:7]; [Association:7]Langue:5=<>LangueInitiale)
SELECTION TO ARRAY:C260([Association:7]Met:3; Lst)
SELECTION TO ARRAY:C260([Association:7]Sous_Categorie:2; Lst1)
DELETE FROM ARRAY:C228(Lst; 1; Size of array:C274(Lst))
DELETE FROM ARRAY:C228(Lst1; 1; Size of array:C274(Lst1))
Txt:=""
Txt2:=""
