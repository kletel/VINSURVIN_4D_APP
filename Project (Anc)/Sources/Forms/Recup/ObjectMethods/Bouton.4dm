For ($i; 27362; 99999)
	//$i:=10895
	$Url:="http://www.chateauonline.fr/pages/fichevin.asp?idproduct="+String:C10($i)+"&subprodid=42708"
	
	CREATE RECORD:C68([Import:20])
	IDLE:C311
	WA OPEN URL:C1020(zWeb; $Url)
	IDLE:C311
	REDRAW:C174(zWeb)
	DELAY PROCESS:C323(Current process:C322; 120)
	[Import:20]URL:1:=$URL
	[Import:20]Contenue:2:=WA Get page content:C1038(zWeb)
	[Import:20]Pos:5:=$i
	$position:=Position:C15("http://bdi2.chateauonline.com/commun/vignettes/"; [Import:20]Contenue:2)
	If ($position>0)
		$urlImage:=Substring:C12([Import:20]Contenue:2; $position)
		$urlImage:=Substring:C12($urlImage; 1; Position:C15("\""; $urlImage)-1)
		$urlImage:=Replace string:C233($urlImage; "t2.jpg"; "Zoom.jpg")
		[Import:20]NomImage:4:=$urlImage
		Import_Recup_Image("bdi2.chateauonline.com"; $urlImage)
	End if 
	Chateau_Analyse
	SAVE RECORD:C53([Import:20])
	
	//Kle_Repup_Url ("www.chateauonline.fr";$url;"")
	
End for 
