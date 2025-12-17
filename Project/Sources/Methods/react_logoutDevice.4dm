//%attributes = {"publishedWeb":true}
ARRAY TEXT:C222($tVnom; 0)
ARRAY TEXT:C222($tVal; 0)
WEB GET VARIABLES:C683($tVnom; $tVal)

$deviceUUID:=KST_web_Lire_param(->$tVnom; ->$tVal; "deviceUUID")

If (Length:C16($deviceUUID)=0)
	WEB SEND TEXT:C677(JSON Stringify:C1217(New object:C1471("entete"; "error"; "message"; "deviceUUID manquant")); "application/json")
	QUIT METHOD
End if 

// 1) Suppression des tokens liés à ce device
var $sel : cs:C1710.TokenSelection
var $deleted : Integer
$deleted:=0

$sel:=ds:C1482.Token.query("UUID_Device = :1"; $deviceUUID)

var $toDrop : Collection
$toDrop:=New collection:C1472

For each ($e; $sel)
	$toDrop.push($e)
End for each 

var $st : Object
For each ($e; $toDrop)
	If ($e#Null:C1517)
		$st:=$e.drop()
		If (Value type:C1509($st)=Is object:K8:27) & ($st.success)
			$deleted:=$deleted+1
		End if 
	End if 
End for each 

// 2) Nettoyage du DeviceUUID côté Utilisateur
var $uSel : cs:C1710.UtilisateurSelection
var $u : cs:C1710.UtilisateurEntity
var $clearedUsers : Integer
$clearedUsers:=0

$uSel:=ds:C1482.Utilisateur.query("DeviceUUID = :1"; $deviceUUID)

For each ($u; $uSel)
	If ($u#Null:C1517)
		$u.DeviceUUID:=""
		$st:=$u.save()
		If (Value type:C1509($st)=Is object:K8:27) & ($st.success)
			$clearedUsers:=$clearedUsers+1
		End if 
	End if 
End for each 

WEB SEND TEXT:C677(JSON Stringify:C1217(New object:C1471("entete"; "succes"; "deleted"; $deleted; "clearedUsers"; $clearedUsers)); "application/json")
