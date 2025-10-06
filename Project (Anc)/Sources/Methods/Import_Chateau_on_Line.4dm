//%attributes = {}
For ($i; 10895; 99999)
	
	$Url:="http://www.chateauonline.fr/pages/fichevin.asp?idproduct="+String:C10($i)+"&subprodid=42708"
	Kle_Repup_Url("www.chateauonline.fr"; $url; "")
	
End for 
