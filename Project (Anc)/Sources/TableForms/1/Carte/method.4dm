Case of 
	: (Form event code:C388=Sur chargement:K2:1)
		
		//Àjout de Jean-Alexandre
		LIST TO ARRAY:C288("Onglet_Carte_"+<>LangueInitiale; Onglet1)
		Onglet1:=1
		
		CREATE SET:C116([Cave:2]; "Tmp_Cave")
		CLEAR LIST:C377(Lst_Pays_H)
		Lst_Pays_H:=New list:C375
		ALL RECORDS:C47([Pays:8])
		
		Kle_Langue
		
		V_Tout_Pays:=1
		
		V_Pays_A_Grapher:=0
		V_Type_Graphe:=1
		
		OBJECT SET VISIBLE:C603([Pays:8]Carte:2; False:C215)
		OBJECT SET VISIBLE:C603([Pays:8]Carte_All:14; False:C215)
		OBJECT SET VISIBLE:C603([Pays:8]Carte_Dk:11; False:C215)
		OBJECT SET VISIBLE:C603([Pays:8]Carte_En:12; False:C215)
		OBJECT SET VISIBLE:C603([Pays:8]Carte_Es:13; False:C215)
		OBJECT SET VISIBLE:C603(V_Carte->; True:C214)
		
		ORDER BY:C49([Pays:8]; V_L_pays->; >)
		DISTINCT VALUES:C339(V_L_pays->; L_Cat)
		
		For (i; 1; Size of array:C274(L_Cat))
			QUERY:C277([Pays:8]; V_L_pays->=L_Cat{i})
			QUERY:C277([Region:9]; [Region:9]Ref_Pays:10=[Pays:8]Ref_Pays:1)
			ORDER BY:C49([Region:9]; V_L_region->; >)
			USE SET:C118("Tmp_Cave")
			QUERY SELECTION:C341([Cave:2]; [Cave:2]Ref_Pays:27=[Pays:8]Ref_Pays:1)
			V_L_nb_bout2:=Sum:C1([Cave:2]Reste_en_Cave:19)
			[Pays:8]Nb_Bouteilles:9:=V_L_nb_bout2
			[Pays:8]Nb_Vins:10:=Records in selection:C76([Cave:2])
			SAVE RECORD:C53([Pays:8])
			
			L_Cat3:=New list:C375
			FIRST RECORD:C50([Region:9])
			While (Not:C34(End selection:C36([Region:9])))
				If (V_L_nb_bout2>0)
					USE SET:C118("Tmp_Cave")
					QUERY SELECTION:C341([Cave:2]; [Cave:2]Ref_Pays:27=[Pays:8]Ref_Pays:1)
					QUERY SELECTION:C341([Cave:2]; [Cave:2]Ref_Region:28=[Region:9]Ref_Region:1)
					V_L_nb_bout:=Sum:C1([Cave:2]Reste_en_Cave:19)
				Else 
					V_L_nb_bout:=0
				End if 
				
				If (V_L_nb_bout>0)
					APPEND TO LIST:C376(L_Cat3; V_L_region->+" ("+String:C10(V_L_nb_bout)+")"; [Pays:8]Ref_Pays:1*10000+[Region:9]Ref_Region:1)
					SET LIST ITEM PROPERTIES:C386(L_Cat3; 0; False:C215; 1; 0)
				Else 
					APPEND TO LIST:C376(L_Cat3; V_L_region->; [Pays:8]Ref_Pays:1*10000+[Region:9]Ref_Region:1)
					SET LIST ITEM PROPERTIES:C386(L_Cat3; 0; False:C215; 2; 0)
				End if 
				
				NEXT RECORD:C51([Region:9])
			End while 
			
			If (V_L_nb_bout2>0)
				APPEND TO LIST:C376(Lst_Pays_H; V_L_pays->+" ("+String:C10(V_L_nb_bout2)+")"; -[Pays:8]Ref_Pays:1; L_Cat3; False:C215)
				SET LIST ITEM PROPERTIES:C386(Lst_Pays_H; 0; False:C215; 1; 0)
			Else 
				APPEND TO LIST:C376(Lst_Pays_H; V_L_pays->; -[Pays:8]Ref_Pays:1; L_Cat3; False:C215)
				SET LIST ITEM PROPERTIES:C386(Lst_Pays_H; 0; False:C215; 2; 0)
			End if 
			
		End for 
		QUERY:C277([Pays:8]; [Pays:8]Ref_Pays:1=1)
		V_Img_Carte:=[Pays:8]Carte:2
		
End case 

USE SET:C118("Tmp_Cave")