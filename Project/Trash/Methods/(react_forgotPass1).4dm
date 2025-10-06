//%attributes = {"publishedWeb":true}
ARRAY TEXT:C222($tVnom; 0)
ARRAY TEXT:C222($tVal; 0)
WEB GET VARIABLES:C683($tVnom; $tVal)

$email:=KST_web_Lire_param(->$tVnom; ->$tVal; "email")

$userListe:=ds:C1482.Utilisateur.query("EMail =:1"; $email)
If ($userListe.length=1)
	$user:=$userListe.first()
	//envoie mail de récupération
	$key_t:=KST_loadcryptokeyobj
	$privatekey:=$key_t.privatekey
	$publickey:=$key_t.publickey
	
	//import plugin jwt de miyako
	$header:=New object:C1471("alg"; "RS256"; "typ"; "JWT")
	$payload:=New object:C1471("name"; "Récupération mdp")  //$payload:=$usertxt  //Créer objet("sub"; "1234567890"; "name"; "John Doe"; "admin"; Vrai; "iat"; "1516239022")
	
	$token:=JWT Sign(JSON Stringify:C1217($header); JSON Stringify:C1217($payload); $privatekey)
	ASSERT:C1129(1=JWT Verify($token; $publickey))
	$obj:=New object:C1471("accessToken"; $token; "uuidUser"; $UUIDuser; "nomUser"; $nomUser)
	$resp:=JSON Stringify:C1217($obj)
	WEB SEND TEXT:C677($resp; "application/json")
	
	// Hash du token
	$tokenHash:=Generate digest:C1147($token; Digest SHA256:K66:4)
	
	$resetPass:=ds:C1482.ResetPassToken.new()
	$resetPass.userUUID:=$user.UUID_
	$resetPass.tokenHash:=$tokenHash
	//$resetPass.dateExpiration:=Timestamp+1800000  //(30*60000)
	$resetPass.used:=False:C215
	$resetPass.save()
	
	// Lien de réinitialisation
	//$url:="https://vinsurvin.vitissia.net/reset-password?token="+react_encodeURL($token)
	$url:="https://vinsurvin.vitissia.fr/reset-password?token="+$tokenHash
	$url:="http://localhost:3006/reset-password?token="+$tokenHash
	
	$str:="Suite à votre demande sur notre site,  \r\n voici le lien de réinitialisation : "+$url+"\r\n Bien cordialement."
	$emailTitle_t:="Réinitialiser votre mot de passe"
	$emailFrom_t:="no-reply@savplus-manager.com"
	$emailBody_t:=$str
	$smtpHost_t:="mail01.kletel.com"
	$smtpOption_l:=10
	$smtpPort_l:=2525
	$smtpUser_t:="no-reply@savplus-manager.com"
	//$smtpUser_t:="no-reply@vinsurvin.net"
	$smtpPass_t:="WazNRMaa1"
	$emailTo_t:=$email
	$err_l:=SMTP_QuickSend($smtpHost_t; $emailFrom_t; $emailTo_t; $emailTitle_t; $emailBody_t; $smtpOption_l; $smtpPort_l; $smtpUser_t; $smtpPass_t)
	
End if 
