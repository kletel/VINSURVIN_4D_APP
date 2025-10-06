//%attributes = {}
C_OBJECT:C1216($keys)
C_OBJECT:C1216($settings)
$keys:=KST_loadkeys
If (OB Is empty:C1297($keys))
	KST_createkeys
	$keys:=KST_loadkeys
End if 

//$settings:=Créer objet("type"; "PEM"; "pem"; $keys.publickey)

//$0:=Generer UUID
$0:=$keys