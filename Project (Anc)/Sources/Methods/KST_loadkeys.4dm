//%attributes = {}
C_OBJECT:C1216($0)
C_OBJECT:C1216($objkeys)
QUERY:C277([KSF_CRYPTO_KEYS:24]; [KSF_CRYPTO_KEYS:24]nom:4="keysav")
If (Records in selection:C76([KSF_CRYPTO_KEYS:24])=1)
	$privatekey:=[KSF_CRYPTO_KEYS:24]privatekey:1
	$publickey:=[KSF_CRYPTO_KEYS:24]publickey:3
	$objkeys:=New object:C1471("publickey"; $publickey; "privatekey"; $privatekey)
End if 
$0:=$objkeys