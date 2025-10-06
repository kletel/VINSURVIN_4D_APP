//%attributes = {}
ARRAY TEXT:C222(<>Pop_Pays; 0)

ALL RECORDS:C47([Pays:8])
Kle_Langue

ORDER BY:C49([Pays:8]; [Pays:8]Nb_Bouteilles:9; <; V_L_pays->; >)
SELECTION TO ARRAY:C260(V_L_pays->; <>Pop_Pays)
INSERT IN ARRAY:C227(<>Pop_Pays; 1; 3)
//$tmp:=◊LangueOff{43}
<>Pop_Pays{1}:=Get indexed string:C510(<>strLang; 43)
<>Pop_Pays{2}:=Get indexed string:C510(<>strLang; 50)
<>Pop_Pays{3}:="-"

<>Pop_Pays:=1