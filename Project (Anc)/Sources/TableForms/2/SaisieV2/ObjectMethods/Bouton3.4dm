FORM SET INPUT:C55([Producteur:13]; "Entrée")
ADD RECORD:C56([Producteur:13])
If (Ok=1)
	[Cave:2]Ref_Producteur:33:=[Producteur:13]Ref_Producteur:1
	
	ALL RECORDS:C47([Producteur:13])
	ORDER BY:C49([Producteur:13]Societe:2; >)
	SELECTION TO ARRAY:C260([Producteur:13]Societe:2; Lst_Product)
	OBJECT SET VISIBLE:C603(*; "Pr_@"; True:C214)
	
End if 

QUERY:C277([Producteur:13]; [Producteur:13]Ref_Producteur:1=[Cave:2]Ref_Producteur:33)