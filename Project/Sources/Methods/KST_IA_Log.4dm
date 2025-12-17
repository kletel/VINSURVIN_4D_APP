//%attributes = {"publishedWeb":true,"preemptive":"capable"}
// Méthode projet : KST_IA_Log($1 : Text; $2 : Text)
C_TEXT:C284($1; $2)

// On crée une nouvelle entité dans la table LOG_IA
var $log : cs:C1710.LOG_IAEntity  // adapte le nom si ta table s'appelle autrement

$log:=ds:C1482.LOG_IA.new()

$log.Date_Log:=Current date:C33(*)
$log.Heure_Log:=Current time:C178
$log.Tag:=$1s
$log.Message:=$2

$log.save()
