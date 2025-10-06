//%attributes = {}
$ch:=Substring:C12(Application file:C491; 1; Length:C16(Application file:C491)-4)+"App.IAC"
If (Test path name:C476($ch)=1)
	$ref:=Open document:C264($ch)
	If (Ok=1)
		QUERY:C277([Appellation:3]; [Appellation:3]Ref_Pays:6=1)
		DELETE SELECTION:C66([Appellation:3])
		$chaine1:=""
		$chaine2:=""
		$chaine3:=""
		$chaine4:=""
		$chaine5:=""
		Repeat 
			CREATE RECORD:C68([Appellation:3])
			RECEIVE PACKET:C104($ref; $chaine1; Char:C90(9))
			RECEIVE PACKET:C104($ref; $chaine2; Char:C90(9))
			RECEIVE PACKET:C104($ref; $chaine3; Char:C90(9))
			RECEIVE PACKET:C104($ref; $chaine4; Char:C90(9))
			RECEIVE PACKET:C104($ref; $chaine5; Char:C90(10))
			If (Ok=1)
				CREATE RECORD:C68([Appellation:3])
				[Appellation:3]Appellation:1:=_O_ISO to Mac:C520($chaine1)
				[Appellation:3]Region:2:=_O_ISO to Mac:C520($chaine2)
				[Appellation:3]Pays:3:=_O_ISO to Mac:C520($Chaine3)
				[Appellation:3]Ref_Pays:6:=Num:C11($chaine4)
				[Appellation:3]Ref_Region:7:=Num:C11($Chaine5)
				SAVE RECORD:C53([Appellation:3])
			End if 
		Until (Ok#1)
		CLOSE DOCUMENT:C267($Ref)
		DELETE DOCUMENT:C159($Ch)
	End if 
End if 

$ch:=Substring:C12(Application file:C491; 1; Length:C16(Application file:C491)-4)+"Tex.IAC"
If (Test path name:C476($ch)=1)
	
	$ref:=Open document:C264($ch)
	If (Ok=1)
		ALL RECORDS:C47([Textes:11])
		DELETE SELECTION:C66([Textes:11])
		$chaine1:=""
		$chaine2:=""
		$chaine3:=""
		Repeat 
			CREATE RECORD:C68([Textes:11])
			RECEIVE PACKET:C104($ref; $chaine1; Char:C90(9))
			RECEIVE PACKET:C104($ref; $chaine2; Char:C90(9))
			RECEIVE PACKET:C104($ref; $chaine3; Char:C90(10))
			If (Ok=1)
				CREATE RECORD:C68([Textes:11])
				[Textes:11]Type_Enumération:1:=_O_ISO to Mac:C520($chaine1)
				[Textes:11]Positions:2:=Num:C11($chaine2)
				[Textes:11]Texte_Fr:3:=_O_ISO to Mac:C520($Chaine3)
				SAVE RECORD:C53([Textes:11])
			End if 
		Until (Ok#1)
		CLOSE DOCUMENT:C267($Ref)
		DELETE DOCUMENT:C159($Ch)
	End if 
End if 