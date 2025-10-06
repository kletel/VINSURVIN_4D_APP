//%attributes = {}
C_TEXT:C284($1)
C_COLLECTION:C1488($2)
C_BLOB:C604($3)
C_OBJECT:C1216($0)

$reponse:=KSF_HTTP_REQUEST(HTTP méthode POST:K71:2; $1; $2; $3)

$0:=$reponse