Case of 
	: (Form event code:C388=Sur chargement:K2:1)
		MESSAGES OFF:C175
		ALL RECORDS:C47([Millésimes:4])
		ORDER BY:C49([Millésimes:4]; [Millésimes:4]Annee:1; >)
		ALL RECORDS:C47([Titre_Millesime:14])
		QUERY:C277([Titre_Millesime:14]; [Titre_Millesime:14]Langue:3=<>LangueInitiale)
		ORDER BY:C49([Titre_Millesime:14]; [Titre_Millesime:14]Pays:1; >)
		SELECTION TO ARRAY:C260([Titre_Millesime:14]Pays:1; Pop_Pays)
		Pop_Pays:=Find in array:C230(Pop_Pays; "France")
		V_A_Pays:="France"
		QUERY:C277([Titre_Millesime:14]; [Titre_Millesime:14]Pays:1=V_A_Pays)
		QUERY:C277([Millésimes:4]; [Millésimes:4]Pays:11=V_A_Pays)
		ORDER BY:C49([Millésimes:4]; [Millésimes:4]Annee:1; <)
		
		Case of 
			: (<>Langue=1)  //France
				
				OBJECT SET VISIBLE:C603(*; "@_Image"; False:C215)
				OBJECT SET VISIBLE:C603(*; "FR_Image"; True:C214)
				
			: (<>Langue=2)  //Danois
				
				OBJECT SET VISIBLE:C603(*; "@_Image"; False:C215)
				OBJECT SET VISIBLE:C603(*; "DA_Image"; True:C214)
				
			: (<>Langue=3)  //Anglais
				
				OBJECT SET VISIBLE:C603(*; "@_Image"; False:C215)
				OBJECT SET VISIBLE:C603(*; "EN_Image"; True:C214)
				
			: (<>Langue=4)  //Espagnol
				
				OBJECT SET VISIBLE:C603(*; "@_Image"; False:C215)
				OBJECT SET VISIBLE:C603(*; "ES_Image"; True:C214)
				
			: (<>Langue=5)  //Allemande
				
				OBJECT SET VISIBLE:C603(*; "@_Image"; False:C215)
				OBJECT SET VISIBLE:C603(*; "AL_Image"; True:C214)
		End case 
		
End case 