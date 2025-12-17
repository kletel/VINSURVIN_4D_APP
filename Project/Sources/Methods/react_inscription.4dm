//%attributes = {"publishedWeb":true}
ARRAY TEXT:C222($tVnom; 0)
ARRAY TEXT:C222($tVal; 0)
WEB GET VARIABLES:C683($tVnom; $tVal)
READ WRITE:C146([Utilisateur:17])
$email:=KST_web_Lire_param(->$tVnom; ->$tVal; "email")
$pass:=KST_web_Lire_param(->$tVnom; ->$tVal; "pass")
$nom:=KST_web_Lire_param(->$tVnom; ->$tVal; "nom")
$prenom:=KST_web_Lire_param(->$tVnom; ->$tVal; "prenom")
$statut:=KST_web_Lire_param(->$tVnom; ->$tVal; "statut")
$telephone:=KST_web_Lire_param(->$tVnom; ->$tVal; "telephone")
$deviceUUID:=KST_web_Lire_param(->$tVnom; ->$tVal; "deviceUUID")
//TRACE
$userList:=ds:C1482.Utilisateur.query("EMail = :1"; $email)
//CHERCHER([Utilisateur]; [Utilisateur]EMail=$email)
If ($userList.length=0)  // (Enregistrements trouvés([Utilisateur])=0)
/*
CRÉER ENREGISTREMENT([Utilisateur])
[Utilisateur]EMail:=$email
[Utilisateur]MotDePasse:=$pass
[Utilisateur]Nom:=$nom
[Utilisateur]Prenom:=$prenom
[Utilisateur]RemarqueProfile:=$statut
[Utilisateur]Telephone:=$telephone
STOCKER ENREGISTREMENT([Utilisateur])
*/
	$user:=ds:C1482.Utilisateur.new()
	$user.EMail:=$email
	$user.MotDePasse:=$pass
	$user.Nom:=$nom
	$user.Prenom:=$prenom
	$user.RemarqueProfile:=$statut
	$status:=$user.save()
	
	If ($status.success)
		WEB SEND TEXT:C677("succes"; "text/plain")
	Else 
		WEB SEND TEXT:C677("echec"; "text/plain")
	End if 
Else 
	WEB SEND TEXT:C677("email déjà existant"; "text/plain")
End if 