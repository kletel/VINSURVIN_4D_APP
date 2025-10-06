$chemin:=""  // dossier("Dossier d'exportation")

$separ:="•"

$destination:="Excel"



$prog:=Progress New
$Table:=2
$Segment:=1
$Ligne:=0


If ($destination="Fichier")
	$RefDoc:=Create document:C266($chemin+Table name:C256($Table)+".txt")
Else 
	VP NEW DOCUMENT("Z_XLS")
End if 
Progress SET TITLE($prog; Table name:C256($Table))
ALL RECORDS:C47(Table:C252($Table)->)


ARRAY TEXT:C222($t_Cle; 0)
ARRAY REAL:C219($t_Val; 0)
ARRAY TEXT:C222($t_NbValeur; 0)


While (Not:C34(End selection:C36([Cave:2])))
	If ([Cave:2]Remarques:35#"")
		$Cle:=OB Keys:C1719(JSON Parse:C1218([Cave:2]Remarques:35))
		$Val:=OB Values:C1718(JSON Parse:C1218([Cave:2]Remarques:35))
		
		For ($xi; 0; $Cle.length-1)
			$pos:=Find in array:C230($t_Cle; $Cle[$xi])
			If ($pos>0)
				$t_Val{$pos}+=1
			Else 
				APPEND TO ARRAY:C911($t_Cle; $Cle[$xi])
				APPEND TO ARRAY:C911($t_Val; 1)
			End if 
		End for 
		
	End if 
	
	NEXT RECORD:C51([Cave:2])
End while 

$ligne:=1
For ($xi; 1; Size of array:C274($t_Cle))
	
	VP SET TEXT VALUE(VP Cell("Z_XLS"; 1; $xi); $t_Cle{$xi})
	VP SET NUM VALUE(VP Cell("Z_XLS"; 2; $xi); $t_Val{$xi})
	
End for 

Progress QUIT($prog)



DISTINCT VALUES:C339([Declaration:13]UUID_Site_:129; $tab)
QUERY WITH ARRAY:C644([Site:10]UUID_:68; $tab)
For ($i; 1; Get last field number:C255(Table:C252($Table)))
	If ($destination="Fichier")
		SEND PACKET:C103($RefDoc; Field name:C257($Table; $i)+$separ)
	Else 
		VP SET TEXT VALUE(VP Cell("Z_XLS"; $i-1; $ligne); Field name:C257($Table; $i))
	End if 
End for 

If ($destination="Fichier")
	SEND PACKET:C103($RefDoc; Char:C90(13))
End if 

ALL RECORDS:C47(Table:C252($Table)->)
FIRST RECORD:C50(Table:C252($Table)->)
While (Not:C34(End selection:C36(Table:C252($Table)->)))
	Progress SET PROGRESS($prog; Selected record number:C246(Table:C252($Table)->)/Records in selection:C76(Table:C252($Table)->))
	$Ligne+=1
	
	For ($i; 1; Get last field number:C255(Table:C252($Table)))
		$chaine:=""
		If (Is field number valid:C1000($Table; $i))
			GET FIELD PROPERTIES:C258($Table; $i; $TypeChamp)
			Case of 
				: ($TypeChamp=30)  //Est un BLOB - 30
					//VP SET TEXT VALUE(VP Cell("Z_XLS"; $i-1; $ligne); Champ($Table; $i)->)
					
				: ($TypeChamp=6)  //Est un booléen - 6
					$chaine:=String:C10(Field:C253($Table; $i)->)
					
				: ($TypeChamp=0)  //Est un champ alpha - 0
					$chaine:=String:C10(Field:C253($Table; $i)->)
					
				: ($TypeChamp=8)  //Est un entier - 8
					$chaine:=String:C10(Field:C253($Table; $i)->)
					
				: ($TypeChamp=25)  //Est un entier 64 bits - 25
					$chaine:=String:C10(Field:C253($Table; $i)->)
					
				: ($TypeChamp=9)  //Est un Entier long - 9
					$chaine:=String:C10(Field:C253($Table; $i)->)
					
				: ($TypeChamp=35)  //Est un float - 35
					$chaine:=String:C10(Field:C253($Table; $i)->)
					
				: ($TypeChamp=1)  //Est un numérique - 1
					$chaine:=String:C10(Field:C253($Table; $i)->)
					
				: ($TypeChamp=38)  //Est un objet - 38
					
					//VP SET TEXT VALUE(VP Cell("Z_XLS"; $i-1; $ligne); Champ($Table; $i)->)
					
				: ($TypeChamp=2)  //Est un texte - 2
					$chaine:=String:C10(Field:C253($Table; $i)->)
					
				: ($TypeChamp=4)  //Est une date - 4
					$chaine:=String:C10(Field:C253($Table; $i)->)
					
				: ($TypeChamp=11)  //Est une heure - 11
					$chaine:=String:C10(Field:C253($Table; $i)->)
					
				: ($TypeChamp=3)  //Est une image - 3
					//VP SET TEXT VALUE(VP Cell("Z_XLS"; $i-1; $ligne); Champ($Table; $i)->)
					
				: ($TypeChamp=7)  //Est une sous table - 7
					
					
				Else 
					
			End case 
			If ($destination="Fichier")
				$chaine:=Replace string:C233($chaine; "\""; ""; 999)
				$chaine:=Replace string:C233($chaine; Char:C90(13); " <br> "; 999)
				$chaine:=Replace string:C233($chaine; Char:C90(10); ""; 999)
				$chaine:=Sup_Ctrl($chaine)
				SEND PACKET:C103($RefDoc; $chaine+$separ)
			Else 
				VP SET TEXT VALUE(VP Cell("Z_XLS"; $i-1; $ligne); $chaine)
			End if 
		End if 
		
	End for 
	
	
	If ($destination="Fichier")
		SEND PACKET:C103($RefDoc; Char:C90(13))
	End if 
	
	If ($destination="XLS")
		If ($Ligne>998)
			$params:=New object:C1471
			$params.format:=vk MS Excel format:K89:2  //".xlsx"
			$params.valuesOnly:=True:C214
			
			VP EXPORT DOCUMENT("Z_XLS"; $chemin+"Export_table_"+Table name:C256($Table)+"_"+String:C10($Segment)+".xlsx"; $params)
			VP NEW DOCUMENT("Z_XLS")
			
			$Table:=10
			$Segment+=1
			$Ligne:=0
			
			For ($i; 1; Get last field number:C255(Table:C252($Table)))
				VP SET TEXT VALUE(VP Cell("Z_XLS"; $i-1; $ligne); Field name:C257($Table; $i))
			End for 
			
		End if 
	End if 
	NEXT RECORD:C51(Table:C252($Table)->)
End while 


If ($destination="Fichier")
	CLOSE DOCUMENT:C267($RefDoc)
Else 
	$params:=New object:C1471
	$params.format:=vk MS Excel format:K89:2  //".xlsx"
	$params.valuesOnly:=True:C214
	VP EXPORT DOCUMENT("Z_XLS"; $chemin+"Export_table_"+Table name:C256($Table)+"_"+String:C10($Segment)+".xlsx"; $params)
End if 

$Table:=13
$Segment:=1
$Ligne:=0
If ($destination="Fichier")
	$RefDoc:=Create document:C266($chemin+Table name:C256($Table)+".txt")
Else 
	VP NEW DOCUMENT("Z_XLS")
End if 
Progress SET TITLE($prog; Table name:C256($Table))
ALL RECORDS:C47(Table:C252($Table)->)
For ($i; 1; Get last field number:C255(Table:C252($Table)))
	If ($destination="Fichier")
		SEND PACKET:C103($RefDoc; Field name:C257($Table; $i)+$separ)
	Else 
		VP SET TEXT VALUE(VP Cell("Z_XLS"; $i-1; $ligne); Field name:C257($Table; $i))
	End if 
End for 

If ($destination="Fichier")
	SEND PACKET:C103($RefDoc; Char:C90(13))
End if 


ALL RECORDS:C47(Table:C252($Table)->)
FIRST RECORD:C50(Table:C252($Table)->)
While (Not:C34(End selection:C36(Table:C252($Table)->)))
	Progress SET PROGRESS($prog; Selected record number:C246(Table:C252($Table)->)/Records in selection:C76(Table:C252($Table)->))
	$Ligne+=1
	
	For ($i; 1; Get last field number:C255(Table:C252($Table)))
		$chaine:=""
		If (Is field number valid:C1000($Table; $i))
			GET FIELD PROPERTIES:C258($Table; $i; $TypeChamp)
			Case of 
				: ($TypeChamp=30)  //Est un BLOB - 30
					//VP SET TEXT VALUE(VP Cell("Z_XLS"; $i-1; $ligne); Champ($Table; $i)->)
					
				: ($TypeChamp=6)  //Est un booléen - 6
					$chaine:=String:C10(Field:C253($Table; $i)->)
					
				: ($TypeChamp=0)  //Est un champ alpha - 0
					$chaine:=String:C10(Field:C253($Table; $i)->)
					
				: ($TypeChamp=8)  //Est un entier - 8
					$chaine:=String:C10(Field:C253($Table; $i)->)
					
				: ($TypeChamp=25)  //Est un entier 64 bits - 25
					$chaine:=String:C10(Field:C253($Table; $i)->)
					
				: ($TypeChamp=9)  //Est un Entier long - 9
					$chaine:=String:C10(Field:C253($Table; $i)->)
					
				: ($TypeChamp=35)  //Est un float - 35
					$chaine:=String:C10(Field:C253($Table; $i)->)
					
				: ($TypeChamp=1)  //Est un numérique - 1
					$chaine:=String:C10(Field:C253($Table; $i)->)
					
				: ($TypeChamp=38)  //Est un objet - 38
					
					//VP SET TEXT VALUE(VP Cell("Z_XLS"; $i-1; $ligne); Champ($Table; $i)->)
					
				: ($TypeChamp=2)  //Est un texte - 2
					$chaine:=String:C10(Field:C253($Table; $i)->)
					
				: ($TypeChamp=4)  //Est une date - 4
					$chaine:=String:C10(Field:C253($Table; $i)->)
					
				: ($TypeChamp=11)  //Est une heure - 11
					$chaine:=String:C10(Field:C253($Table; $i)->)
					
				: ($TypeChamp=3)  //Est une image - 3
					//VP SET TEXT VALUE(VP Cell("Z_XLS"; $i-1; $ligne); Champ($Table; $i)->)
					
				: ($TypeChamp=7)  //Est une sous table - 7
					
					
				Else 
					
			End case 
			If ($destination="Fichier")
				
				$chaine:=Replace string:C233($chaine; "\""; ""; 999)
				$chaine:=Replace string:C233($chaine; Char:C90(13); " <br> "; 999)
				$chaine:=Replace string:C233($chaine; Char:C90(10); ""; 999)
				$chaine:=Sup_Ctrl($chaine)
				SEND PACKET:C103($RefDoc; $chaine+$separ)
			Else 
				VP SET TEXT VALUE(VP Cell("Z_XLS"; $i-1; $ligne); $chaine)
			End if 
		End if 
		
	End for 
	
	
	If ($destination="Fichier")
		SEND PACKET:C103($RefDoc; Char:C90(13))
	End if 
	
	If ($destination="XLS")
		If ($Ligne>998)
			$params:=New object:C1471
			$params.format:=vk MS Excel format:K89:2  //".xlsx"
			$params.valuesOnly:=True:C214
			
			VP EXPORT DOCUMENT("Z_XLS"; $chemin+"Export_table_"+Table name:C256($Table)+"_"+String:C10($Segment)+".xlsx"; $params)
			VP NEW DOCUMENT("Z_XLS")
			
			$Table:=10
			$Segment+=1
			$Ligne:=0
			
			For ($i; 1; Get last field number:C255(Table:C252($Table)))
				VP SET TEXT VALUE(VP Cell("Z_XLS"; $i-1; $ligne); Field name:C257($Table; $i))
			End for 
			
		End if 
	End if 
	NEXT RECORD:C51(Table:C252($Table)->)
End while 


If ($destination="Fichier")
	CLOSE DOCUMENT:C267($RefDoc)
Else 
	$params:=New object:C1471
	$params.format:=vk MS Excel format:K89:2  //".xlsx"
	$params.valuesOnly:=True:C214
	VP EXPORT DOCUMENT("Z_XLS"; $chemin+"Export_table_"+Table name:C256($Table)+"_"+String:C10($Segment)+".xlsx"; $params)
End if 

$Table:=75
$Segment:=1
$Ligne:=0
If ($destination="Fichier")
	$RefDoc:=Create document:C266($chemin+Table name:C256($Table)+".txt")
Else 
	VP NEW DOCUMENT("Z_XLS")
End if 
Progress SET TITLE($prog; Table name:C256($Table))
ALL RECORDS:C47(Table:C252($Table)->)
For ($i; 1; Get last field number:C255(Table:C252($Table)))
	If ($destination="Fichier")
		SEND PACKET:C103($RefDoc; Field name:C257($Table; $i)+$separ)
	Else 
		VP SET TEXT VALUE(VP Cell("Z_XLS"; $i-1; $ligne); Field name:C257($Table; $i))
	End if 
End for 

If ($destination="Fichier")
	SEND PACKET:C103($RefDoc; Char:C90(13))
End if 

ALL RECORDS:C47(Table:C252($Table)->)
FIRST RECORD:C50(Table:C252($Table)->)
While (Not:C34(End selection:C36(Table:C252($Table)->)))
	Progress SET PROGRESS($prog; Selected record number:C246(Table:C252($Table)->)/Records in selection:C76(Table:C252($Table)->))
	$Ligne+=1
	
	For ($i; 1; Get last field number:C255(Table:C252($Table)))
		$chaine:=""
		If (Is field number valid:C1000($Table; $i))
			GET FIELD PROPERTIES:C258($Table; $i; $TypeChamp)
			Case of 
				: ($TypeChamp=30)  //Est un BLOB - 30
					//VP SET TEXT VALUE(VP Cell("Z_XLS"; $i-1; $ligne); Champ($Table; $i)->)
					
				: ($TypeChamp=6)  //Est un booléen - 6
					$chaine:=String:C10(Field:C253($Table; $i)->)
					
				: ($TypeChamp=0)  //Est un champ alpha - 0
					$chaine:=String:C10(Field:C253($Table; $i)->)
					
				: ($TypeChamp=8)  //Est un entier - 8
					$chaine:=String:C10(Field:C253($Table; $i)->)
					
				: ($TypeChamp=25)  //Est un entier 64 bits - 25
					$chaine:=String:C10(Field:C253($Table; $i)->)
					
				: ($TypeChamp=9)  //Est un Entier long - 9
					$chaine:=String:C10(Field:C253($Table; $i)->)
					
				: ($TypeChamp=35)  //Est un float - 35
					$chaine:=String:C10(Field:C253($Table; $i)->)
					
				: ($TypeChamp=1)  //Est un numérique - 1
					$chaine:=String:C10(Field:C253($Table; $i)->)
					
				: ($TypeChamp=38)  //Est un objet - 38
					
					//VP SET TEXT VALUE(VP Cell("Z_XLS"; $i-1; $ligne); Champ($Table; $i)->)
					
				: ($TypeChamp=2)  //Est un texte - 2
					$chaine:=String:C10(Field:C253($Table; $i)->)
					
				: ($TypeChamp=4)  //Est une date - 4
					$chaine:=String:C10(Field:C253($Table; $i)->)
					
				: ($TypeChamp=11)  //Est une heure - 11
					$chaine:=String:C10(Field:C253($Table; $i)->)
					
				: ($TypeChamp=3)  //Est une image - 3
					//VP SET TEXT VALUE(VP Cell("Z_XLS"; $i-1; $ligne); Champ($Table; $i)->)
					
				: ($TypeChamp=7)  //Est une sous table - 7
					
					
				Else 
					
			End case 
			If ($destination="Fichier")
				
				$chaine:=Replace string:C233($chaine; "\""; ""; 999)
				$chaine:=Replace string:C233($chaine; Char:C90(13); " <br> "; 999)
				$chaine:=Replace string:C233($chaine; Char:C90(10); ""; 999)
				$chaine:=Sup_Ctrl($chaine)
				SEND PACKET:C103($RefDoc; $chaine+$separ)
			Else 
				VP SET TEXT VALUE(VP Cell("Z_XLS"; $i-1; $ligne); $chaine)
			End if 
		End if 
		
	End for 
	
	
	If ($destination="Fichier")
		SEND PACKET:C103($RefDoc; Char:C90(13))
	End if 
	
	If ($destination="XLS")
		If ($Ligne>998)
			$params:=New object:C1471
			$params.format:=vk MS Excel format:K89:2  //".xlsx"
			$params.valuesOnly:=True:C214
			
			VP EXPORT DOCUMENT("Z_XLS"; $chemin+"Export_table_"+Table name:C256($Table)+"_"+String:C10($Segment)+".xlsx"; $params)
			VP NEW DOCUMENT("Z_XLS")
			
			$Table:=10
			$Segment+=1
			$Ligne:=0
			
			For ($i; 1; Get last field number:C255(Table:C252($Table)))
				VP SET TEXT VALUE(VP Cell("Z_XLS"; $i-1; $ligne); Field name:C257($Table; $i))
			End for 
			
		End if 
	End if 
	NEXT RECORD:C51(Table:C252($Table)->)
End while 


If ($destination="Fichier")
	CLOSE DOCUMENT:C267($RefDoc)
Else 
	$params:=New object:C1471
	$params.format:=vk MS Excel format:K89:2  //".xlsx"
	$params.valuesOnly:=True:C214
	VP EXPORT DOCUMENT("Z_XLS"; $chemin+"Export_table_"+Table name:C256($Table)+"_"+String:C10($Segment)+".xlsx"; $params)
End if 
