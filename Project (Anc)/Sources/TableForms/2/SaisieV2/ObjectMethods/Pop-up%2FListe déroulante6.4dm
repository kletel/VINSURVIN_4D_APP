Case of 
	: (Form event code:C388=Sur clic:K2:4)
		
		If (pop_Type>2)
			[Cave:2]Type:4:=pop_Type{pop_Type}
			
			Case of 
				: (POP_TYPE=3) | (POP_TYPE=4)
					ARRAY TEXT:C222(pop_Douc; 7)
					
					// 
					pop_Douc{1}:="Douceur"
					pop_Douc{2}:="-"
					pop_Douc{3}:="Sec"
					pop_Douc{4}:="Pas tout à fait sec"
					pop_Douc{5}:="Demi-sec"
					pop_Douc{6}:="Moelleux"
					pop_Douc{7}:="Doux"
					
				: (POP_TYPE=5)
					ARRAY TEXT:C222(pop_Douc; 9)
					
					// 
					pop_Douc{1}:="Douceur"
					pop_Douc{2}:="-"
					pop_Douc{3}:="Brut nature"
					pop_Douc{4}:="Extra-brut"
					pop_Douc{5}:="Brut"
					pop_Douc{6}:="Extra-dry"
					pop_Douc{7}:="Sec"
					pop_Douc{8}:="Demi-sec"
					pop_Douc{9}:="Doux"
					
			End case 
			//pop_Type:=1
			
		End if 
		
End case 

