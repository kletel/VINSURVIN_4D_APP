//%attributes = {}
C_TEXT:C284($0)

ARRAY LONGINT:C221($match_positions; 0)
ARRAY LONGINT:C221($match_lengths; 0)

C_LONGINT:C283($i)
$i:=1

C_BLOB:C604($stdin; $stdout; $stderr)

C_LONGINT:C283($platform)
_O_PLATFORM PROPERTIES:C365($platform)

If ($platform=Mac OS:K25:2)
	
	LAUNCH EXTERNAL PROCESS:C811("system_profiler SPNetworkDataType"; $stdin; $stdout; $stderr)
	
	$profile:=Convert to text:C1012($stdout; "utf-8")
	
	//just get the first address, typically the Network/Ethernet/Ethernet interface
	If (Match regex:C1019("(?m)(\\S+$)\\s*MAC Address:\\s(.+$)"; $profile; $i; $match_positions; $match_lengths))
		
		$MAC:=Substring:C12($profile; $match_positions{2}; $match_lengths{2})
		
		$0:=Uppercase:C13($MAC)
		
	End if 
	
Else 
	
	SET ENVIRONMENT VARIABLE:C812("_4D_OPTION_HIDE_CONSOLE"; "true")
	LAUNCH EXTERNAL PROCESS:C811("ipconfig /All"; $stdin; $stdout; $stderr)
	
	$configuration:=Convert to text:C1012($stdout; "iso-8859-15")
	
	//just get the first address, typically the Ethernet Adapter/LAN interface
	If (Match regex:C1019("(?m)(\\S+$)\\s*Physical Address[^:]+:\\s(.+$)"; $configuration; $i; $match_positions; $match_lengths))
		
		$MAC:=Substring:C12($configuration; $match_positions{2}; $match_lengths{2})
		
		$0:=Replace string:C233($MAC; "-"; ":")
		
	End if 
	If (Match regex:C1019("(?m)(\\S+$)\\s*Adresse physique[^:]+:\\s(.+$)"; $configuration; $i; $match_positions; $match_lengths))
		
		$MAC:=Substring:C12($configuration; $match_positions{2}; $match_lengths{2})
		
		$0:=Replace string:C233($MAC; "-"; ":")
		
	End if 
	
	
	
End if 