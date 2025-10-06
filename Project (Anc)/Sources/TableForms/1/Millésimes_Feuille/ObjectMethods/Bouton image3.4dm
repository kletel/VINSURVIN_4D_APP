CREATE RECORD:C68([Millésimes:4])
[Millésimes:4]Annee:1:=Max:C3([Millésimes:4]Annee:1)+1

//condition mise en place car la liste déroulante propose le choix "espagne/portugal" qui n'existe pas dans la table pays.
If (Pop_Pays{Pop_Pays}="Espagne / Portugal")
	//On recherche alors en fonction de la réfrence du portugal
	QUERY:C277([Pays:8]; [Pays:8]Nom_Fr:3="Portugal")
Else 
	If (Pop_Pays{Pop_Pays}="Nouvelle Zélande / Afrique du Sud")
		//On recherche alors en fonction de la réfrence de la Nouvelle Zelande
		QUERY:C277([Pays:8]; [Pays:8]Nom_Fr:3="Nouvelle Zelande")
	Else 
		QUERY:C277([Pays:8]; [Pays:8]Nom_Fr:3=Pop_Pays{Pop_Pays})
	End if 
End if 

If (Pop_Pays{Pop_Pays}="Espagne / Portugal")
	[Millésimes:4]Pays:11:="Espagne / Portugal"
Else 
	If (Pop_Pays{Pop_Pays}="Nouvelle Zélande / Afrique du Sud")
		[Millésimes:4]Pays:11:="Nouvelle Zélande / Afrique du Sud"
	Else 
		[Millésimes:4]Pays:11:=[Pays:8]Nom_Fr:3
	End if 
End if 

[Millésimes:4]Ref_Pays:12:=[Pays:8]Ref_Pays:1
SAVE RECORD:C53([Millésimes:4])