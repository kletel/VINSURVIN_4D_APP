Case of 
	: (Form event code:C388=Sur chargement:K2:1)
		_O_ARRAY STRING:C218(40; Z_Zones; 20)
		V_Val:=""
		
		Z_Zones{1}:="Naam"
		Z_Zones{2}:="Herkomstbenaming"
		Z_Zones{3}:="Producent"
		Z_Zones{4}:="Type"
		Z_Zones{5}:="Regio"
		Z_Zones{6}:="Jaartal"
		Z_Zones{7}:="Aantal flessen"
		Z_Zones{8}:="Gedronken"
		Z_Zones{9}:="Hoogtepunt"
		Z_Zones{10}:="Aankoopprijs"
		Z_Zones{11}:="Plaats van aankoop"
		Z_Zones{12}:="Botteling"
		Z_Zones{13}:="Wijnflessensoort"
		Z_Zones{14}:="Rijping"
		Z_Zones{15}:="Cijfer op 20"
		Z_Zones{16}:="Aankoopprijs"
		Z_Zones{17}:="Waarde"
		Z_Zones{18}:="Opmerkingen"
		Z_Zones{19}:="Rest in de kelder"
		Z_Zones{20}:="Aankoopprijs"
		
		_O_ARRAY STRING:C218(80; Z_Compar; 8)
		Z_Compar{1}:="is gelijk aan"
		Z_Compar{2}:="is verschillend van"
		Z_Compar{3}:="is beter dan"
		Z_Compar{4}:="is beter dan of gelijk aan"
		Z_Compar{5}:="is minder dan"
		Z_Compar{6}:="is minder dan of gelijk aan"
		Z_Compar{7}:="bevat"
		Z_Compar{8}:="bevat niet"
		
		ARRAY INTEGER:C220(Z_Rech_1_1; 1)
		ARRAY INTEGER:C220(Z_Rech_2_1; 1)
		_O_ARRAY STRING:C218(80; Z_Rech_1; 1)
		_O_ARRAY STRING:C218(80; Z_Rech_2; 1)
		_O_ARRAY STRING:C218(80; Z_Rech_3; 1)
		Z_Rech_1_1{1}:=0
		Z_Rech_2_1{1}:=0
		Z_Rech_1{1}:=""
		Z_Rech_2{1}:=""
		Z_Rech_3{1}:=""
		Po:=1
		Z_Rech_1:=po
		Z_Rech_2:=po
		Z_Rech_3:=po
End case 

