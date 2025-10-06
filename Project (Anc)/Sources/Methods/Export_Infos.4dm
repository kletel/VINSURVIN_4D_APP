//%attributes = {}
$chemin:=Select folder:C670("Dossier d'export")

C_LONGINT:C283(<>Systeme; <>Realise)
_O_PLATFORM PROPERTIES:C365(<>Plateforme; <>Systeme; <>Realise)
<>Systeme:=Int:C8(<>Systeme/256)
If (<>Plateforme=3)
	<>Separateur:="\\"
Else 
	<>Separateur:=":"
End if 

ALL RECORDS:C47([Informations:10])
ORDER BY:C49([Informations:10]; [Informations:10]Rubrique:1; >; [Informations:10]Sous_Rubrique:2; >)

po:=1
FIRST RECORD:C50([Informations:10])
While (Not:C34(End selection:C36([Informations:10])))
	
	If (Test path name:C476($chemin+[Informations:10]Rubrique:1)#Est un dossier:K24:2)
		CREATE FOLDER:C475($chemin+[Informations:10]Rubrique:1)
	End if 
	
	
	If (Test path name:C476($chemin+[Informations:10]Rubrique:1+<>Separateur+[Informations:10]Sous_Rubrique:2)#Est un dossier:K24:2)
		CREATE FOLDER:C475($chemin+[Informations:10]Rubrique:1+<>Separateur+[Informations:10]Sous_Rubrique:2)
	End if 
	
	WP EXPORT DOCUMENT:C1337([Informations:10]Texte_WP_FR:29; $chemin+[Informations:10]Rubrique:1+<>Separateur+[Informations:10]Sous_Rubrique:2+<>Separateur+[Informations:10]Titre_Info_Fr:5+".doc"; wk docx:K81:277)
	
	NEXT RECORD:C51([Informations:10])
End while 