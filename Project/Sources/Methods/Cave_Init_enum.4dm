//%attributes = {}
DISTINCT VALUES:C339([Cave:2]Pays:24; Lst_Pays1)
SORT ARRAY:C229(Lst_Pays1; >)
INSERT IN ARRAY:C227(Lst_Pays1; 1; 1)
Lst_Pays1{1}:="Tous"
For ($i; Size of array:C274(Lst_Pays1); 1; -1)
	If (Lst_Pays1{$i}="")
		DELETE FROM ARRAY:C228(Lst_Pays1; $i; 1)
	End if 
End for 

$po:=Find in array:C230(Lst_Pays1; V_Cave_Init_Pays)
If ($po<0)
	$Po:=1
End if 
LISTBOX SELECT ROW:C912(Lst_Pays; $po; 0)

DISTINCT VALUES:C339([Cave:2]Type:4; Lst_Type1)
SORT ARRAY:C229(Lst_Type1; >)
INSERT IN ARRAY:C227(Lst_Type1; 1; 1)
Lst_Type1{1}:="Tous"
For ($i; Size of array:C274(Lst_Type1); 1; -1)
	If (Lst_Type1{$i}="")
		DELETE FROM ARRAY:C228(Lst_Type1; $i; 1)
	End if 
End for 

$po:=Find in array:C230(Lst_Type1; V_Cave_Init_Type)
If ($po<0)
	$Po:=1
End if 
LISTBOX SELECT ROW:C912(Lst_Type; $po; 0)

DISTINCT VALUES:C339([Cave:2]Région:5; Lst_Region1)
DISTINCT VALUES:C339([Cave:2]Région:5; Liste_Region1)
SORT ARRAY:C229(Lst_Region1; >)
INSERT IN ARRAY:C227(Lst_Region1; 1; 1)
Lst_Region1{1}:="Tous"
For ($i; Size of array:C274(Lst_Region1); 1; -1)
	If (Lst_Region1{$i}="")
		DELETE FROM ARRAY:C228(Lst_Region1; $i; 1)
	End if 
End for 

$po:=Find in array:C230(Lst_Region1; V_Cave_Init_Region)
If ($po<0)
	$Po:=1
End if 
LISTBOX SELECT ROW:C912(Lst_Region; $po; 0)

If (Type_Affichage=2)
	Cave_Graphe_liste
	
	OBJECT SET VISIBLE:C603(Img_Lst_Svg; True:C214)
	OBJECT SET VISIBLE:C603(Lst_Cave; False:C215)
	
	OBJECT SET VISIBLE:C603(*; "Btn1-1"; True:C214)
	OBJECT SET VISIBLE:C603(*; "Btn1-2"; False:C215)
	OBJECT SET VISIBLE:C603(*; "Btn2-1"; False:C215)
	OBJECT SET VISIBLE:C603(*; "Btn2-2"; True:C214)
Else 
	
	OBJECT SET VISIBLE:C603(Img_Lst_Svg; False:C215)
	OBJECT SET VISIBLE:C603(Lst_Cave; True:C214)
	
	OBJECT SET VISIBLE:C603(*; "Btn1-1"; False:C215)
	OBJECT SET VISIBLE:C603(*; "Btn1-2"; True:C214)
	OBJECT SET VISIBLE:C603(*; "Btn2-1"; True:C214)
	OBJECT SET VISIBLE:C603(*; "Btn2-2"; False:C215)
End if 

REDRAW WINDOW:C456(Current form window:C827)