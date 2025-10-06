//%attributes = {"publishedWeb":true}
ARRAY TEXT:C222($tVnom; 0)
ARRAY TEXT:C222($tVal; 0)
WEB GET VARIABLES:C683($tVnom; $tVal)

$email:=KST_web_Lire_param(->$tVnom; ->$tVal; "email")

$userListe:=ds:C1482.Utilisateur.query("EMail =:1"; $email)
If ($userListe.length=1)
	$user:=$userListe.first()
	$uuidGen:=Generate UUID:C1066
	$user.UUID_temporaire:=$uuidGen
	$user.DateExpiration:=Current date:C33(*)
	// La ligne suivante assigne à lal'heure qu'il sera dans une heure
	$user.HeureExpiration:=Time:C179(Current time:C178+1800)
	$user.save()
	
	
	
	// Lien de réinitialisation
	$urlProd:="https://vinsurvin.vitissia.fr/reset-password?token="+$uuidGen
	$urlDev:="http://localhost:3006/reset-password?token="+$uuidGen
	
	//$str:="Bonjour, \n\n\n Suite à votre demande de réinitialisation de mot de passe réalisé sur notre site,  \r\n\n Veuillez le modifier en suivant ce lien : "+$url+"\r\n Bien cordialement."
	//$str:="Bonjour,\n\nSuite à votre demande de réinitialisation de mot de passe sur notre site, veuillez cliquer sur le lien ci-dessous pour définir un nouveau mot de passe :\n\n"+$urlProd+"\n"+$urlDev+"\n\nCe lien est valable pendant 30 minutes.\n\nSi vous n'êtes pas à l'origine de cette demande, veuillez ignorer ce message.\n\nBien cordialement,\nL'équipe de support."
	$str:="Bonjour,\n\nSuite à votre demande de réinitialisation de mot de passe sur notre site, veuillez cliquer sur le lien ci-dessous pour définir un nouveau mot de passe :\n\n"+$urlProd+"\n\nCe lien est valable pendant 30 minutes.\n\nSi vous n'êtes pas à l'origine de cette demande, veuillez ignorer ce message.\n\nBien cordialement,\nL'équipe de support."
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



$obj:=New object:C1471("entete"; "succes"; "msg"; $UUIDuser; "nomUser"; $nomUser)
$resp:=JSON Stringify:C1217($obj)
WEB SEND TEXT:C677($resp; "application/json")