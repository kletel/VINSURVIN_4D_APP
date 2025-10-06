$z:=10

$codelang:="fr"  //fr, de ou en...

$URL:="http://maps.google.fr/maps?f=q&"
$URL:=$URL+"hl="+$codelang+"&"
$address:=Supp_acc([Producteur:13]Adresse:5)+",+"+_O_Mac to Win:C463([Producteur:13]Ville:7)+",+"
If ([Producteur:13]Pays:8="")
	$address:=$address+",+"+"France"
Else 
	$address:=$address+",+"+_O_Mac to Win:C463([Producteur:13]Pays:8)
End if 
$address:=Replace string:C233($address; " "; "+")
$URL:=$URL+"q="+$address+"&ie=UTF8&z="+String:C10($z)  // zoom
$URL:=$URL+"&iwloc=addr"

WA OPEN URL:C1020(z_Web; $URL)