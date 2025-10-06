//%attributes = {}
TRACE:C157
ALL RECORDS:C47([Termes:22])
FIRST RECORD:C50([Termes:22])
Repeat 
	$lang1:=[Termes:22]Termes_Langue1:10
	$lang2:=[Termes:22]Termes_Langue2:11
	$lang3:=[Termes:22]Termes_Langue3:12
	
	$caracteresc1:=Substring:C12($lang1; 1; 1)
	lglang1:=Length:C16($lang1)
	If ($caracteresc1=Char:C90(Espacement:K15:42))
		$lang1:=Substring:C12($lang1; 2; lglang1)
		[Termes:22]Termes_Langue1:10:=$lang1
		SAVE RECORD:C53([Termes:22])
	End if 
	
	$caracteresc2:=Substring:C12($lang2; 1; 1)
	lglang2:=Length:C16($lang2)
	If ($caracteresc2=Char:C90(Espacement:K15:42))
		$lang2:=Substring:C12($lang2; 2; lglang2)
		[Termes:22]Termes_Langue2:11:=$lang2
		SAVE RECORD:C53([Termes:22])
	End if 
	
	$caracteresc3:=Substring:C12($lang3; 1; 1)
	lglang3:=Length:C16($lang3)
	If ($caracteresc3=Char:C90(Espacement:K15:42))
		$lang3:=Substring:C12($lang3; 2; lglang3)
		[Termes:22]Termes_Langue3:12:=$lang3
		SAVE RECORD:C53([Termes:22])
	End if 
	
	
	$lang1:=[Termes:22]Termes_Langue1:10
	$lang2:=[Termes:22]Termes_Langue2:11
	$lang3:=[Termes:22]Termes_Langue3:12
	
	lglang1:=Length:C16($lang1)
	$caracteresc1:=Substring:C12($lang1; lglang1; lglang1)
	If ($caracteresc1=Char:C90(Espacement:K15:42))
		$lang1:=Substring:C12($lang1; 1; lglang1-1)
		[Termes:22]Termes_Langue1:10:=$lang1
		SAVE RECORD:C53([Termes:22])
	End if 
	
	lglang2:=Length:C16($lang2)
	$caracteresc2:=Substring:C12($lang2; lglang2; lglang2)
	If ($caracteresc2=Char:C90(Espacement:K15:42))
		$lang2:=Substring:C12($lang2; 1; lglang2-1)
		[Termes:22]Termes_Langue2:11:=$lang2
		SAVE RECORD:C53([Termes:22])
	End if 
	
	lglang3:=Length:C16($lang3)
	$caracteresc3:=Substring:C12($lang3; lglang3; lglang3)
	If ($caracteresc3=Char:C90(Espacement:K15:42))
		$lang3:=Substring:C12($lang3; 1; lglang3-1)
		[Termes:22]Termes_Langue3:12:=$lang3
		SAVE RECORD:C53([Termes:22])
	End if 
	
	NEXT RECORD:C51([Termes:22])
Until (End selection:C36([Termes:22]))
