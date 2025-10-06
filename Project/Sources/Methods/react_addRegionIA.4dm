//%attributes = {"publishedWeb":true}
ARRAY TEXT:C222($tVnom; 0)
ARRAY TEXT:C222($tVal; 0)
WEB GET VARIABLES:C683($tVnom; $tVal)

//condition si pays n'existe pas ..
$nomPays:=KST_web_Lire_param(->$tVnom; ->$tVal; "nomPays")
$nomRegion:=KST_web_Lire_param(->$tVnom; ->$tVal; "nomRegion")
$pays:=ds:C1482.Pays.query("Nom_Fr = :1"; $nomPays).first()
If ((ds:C1482.Region.query("Nom_Fr = :1"; $nomRegion).length)=0)
	$lstRegion:=ds:C1482.Region.all()
	$region:=ds:C1482.Region.new()
	$region.Nom_Fr:=$nomRegion
	$region.Ref_Pays:=$pays.Ref_Pays
	$region.Ref_Region:=$lstRegion.length+1
	//$region.save()
	
	//react_addCoordRegion_paramEng($region,$pays)
	
	$obj:=New object:C1471("entete"; "succes"; "msg"; $UUIDuser; "nomUser"; $nomUser)
	$resp:=JSON Stringify:C1217($obj)
	WEB SEND TEXT:C677($resp; "application/json")
End if 
