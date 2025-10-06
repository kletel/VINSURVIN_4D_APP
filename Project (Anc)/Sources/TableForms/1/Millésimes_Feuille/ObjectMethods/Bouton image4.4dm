$de:=Kle_Demander(Get indexed string:C510(<>strLang; 139)+" :")
If (ok=1)
	If ($de#"")
		QUERY:C277([Millésimes:4]; [Millésimes:4]Ref_Pays:12=[Titre_Millesime:14]Ref_Pays:2; *)
		QUERY:C277([Millésimes:4];  & ; [Millésimes:4]Annee:1=Num:C11($de))
		DELETE SELECTION:C66([Millésimes:4])
		
		//réafficher les millésimes pour le pays selectionné dans la liste déroulante et en fonction de la langue du logiciel
		QUERY:C277([Titre_Millesime:14]; [Titre_Millesime:14]Pays:1=Pop_Pays{Pop_Pays}; *)
		QUERY:C277([Titre_Millesime:14];  & ; [Titre_Millesime:14]Langue:3=<>LangueInitiale)
		QUERY:C277([Millésimes:4]; [Millésimes:4]Ref_Pays:12=[Titre_Millesime:14]Ref_Pays:2)
		ORDER BY:C49([Millésimes:4]; [Millésimes:4]Annee:1; <)
	End if 
End if 