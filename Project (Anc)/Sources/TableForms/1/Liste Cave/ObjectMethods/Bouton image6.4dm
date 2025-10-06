CREATE SET:C116([Cave:2]; "Tmp_cave")
UNLOAD RECORD:C212([Cave:2])
USE SET:C118("User_select")
If (Records in selection:C76([Cave:2])=1)
	Kle_Confirmer(Get indexed string:C510(<>strLang; 180))
Else 
	Kle_Confirmer(Get indexed string:C510(<>strLang; 181)+Char:C90(Espacement:K15:42)+String:C10(Records in selection:C76([Cave:2]))+Char:C90(Espacement:K15:42)+Get indexed string:C510(<>strLang; 182))
End if 
If (ok=1)
	DELETE SELECTION:C66([Cave:2])
End if 

USE SET:C118("Tmp_cave")

Cave_Init_enum
calcul_Valeure