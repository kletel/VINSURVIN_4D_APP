//%attributes = {"publishedWeb":true}
// Project method GetHTTPField
// GetHTTPField (Text) -> Text
// GetHTTPField (HTTP header name) -> HTTP header content

var $0; $1 : Text
var $vlItem : Integer

ARRAY TEXT:C222($names; 0)
ARRAY TEXT:C222($values; 0)
$0:=""
WEB GET HTTP HEADER:C697($names; $values)
$vlItem:=Find in array:C230($names; $1)
If ($vlItem>0)
	$0:=$values{$vlItem}
End if 