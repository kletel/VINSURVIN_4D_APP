//%attributes = {}

For ($i; Size of array:C274(Struct); 1; -1)
	If (Struct{$i}="")
		DELETE FROM ARRAY:C228(Struct; $i; 1)
		DELETE FROM ARRAY:C228(StructNum; $i; 1)
	End if 
End for 