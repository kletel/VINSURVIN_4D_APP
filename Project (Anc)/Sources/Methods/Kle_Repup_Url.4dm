//%attributes = {}
C_BLOB:C604($Blob_Recu; $Blob_Concatene)
C_LONGINT:C283($srcpos; $dstpos)

If (Count parameters:C259>0)
	$IP:=$1
	$URL:=$2
	$Destination:=$3
Else 
	$IP:="www.promo-and-tools.net"
	$URL:="/statistiques_gains/donnees_brutes/creanet_20060825"+"_1149.xml"
	$Destination:="PowerMac Cyrille:Dest.xml"
End if 
$err:=NET_Resolve($IP; Adr_IP)
$err:=TCP_Open(Adr_IP; 80; $RefConn)
$Chaine:="GET "+$URL+" HTTP/1.1"+Char:C90(13)+Char:C90(10)+"Host: "+$IP+Char:C90(13)+Char:C90(10)+Char:C90(13)+Char:C90(10)+Char:C90(13)+Char:C90(10)
$err:=TCP_Send($RefConn; $Chaine)
$nbcpt:=Tickcount:C458

Repeat 
	$Err:=TCP_ReceiveBLOB($RefConn; $Blob_Recu)
	$Err:=TCP_State($RefConn; $State)
	$srcpos:=0
	$dstpos:=BLOB size:C605($Blob_Concatene)
	COPY BLOB:C558($Blob_Recu; $Blob_Concatene; $srcpos; $dstpos; BLOB size:C605($Blob_Recu))
Until (($State=0) | ($err#0) | ((Tickcount:C458-$nbcpt)>(60*5)))
$err:=TCP_Close($RefConn)

SET BLOB SIZE:C606($Blob_Recu; 0)
For ($i; 0; BLOB size:C605($Blob_Concatene)-1)
	$car:=Char:C90($Blob_Concatene{$i})
	If ($car="<")
		COPY BLOB:C558($Blob_Concatene; $Blob_Recu; $i; 0; BLOB size:C605($Blob_Concatene)-1-$i)
		$i:=BLOB size:C605($Blob_Concatene)
	End if 
End for 

CREATE RECORD:C68([Import:20])
[Import:20]URL:1:=$URL
$offset:=0
[Import:20]Contenue:2:=BLOB to text:C555($Blob_Concatene; 3; $offset)
While ($offset<BLOB size:C605($Blob_Concatene))
	[Import:20]Contenue:2:=[Import:20]Contenue:2+BLOB to text:C555($Blob_Concatene; 3; $offset)
End while 
$position:=Position:C15("http://bdi2.chateauonline.com/commun/vignettes/"; [Import:20]Contenue:2)
If ($position>0)
	$urlImage:=Substring:C12([Import:20]Contenue:2; $position)
	$urlImage:=Substring:C12($urlImage; 1; Position:C15("\""; $urlImage)-1)
	$urlImage:=Replace string:C233($urlImage; "t2.jpg"; "Zoom.jpg")
	[Import:20]NomImage:4:=$urlImage
	Import_Recup_Image("bdi2.chateauonline.com"; $urlImage)
End if 

SAVE RECORD:C53([Import:20])

//BLOB VERS DOCUMENT($Destination;$Blob_Recu)

