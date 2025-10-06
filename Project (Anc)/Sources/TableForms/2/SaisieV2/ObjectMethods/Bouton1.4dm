$progress:=Progress New
Progress SET TITLE($progress; "L'I.A. Analyse l'image")
$requette:="Vous un caviste de plus de 30 ans d'experiences et vous devez decrire l'image a analyser avec le nom,la région, le pays, l'appellation,le millesime,le type de vin,quel est son apogee que tu nomera 'APOGEE', le taux d'alcool, la contenance, le type d"+"e bouteille, la durée d"+"e conservation, le site du "+"producteur, le nom du producteur, l'adresse du producteur, le prix moyen, il faudrait. des conseils d'associations mets et vins que tu nomera 'CONSEIL' ainsi que les cépages qui rentrent dans sa composition, merci.Le tout formaté dans un format JSON"+" pour que je puisse le traiter informatiquement."



[Cave:2]Remarques:35:=IA_imageverstexte([Cave:2]Etiquette:25; $requette)

[Cave:2]Remarques:35:=Substring:C12([Cave:2]Remarques:35; Position:C15("{"; [Cave:2]Remarques:35))

[Cave:2]Remarques:35:=Replace string:C233([Cave:2]Remarques:35; "```json"; ""; 99999)
[Cave:2]Remarques:35:=Replace string:C233([Cave:2]Remarques:35; "```"; ""; 99999)
//[Cave]Remarques:=Sous chaîne([Cave]Remarques; 1; Position("}"; [Cave]Remarques)+1)
Progress QUIT($progress)

C_OBJECT:C1216($Obj)
$Obj:=JSON Parse:C1218([Cave:2]Remarques:35)
[Cave:2]Nom:1:=$Obj.nom
If ($Obj.region#Null:C1517)
	[Cave:2]Région:5:=$Obj.region
End if 

If ($Obj.région#Null:C1517)
	[Cave:2]Région:5:=$Obj.région
End if 

[Cave:2]Type:4:=$Obj.type_de_vin
[Cave:2]Pays:24:=$Obj.pays
[Cave:2]Millesime:6:=String:C10($Obj.millesime)
[Cave:2]Appellation:2:=$Obj.appellation

SAVE RECORD:C53([Cave:2])
