
QUERY:C277([Interface:1]; [Interface:1]Rubrique1:1="Affichage_Liste_Vin")
If (Records in selection:C76([Interface:1])=0)
	CREATE RECORD:C68([Interface:1])
	[Interface:1]Rubrique1:1:="Affichage_Liste_Vin"
	[Interface:1]vuedefaut:9:=2
	SAVE RECORD:C53([Interface:1])
End if 

Case of 
	: (Form event code:C388=Sur clic:K2:4)
		Cave_Graphe_liste
		OBJECT SET VISIBLE:C603(Img_Lst_Svg; True:C214)
		OBJECT SET VISIBLE:C603(Lst_Cave; False:C215)
		
		QUERY:C277([Interface:1]; [Interface:1]Rubrique1:1="Affichage_Liste_Vin")
		[Interface:1]vuedefaut:9:=2
		Type_Affichage:=2
		SAVE RECORD:C53([Interface:1])
		
		If (Type_Affichage=2)
			OBJECT SET VISIBLE:C603(*; "Btn1-1"; True:C214)
			OBJECT SET VISIBLE:C603(*; "Btn1-2"; False:C215)
			OBJECT SET VISIBLE:C603(*; "Btn2-1"; False:C215)
			OBJECT SET VISIBLE:C603(*; "Btn2-2"; True:C214)
		End if 
		REDRAW WINDOW:C456(Current form window:C827)
		
End case 