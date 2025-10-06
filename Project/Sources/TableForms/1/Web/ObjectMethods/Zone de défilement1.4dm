If (V_Sites#0)
	QUERY:C277([Sites:15]; [Sites:15]Langue:5=<>LangueInitiale; *)
	QUERY:C277([Sites:15];  & ; [Sites:15]Site:2=V_Sites{V_Sites})
	V_Texte:=[Sites:15]Texte:3
End if 

If (Form event code:C388=Sur double clic:K2:5)
	
	If (V_Sites>0)
		WA OPEN URL:C1020(z_Web; V_Sites{V_Sites})
	End if 
	//
	//$ref:=Creer fenetre formulaire([Sites];"Entrée")
	//MODIFIER ENREGISTREMENT([Sites];*)
	//V_Texte:=[Sites]Texte
End if 
