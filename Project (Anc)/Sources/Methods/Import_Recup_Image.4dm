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
$Charecherche:=Char:C90(13)+Char:C90(10)+Char:C90(13)+Char:C90(10)
$tr:=0
If (BLOB size:C605($Blob_Concatene)>4)
	While (Char:C90($Blob_Concatene{$tr})+Char:C90($Blob_Concatene{$tr+1})+Char:C90($Blob_Concatene{$tr+2})+Char:C90($Blob_Concatene{$tr+3})#$Charecherche) & (BLOB size:C605($Blob_Concatene)>($Tr+4))
		$Tr:=$Tr+1
	End while 
End if 
SET BLOB SIZE:C606($Blob_Recu; 0)
If (BLOB size:C605($Blob_Concatene)>4)
	COPY BLOB:C558($Blob_Concatene; $Blob_Recu; $tr+4; 0; BLOB size:C605($Blob_Concatene)-$Tr-4)
	
	$NomImage:=$URL
	$pos:=Position:C15("/"; $NomImage)
	While ($pos>0)
		$NomImage:=Substring:C12($NomImage; $Pos+1)
		$pos:=Position:C15("/"; $NomImage)
	End while 
	If (BLOB size:C605($Blob_Recu)>100)
		BLOB TO DOCUMENT:C526("Lacie:Image.jpg"; $Blob_Recu)
		READ PICTURE FILE:C678("Lacie:Image.jpg"; [Import:20]Image:3)
		DELETE DOCUMENT:C159("Lacie:Image.jpg")
		SAVE RECORD:C53([Import:20])
	End if 
End if 