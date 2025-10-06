//%attributes = {}
$type:=New object:C1471("type"; "RSA"; "size"; 2048)
//$type:=Créer objet("type"; "RSA"; "size"; 1024)
$key:=4D:C1709.CryptoKey.new($type)
$publicKey:=$key.getPublicKey()
$privateKey:=$key.getPrivateKey()
READ WRITE:C146([KSF_CRYPTO_KEYS:24])
QUERY:C277([KSF_CRYPTO_KEYS:24]; [KSF_CRYPTO_KEYS:24]nom:4="keysav")
If (Records in selection:C76([KSF_CRYPTO_KEYS:24])=0)
	CREATE RECORD:C68([KSF_CRYPTO_KEYS:24])
	[KSF_CRYPTO_KEYS:24]privatekey:1:=$privateKey
	[KSF_CRYPTO_KEYS:24]publickey:3:=$publicKey
	[KSF_CRYPTO_KEYS:24]nom:4:="keysav"
	SAVE RECORD:C53([KSF_CRYPTO_KEYS:24])
	UNLOAD RECORD:C212([KSF_CRYPTO_KEYS:24])
End if 