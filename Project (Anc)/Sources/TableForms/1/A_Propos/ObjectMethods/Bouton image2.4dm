//Ouvrir document(Dossier 4D(6)+
//OUVRIR URL WEB("http://www.innomatix.com";*)
//OUVRIR URL WEB("http://www.microapp.com")
$url:=""
$Ref_File:=Open document:C264(Get 4D folder:C485(6)+"Maj.txt")
RECEIVE PACKET:C104($Ref_File; $url; Char:C90(13))
CLOSE DOCUMENT:C267($Ref_File)
OPEN URL:C673($Url)
