QUERY:C277([Sites:15]; [Sites:15]Langue:5=<>LangueInitiale)
ORDER BY:C49([Sites:15]; [Sites:15]Rubrique:1; >)
DISTINCT VALUES:C339([Sites:15]Rubrique:1; Pop_Rub)
INSERT IN ARRAY:C227(Pop_Rub; 1; 2)
Pop_Rub{1}:=Get indexed string:C510(<>strLang; 302)
Pop_Rub{2}:="-"
Pop_Rub:=1

FORM SET INPUT:C55([Sites:15]; "Entrée")
$ref:=Open form window:C675([Sites:15]; "Entrée")
ADD RECORD:C56([Sites:15]; *)

QUERY:C277([Sites:15]; [Sites:15]Langue:5=<>LangueInitiale)
ORDER BY:C49([Sites:15]; [Sites:15]Rubrique:1; >)
DISTINCT VALUES:C339([Sites:15]Rubrique:1; Ong_Site)
DISTINCT VALUES:C339([Sites:15]Rubrique:1; Pop_Rub)
INSERT IN ARRAY:C227(Pop_Rub; 1; 2)
Pop_Rub{1}:=Get indexed string:C510(<>strLang; 302)
Pop_Rub{2}:="-"

If (Size of array:C274(Ong_Site)>0)
	QUERY:C277([Sites:15]; [Sites:15]Rubrique:1=Ong_Site{1})
	SELECTION TO ARRAY:C260([Sites:15]Site:2; V_Sites)
End if 
Ong_Site:=1

V_Texte:=""
