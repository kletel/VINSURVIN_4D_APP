QUERY:C277([Titre_Millesime:14]; [Titre_Millesime:14]Pays:1=Pop_Pays{Self:C308->}; *)
QUERY:C277([Titre_Millesime:14];  & ; [Titre_Millesime:14]Langue:3=<>LangueInitiale)
QUERY:C277([Millésimes:4]; [Millésimes:4]Ref_Pays:12=[Titre_Millesime:14]Ref_Pays:2)
ORDER BY:C49([Millésimes:4]; [Millésimes:4]Annee:1; <)