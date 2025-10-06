//%attributes = {}
//Parametre $1 -> la référence de la campage 
//                          - 1 Indique qu'on veux toutes les campagnes

//Parametre $2  -> La reference de la lettre type que l'on désir traiter

C_LONGINT:C283($1; $2)
ARRAY REAL:C219(TB; 0)
_O_ARRAY STRING:C218(30; TA; 0)
If (V_Tout_Pays=1)
	$Choix:=0
Else 
	$Choix:=$1
End if 


Case of 
	: ($Choix=0)
		QUERY:C277([Pays:8]; [Pays:8]Nb_Bouteilles:9>0)
		
		ORDER BY:C49([Pays:8]; [Pays:8]Nom_Fr:3; >)
		SELECTION TO ARRAY:C260([Pays:8]Nom_Fr:3; TA)
		SELECTION TO ARRAY:C260([Pays:8]Nb_Bouteilles:9; TB)
		$Max:=(Int:C8(Max:C3([Pays:8]Nb_Bouteilles:9)/10)+1)*10
		If (False:C215)
			//TABLEAU REEL(TB;0)
			//TABLEAU REEL(TC;0)
			//TABLEAU REEL(TD;0)
			//TABLEAU ALPHA(30;TA;0)
			//
			//Si (Taille tableau(TA)>0)
			//SUPPRIMER LIGNES(TA;1;Taille tableau(TA))
			//Fin de si 
			//INSERER LIGNES(TA;1;Taille tableau(Lst_Campagne))
			//Si (Taille tableau(TB)>0)
			//SUPPRIMER LIGNES(TB;1;Taille tableau(TB))
			//Fin de si 
			//INSERER LIGNES(TB;1;Taille tableau(Lst_Campagne))
			//
			//Si (Taille tableau(TC)>0)
			//SUPPRIMER LIGNES(TB;1;Taille tableau(TC))
			//Fin de si 
			//INSERER LIGNES(TC;1;Taille tableau(Lst_Campagne))
			//
			//Si (Taille tableau(TD)>0)
			//SUPPRIMER LIGNES(TB;1;Taille tableau(TD))
			//Fin de si 
			//INSERER LIGNES(TD;1;Taille tableau(Lst_Campagne))
			//
			//Si (Taille tableau(TB)>0)
			//SUPPRIMER LIGNES(TB;1;Taille tableau(TB))
			//Fin de si 
			//INSERER LIGNES(TB;1;Taille tableau(Lst_Campagne))
			//NOMMER ENSEMBLE([Courrier envoye];"Ens_Cour_Tmp")
			//
			//Boucle ($i;1;Taille tableau(Lst_Campagne))
			//TA{$i}:=Lst_Campagne{$i}
			//UTILISER ENSEMBLE("Ens_Cour_Tmp")
			//FIXER DESTINATION RECHERCHE(Vers variable ;$Nb)
			//CHERCHER DANS SELECTION([Courrier envoye];[Courrier envoye]Ref_Campage=Lst_RefCampagne{$i})
			//TB{$i}:=$Nb
			//CHERCHER DANS SELECTION([Courrier envoye];[Courrier envoye]Etat#"Envoye")
			//TC{$i}:=$Nb
			//FIXER DESTINATION RECHERCHE(Vers sélection courante )
			//
			//  `Recu des stats serveur
			//$err:=NET_Resolve ("sgbd.kletel.net";Adr_IP)
			//$err:=TCP_Open (Adr_IP;80;$RefConn)
			//$Chaine:="GET "+"/4DAction/Emailink3_Report_1/"+"?v_Mail="+[Comptes]Adresse_Mail+"&v_Campage="+Chaine(Lst_RefCampagne{$i})+"&v_Id="+[Lettre Type]Id_+" HTTP/1.1"+Caractere(13)+Caractere(10)+Caractere(13)+Caractere(10)+Caractere(13)+Caractere(10)
			//$err:=TCP_Send ($RefConn;$Chaine)
			//$time:=Nombre de ticks
			//$Txt:=""
			//$Err:=TCP_Receive ($RefConn;$TxtTmp)
			//$Txt:=$Txt+$TxtTmp
			//Tant que ($Txt="") & ((Nombre de ticks-$time)<(60*60*2))
			//$Err:=TCP_Receive ($RefConn;$TxtTmp)
			//$Txt:=$Txt+$TxtTmp
			//Fin tant que 
			//$po:=Position("OUVU";$txt)
			//Si ($Po>0)
			//CHERCHER([Campagnes];[Campagnes]Ref=Lst_RefCampagne{$i})
			//
			//[Campagnes]Nb_Ouv:=Num(Sous chaine($Txt;$Po+5;9))
			//STOCKER ENREGISTREMENT([Campagnes])
			//
			//  `Mise à jour des liens 
			//CHERCHER([Stat_Liens_Reporting];[Stat_Liens_Reporting]Ref_Campagne=[Campagnes]Ref)
			//SUPPRIMER SELECTION([Stat_Liens_Reporting])
			//$Po:=Position("LIEN=";$Txt)
			//$Url:=""
			//$NbClic:=""
			//$Posi:=0
			//$Car:=""
			//Si ($Po>0)
			//Boucle ($jj;Position("LIEN=";$Txt);Longueur($Txt))
			//$Car:=Sous chaine($Txt;$jj;1)
			//Si (Code ascii($car)>=32) | (Code ascii($Car)=13)
			//Au cas ou 
			//: ($car=Caractere(13))
			//Si ($Url#"")
			//CREER ENREGISTREMENT([Stat_Liens_Reporting])
			//[Stat_Liens_Reporting]Ref_Campagne:=[Campagnes]Ref
			//[Stat_Liens_Reporting]URL:=Sous chaine($Url;6)
			//[Stat_Liens_Reporting]Nb_Clic:=Num($NbClic)
			//[Stat_Liens_Reporting]Ref_Lerttre_Type:=[Campagnes]Ref_Lettre
			//STOCKER ENREGISTREMENT([Stat_Liens_Reporting])
			//Fin de si 
			//
			//$Url:=""
			//$NbClic:=""
			//$Posi:=0
			//$Car:=""
			//: ($Car=" ")
			//$Posi:=1
			//Sinon 
			//Si ($Posi=0)
			//$Url:=$Url+$Car
			//Sinon 
			//$NbClic:=$NbClic+$Car
			//Fin de si 
			//Fin de cas 
			//Fin de si 
			//Fin de boucle 
			//Fin de si 
			//
			//Sinon 
			//TD{$i}:=0
			//Fin de si 
			//TD{$i}:=[Campagnes]Nb_Ouv
			//
			//Fin de boucle 
		End if 
		SET QUERY DESTINATION:C396(Vers sélection courante:K19:1)
		
	: ($Choix>0)  //On graphe un pays
		$Max:=0
		QUERY:C277([Cave:2]; [Cave:2]Ref_Pays:27=$1; *)
		QUERY:C277([Cave:2];  & ; [Cave:2]Reste_en_Cave:19>0)
		
		ORDER BY:C49([Cave:2]; [Cave:2]Région:5; >)
		DISTINCT VALUES:C339([Cave:2]Région:5; TA)
		If (Size of array:C274(TB)>0)
			DELETE FROM ARRAY:C228(TB; 1; Size of array:C274(TB))
		End if 
		INSERT IN ARRAY:C227(TB; 1; Size of array:C274(TA))
		For ($i; 1; Size of array:C274(TA))
			QUERY:C277([Cave:2]; [Cave:2]Ref_Pays:27=$1; *)
			QUERY:C277([Cave:2];  & ; [Cave:2]Région:5=TA{$i})
			TB{$i}:=Sum:C1([Cave:2]Reste_en_Cave:19)
			If (TB{$i}>$Max)
				$Max:=TB{$i}
			End if 
		End for 
		$Max:=(Int:C8($Max/10)+1)*10
		
End case 

GRAPH:C169(V_Img_Carte; $2; TA; TB)
If ($2=7)  //C'est un camenberg
	GRAPH SETTINGS:C298(V_Img_Carte; 0; 0; 0; $Max; False:C215; False:C215; True:C214; "Nb Bouteilles")
Else 
	GRAPH SETTINGS:C298(V_Img_Carte; 0; 0; 0; $Max; False:C215; False:C215; True:C214; "Nb Bouteilles")
End if 
//REDESSINER(GR1)
//REDESSINER FENETRE(Fenetre formulaire courant)