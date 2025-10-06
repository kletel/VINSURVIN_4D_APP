//%attributes = {}

C_TEXT:C284($pythonPath; $scriptPath; $param; $cmd; $result; $output; $errorOutput)
C_LONGINT:C283($status)

$pythonPath:="python3"  // ou le chemin absolu vers l’interpréteur Python, ex : "/usr/bin/python3"
$scriptPath:=String:C10(Folder:C1567(fk dossier ressources:K87:11).platformPath)+"test.py"
$xmlContent:=Folder:C1567(fk dossier ressources:K87:11).file("test.py").getText()

// Paramètre à passer
$param:="Bonjour depuis 4D"

// Commande à lancer
$cmd:=$pythonPath+" "+"\""+$scriptPath+"\""+" "+"\""+$param+"\""

// Option : ne pas bloquer 4D pendant l’exécution
SET ENVIRONMENT VARIABLE:C812("_4D_OPTION_BLOCKING_EXTERNAL_PROCESS"; "false")

// Lance le script et récupère la sortie
$status:=LAUNCH EXTERNAL PROCESS:C811($cmd; $output; $errorOutput)


// Vérifie les résultats
If ($status=0)
	// $output contient le JSON renvoyé par Python
	$result:=JSON Parse:C1218($output)
	ALERT:C41("Réponse : "+JSON Stringify:C1217($result; Is formatted text))
Else 
	ALERT:C41("Erreur ("+$status+"): "+$errorOutput)
End if 
