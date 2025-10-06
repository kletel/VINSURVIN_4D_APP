//%attributes = {}
//Initiamisation des variables
//$Etat : - 1= Faux
//         : 0   = Normale

$Serial:=""
$Etat:=-1
$Ref:=0
$DateExpire:=!00-00-00!
$Divers:=""

ARRAY TEXT:C222(T_Serie; 10)
ARRAY REAL:C219(T_NumSerie; 10)
For ($i; 1; 10)
	T_Serie{$i}:=""
	T_NumSerie{$i}:=0
End for 

po:=1
For ($i; 1; Length:C16($1->))
	$Car:=Substring:C12($1->; $i; 1)
	If ($Car="-")
		po:=po+1
		If (po>9)
			$i:=Length:C16($1->)+1
		End if 
	Else 
		T_Serie{po}:=T_Serie{po}+$Car
	End if 
End for 

If (T_Serie{1}="VIN6")
	T_NumSerie{2}:=RegeneCle(T_Serie{2})
	T_NumSerie{3}:=RegeneCle(T_Serie{3})
	T_NumSerie{4}:=RegeneCle(T_Serie{4})
	T_NumSerie{5}:=RegeneCle(T_Serie{5})
	T_NumSerie{6}:=RegeneCle(T_Serie{6})
	T_NumSerie{7}:=RegeneCle(T_Serie{7})
	//Si (T_NumSerie{2}=-1) | (T_NumSerie{3}=-1) | (T_NumSerie{4}=-1) | (T_NumSerie{5}=-1)
	If (T_NumSerie{2}=-1) | (T_NumSerie{3}=-1) | (T_NumSerie{4}=-1) | (T_NumSerie{5}=-1) | (T_NumSerie{6}=-1) | (T_NumSerie{7}=-1)
		
	Else 
		$Etat:=0
		$Ref:=T_NumSerie{2}
		$Da1:=String:C10(T_NumSerie{3}-T_NumSerie{2}; "00000000")
		$da:=Date:C102(Substring:C12($Da1; 1; 2)+"/"+Substring:C12($Da1; 3; 2)+"/"+Substring:C12($Da1; 5; 4))
		If ($da=!1966-09-18!)
			$DateExpire:=!00-00-00!
		Else 
			$DateExpire:=$da
		End if 
	End if 
Else 
End if 

$2->:=$Etat
$3->:=$Ref
$4->:=$DateExpire
$5->:=$Divers
