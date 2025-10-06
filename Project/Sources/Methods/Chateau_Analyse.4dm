//%attributes = {}
$Nom:="<div class=\"ProdNom\">"

$Txt:=Substring:C12([Import:20]Contenue:2; Position:C15($Nom; [Import:20]Contenue:2)+Length:C16($Nom))
[Import:20]_Nom:6:=Substring:C12($Txt; 1; Position:C15("<"; $txt)-1)

$Nom:="Millésime : "
$Txt:=Substring:C12($Txt; Position:C15($Nom; $Txt)+Length:C16($Nom))
[Import:20]_Millesime:7:=Substring:C12($Txt; 1; Position:C15("<"; $txt)-1)

$Nom:="Couleur : "
$Txt:=Substring:C12($Txt; Position:C15($Nom; $Txt)+Length:C16($Nom))
[Import:20]_Couleur:8:=Substring:C12($Txt; 1; Position:C15("<"; $txt)-1)

$Nom:="Origine : "
$Txt:=Substring:C12($Txt; Position:C15($Nom; $Txt)+Length:C16($Nom))
$Txt:=Substring:C12($Txt; Position:C15(">"; $Txt)+1)
[Import:20]_Origine1:9:=Substring:C12($Txt; 1; Position:C15("<"; $txt)-1)

$Nom:=" - "
$Txt:=Substring:C12($Txt; Position:C15($Nom; $Txt)+Length:C16($Nom))
$Txt:=Substring:C12($Txt; Position:C15(">"; $Txt)+1)
[Import:20]_Origine2:10:=Substring:C12($Txt; 1; Position:C15("<"; $txt)-1)

$Nom:=" - "
$Txt:=Substring:C12($Txt; Position:C15($Nom; $Txt)+Length:C16($Nom))
$Txt:=Substring:C12($Txt; Position:C15(">"; $Txt)+1)
[Import:20]_Origine3:11:=Substring:C12($Txt; 1; Position:C15("<"; $txt)-1)

$Nom:=" - "
$Txt:=Substring:C12($Txt; Position:C15($Nom; $Txt)+Length:C16($Nom))
$Txt:=Substring:C12($Txt; Position:C15(">"; $Txt)+1)
[Import:20]_Origine4:12:=Substring:C12($Txt; 1; Position:C15("<"; $txt)-1)