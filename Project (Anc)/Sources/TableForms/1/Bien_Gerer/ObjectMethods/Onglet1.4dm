QUERY:C277([Informations:10]; V_L_Information_Sous_Rubrique->=Lst_Infos{Lst_Infos}; *)
QUERY:C277([Informations:10];  & ; V_L_Information_Actif->=True:C214)
ORDER BY:C49([Informations:10]; [Informations:10]Ref_Fiche:3; >)
SELECTION TO ARRAY:C260(V_L_Information_Titre->; Lst_Nom_Info)