//%attributes = {}
If (False:C215)
	// Method: WIN_fIsWindows({ptr}) -> Boolean
	// Module: Windows Management
	// 4D University Programming Classes
	// Purpose: Checks to see if running on platform
End if 

C_POINTER:C301($1; $pType)  // Pointer to Type variable

// Declare local variables
C_LONGINT:C283($LCountParamters)
C_LONGINT:C283($LPlatform)  // Platform type
C_LONGINT:C283($LSystemVersion)  // System version
C_LONGINT:C283($LMajorVersion)  // System Major version
C_LONGINT:C283($LMinorVersion)  // System Major version
C_LONGINT:C283($LProcessor)  // Processor type

_O_PLATFORM PROPERTIES:C365($LPlatform; $LSystemVersion; $LProcessor)

$LCountParamters:=Count parameters:C259

If ($LCountParamters>0)
	$pType:=$1
End if 

If ($LPlatform=Windows:K25:3)
	$0:=True:C214
	If ($LCountParamters>0)
		If ($LSystemVersion>0)
			$LMajorVersion:=((2^30)+$LSystemVersion)%256
			$LMinorVersion:=(((2^30)+$LSystemVersion)\256)%256
			Case of 
				: ($LMajorVersion=4)  // NT 4.0
					$pType->:=$LMajorVersion
				: ($LMajorVersion=5)
					Case of 
						: ($LMinorVersion=0)  //Windows 2000
							$pType->:=$LMinorVersion
						: ($LMinorVersion=1)  //Windows XP
							$pType->:=$LMinorVersion
						Else 
							$pType->:=$LMinorVersion
					End case 
			End case 
		End if 
	End if 
Else 
	$0:=False:C215
	If ($LCountParamters>0)
		$pType->:=$LSystemVersion\256
	End if 
End if 
