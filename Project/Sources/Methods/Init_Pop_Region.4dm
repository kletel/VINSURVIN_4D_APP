//%attributes = {}


Kle_Langue

//** IDIOMA

QUERY:C277([Pays:8]; V_L_pays->=$1)
QUERY:C277([Region:9]; [Region:9]Ref_Pays:10=[Pays:8]Ref_Pays:1)
ORDER BY:C49([Region:9]; V_L_region->; >)
SELECTION TO ARRAY:C260(V_L_region->; Pop_Region)

INSERT IN ARRAY:C227(pop_Region; 1; 3)
pop_Region{1}:=Get indexed string:C510(<>strLang; 51)
pop_Region{2}:=Get indexed string:C510(<>strLang; 55)
pop_Region{3}:="-"
pop_Region:=1

