//%attributes = {}
C_TEXT:C284($1; $method)
C_TEXT:C284($2; $endpoint)
C_COLLECTION:C1488($3; $headers)
C_BLOB:C604($4; $request)
C_OBJECT:C1216($0)
C_TEXT:C284($httpresponse)

$method:=$1
$endpoint:=$2
$headers:=$3
$request:=$4

ARRAY TEXT:C222($hn; 0)
ARRAY TEXT:C222($hv; 0)

For ($i; 0; $headers.length-1; 2)
	APPEND TO ARRAY:C911($hn; $headers[$i])
	APPEND TO ARRAY:C911($hv; $headers[$i+1])
End for 

$status:=HTTP Request:C1158($method; $endpoint; $request; $httpresponse; $hn; $hv)

$0:=JSON Parse:C1218($httpresponse)


