//%attributes = {"publishedWeb":true,"preemptive":"capable"}
WEB GET HTTP HEADER:C697($tVnom; $tVal)

$auth:=KST_web_Lire_param(->$tVnom; ->$tVal; "Authorization")
$token:=String:C10($auth)

C_BOOLEAN:C305($result_b)

$4dcryptokey:=KST_loadcryptokeyobj
$key_t:=$4dcryptokey.getPrivateKey()

$result_b:=KST_jwtValidate($token; $key_t)


If ($result_b)
	$payload:=jwtPay_ob.payload
	$LicenceUUID:=$payload.UUID_Licence
	
	//$lstSite:=ds.Site.query("UUID_Licence = :1"; $LicenceUUID)
	
	C_OBJECT:C1216($param)
	$param:=(New object:C1471("vt_UUID_Licence"; $LicenceUUID))
	OB SET:C1220($param; "vt_UUID_User"; $payload.UUID_)
	Site_Recherche_Orda($param)
	
	$lstSite:=List_Sites
	
	C_OBJECT:C1216($template)
	C_TEXT:C284($chaineJSON)
	OB SET:C1220($template; "UUID_"; ->[Site:10]UUID_:68)
	OB SET:C1220($template; "Nom"; ->[Site:10]Nom:42)
	OB SET:C1220($template; "Societe"; ->[Site:10]Societe:73)
	OB SET:C1220($template; "Entite"; ->[Site:10]Entite:10)
	OB SET:C1220($template; "Etat"; ->[Site:10]Etat:101)
	OB SET:C1220($template; "Total_Pathologie"; ->[Site:10]Total_Pathologie:131)
	OB SET:C1220($template; "Total_A_Payer"; ->[Site:10]Total_A_Payer:130)
	OB SET:C1220($template; "Date_DOC_String"; ->[Site:10]Date_DOC:55)
	OB SET:C1220($template; "Date_PVRecep_String"; ->[Site:10]Date_PVRecep:56)
	OB SET:C1220($template; "Date_Prev_Trans_String"; ->[Site:10]Date_Prev_Trans:61)
	OB SET:C1220($template; "Date_Transfert_String"; ->[Site:10]Date_Transfert:58)
	OB SET:C1220($template; "Code_Chantier"; ->[Site:10]Code_Chantier:63)
	OB SET:C1220($template; "Adresse1"; ->[Site:10]Adresse1:11)
	OB SET:C1220($template; "Code_compta"; ->[Site:10]Code_compta:40)
	OB SET:C1220($template; "CP"; ->[Site:10]CP:13)
	OB SET:C1220($template; "Ville"; ->[Site:10]Ville:14)
	OB SET:C1220($template; "Domaine_Activite"; ->[Site:10]Type_Ouvrage:19)
	OB SET:C1220($template; "Me_Ouvrage"; ->[Site:10]Me_Ouvrage:54)
	OB SET:C1220($template; "Proprietaire"; ->[Site:10]Proprietaire:53)
	OB SET:C1220($template; "_Date_Modif"; ->[Site:10]_Date_Modif:5)
	OB SET:C1220($template; "_Date_Crea"; ->[Site:10]_Date_Crea:2)
	
	USE ENTITY SELECTION:C1513($lstSite)
	$chaineJSON:=Selection to JSON:C1234([Site:10]; $template)
	WEB SEND TEXT:C677($chaineJSON; "application/json")
	
Else 
	C_OBJECT:C1216($obj)
	$obj:=New object:C1471("error"; "token invalide")
	C_TEXT:C284($vT)
	$vT:="X-STATUS: 401"
	WEB SET HTTP HEADER:C660($vT)
	$resp:=JSON Stringify:C1217($obj)
	WEB SEND TEXT:C677($resp; "application/json")
End if 