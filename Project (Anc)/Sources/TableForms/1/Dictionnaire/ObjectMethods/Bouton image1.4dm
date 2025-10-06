FORM SET INPUT:C55([Vocabulaire:5]; "Ajout")
$ref:=Open form window:C675([Vocabulaire:5]; "Ajout")
ADD RECORD:C56([Vocabulaire:5]; *)
Kle_Langue
Rech:=""
QUERY:C277([Vocabulaire:5]; V_L_Lexique_Nom->#"")
ORDER BY:C49([Vocabulaire:5]; V_L_Lexique_Nom->; >)
SELECTION TO ARRAY:C260(V_L_Lexique_Nom->; Lst)
Txt:=""
Ti_Texte:=""
