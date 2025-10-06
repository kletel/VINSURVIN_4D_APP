//%attributes = {}
_O_PLATFORM PROPERTIES:C365($platforme)
If ($platforme=3)
	$ref:=Open form window:C675([Localisation_Carte:19]; "Carte"; Form dialogue modal déplaçable:K39:8)
Else 
	$ref:=Open form window:C675([Localisation_Carte:19]; "Carte"; Form fenêtre feuille:K39:12)
End if 
QUERY:C277([Localisation_Carte:19]; [Localisation_Carte:19]_Ref:1=[Cave:2]Ref_Cave:26)
FORM SET INPUT:C55([Localisation_Carte:19]; "Carte")
If (Records in selection:C76([Localisation_Carte:19])=1)
	MODIFY RECORD:C57([Localisation_Carte:19])
Else 
	ADD RECORD:C56([Localisation_Carte:19])
End if 
