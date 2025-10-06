//%attributes = {}
// But: créer un fichier de preferences pour VinsurVin
// Parametres
//   $1   -   Action
//   $2   -   type de preference utilisateurs ou tous
// Declarer les parametres
C_TEXT:C284($1; $2)
C_TEXT:C284($tAction)
// Declarer les variables locales

_O_C_STRING:C293(16; $sXML_Reference)
_O_C_STRING:C293(16; $sXML_ElementReference)
C_TEXT:C284($tPreferencesPath)

// Reassigner
$tAction:=$1
$tTypePrefs:=$2


Case of 
	: ($tAction="Create")  //créer
		
		If ($tTypePrefs="allusers")
			$tPreferencesPath:=<>Settingspath
			$sXML_Reference:=DOM Create XML Ref:C861("VinsurVin")
			$tXML_ElementValue:="/VinsurVin/PreferenceSetting/adressemacmachine"
			$sXML_ElementReference:=DOM Create XML element:C865($sXML_Reference; $tXML_ElementValue)
			DOM SET XML ELEMENT VALUE:C868($sXML_ElementReference; V_adressemacmachine)
			If (Size of array:C274(test_Ls_Licences)>0)
				For ($i; 1; Size of array:C274(test_Ls_Licences))
					$tXML_ElementValue:="/VinsurVin/PreferenceSetting/numeroseriekletel"
					$sXML_ElementReference:=DOM Create XML element:C865($sXML_Reference; $tXML_ElementValue)
					DOM SET XML ELEMENT VALUE:C868($sXML_ElementReference; test_Ls_Licences{$i})
				End for 
			End if 
			DOM EXPORT TO FILE:C862($sXML_Reference; $tPreferencesPath)
			DOM CLOSE XML:C722($sXML_Reference)
		End if 
		
		If ($tTypePrefs="user")
			$tPreferencesPath:=<>UserSettingspath
			$sXML_Reference:=DOM Create XML Ref:C861("VinsurVin")
			$tXML_ElementValue:="/VinsurVin/PreferenceSetting/ApplicationName"
			$sXML_ElementReference:=DOM Create XML element:C865($sXML_Reference; $tXML_ElementValue)
			DOM SET XML ELEMENT VALUE:C868($sXML_ElementReference; <>name_application)
			$tXML_ElementValue:="/VinsurVin/PreferenceSetting/Databasepath"
			$sXML_ElementReference:=DOM Create XML element:C865($sXML_Reference; $tXML_ElementValue)
			DOM SET XML ELEMENT VALUE:C868($sXML_ElementReference; <>Databasepath)
			$tXML_ElementValue:="/VinsurVin/PreferenceSetting/versionapplication"
			$sXML_ElementReference:=DOM Create XML element:C865($sXML_Reference; $tXML_ElementValue)
			DOM SET XML ELEMENT VALUE:C868($sXML_ElementReference; <>version_application)
			DOM EXPORT TO FILE:C862($sXML_Reference; $tPreferencesPath)
			DOM CLOSE XML:C722($sXML_Reference)
		End if 
		
	: ($tAction="Load")  //charger
		
		If ($tTypePrefs="allusers")
			$tPreferencesPath:=<>Settingspath
			$sXML_Reference:=DOM Parse XML source:C719($tPreferencesPath)
			$sXML_ElementReference:=DOM Find XML element:C864($sXML_Reference; "/VinsurVin/PreferenceSetting/adressemacmachine")
			DOM GET XML ELEMENT VALUE:C731($sXML_ElementReference; <>adressemacmachinexml)
			_O_ARRAY STRING:C218(16; $tAtrouvés; 0)
			$sXML_ElementReference:=DOM Find XML element:C864($sXML_Reference; "/VinsurVin/PreferenceSetting/numeroseriekletel"; $tAtrouvés)
			
			
			
			If (Size of array:C274($tAtrouvés)>0)
				C_TEXT:C284($licence)
				ARRAY TEXT:C222(xml_Ls_Licences; 0)
				For ($i; 1; Size of array:C274($tAtrouvés))
					$sXML_ElementReference:=$tAtrouvés{$i}
					If ($sXML_ElementReference#"0000000000000000")
						DOM GET XML ELEMENT VALUE:C731($sXML_ElementReference; $licence)
						APPEND TO ARRAY:C911(xml_Ls_Licences; $licence)
					End if 
				End for 
			End if 
			
			DOM CLOSE XML:C722($sXML_Reference)
		End if 
		
		If ($tTypePrefs="user")
			$tPreferencesPath:=<>UserSettingspath
			$sXML_Reference:=DOM Parse XML source:C719($tPreferencesPath)
			$sXML_ElementReference:=DOM Find XML element:C864($sXML_Reference; "/VinsurVin/PreferenceSetting/ApplicationName")
			DOM GET XML ELEMENT VALUE:C731($sXML_ElementReference; <>name_applicationxml)
			$sXML_ElementReference:=DOM Find XML element:C864($sXML_Reference; "/VinsurVin/PreferenceSetting/Databasepath")
			DOM GET XML ELEMENT VALUE:C731($sXML_ElementReference; <>Databasepathxml)
			$sXML_ElementReference:=DOM Find XML element:C864($sXML_Reference; "/VinsurVin/PreferenceSetting/versionapplication")
			DOM GET XML ELEMENT VALUE:C731($sXML_ElementReference; <>version_applicationxml)
			DOM CLOSE XML:C722($sXML_Reference)
		End if 
		
End case 