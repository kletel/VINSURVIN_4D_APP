//%attributes = {}
ALL RECORDS:C47([Cave:2])
FIRST RECORD:C50([Cave:2])
C_BLOB:C604($Blob)
While (Not:C34(End selection:C36([Cave:2])))
	PICTURE TO BLOB:C692([Cave:2]Etiquette:25; $blob; "Bmp")
	BLOB TO PICTURE:C682($Blob; [Cave:2]Etiquette:25; "Bmp")
	SET BLOB SIZE:C606([Cave:2]Carte_CH_x:45; 0)
	SAVE RECORD:C53([Cave:2])
	NEXT RECORD:C51([Cave:2])
End while 
