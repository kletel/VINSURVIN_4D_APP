If (Self:C308->>0)
	QUERY:C277([Producteur:13]; [Producteur:13]Societe:2=Self:C308->{Self:C308->})
	[Cave:2]Ref_Producteur:33:=[Producteur:13]Ref_Producteur:1
	[Cave:2]Producteur:3:=[Producteur:13]Societe:2
	
	OBJECT SET VISIBLE:C603(*; "Pr_@"; True:C214)
End if 