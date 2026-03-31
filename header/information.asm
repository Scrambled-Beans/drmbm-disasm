; --------------------------------------------------------------
; ROM Information
; --------------------------------------------------------------
				
				if ConsoleHeader=1		; Genesis
Console:		DC.b "SEGA GENESIS    " 	; Hardware System ID (Console name)

				else					; Mega Drive
				DC.b "SEGA MEGA DRIVE " 	; Hardware System ID (Console name)
				endc

Date:			dc.b "(C)SEGA 1993.SEP" 	; Copyright holder and release date (usually the year)

Title_Local:	DC.b "Dr. Robotnik's Mean Bean Machine                " ; Domestic Name
Title_Int:		DC.b "Dr. Robotnik's Mean Bean Machine                " ; International Name

				if RegionCode=0			; Japan
Serial: 		DC.b "GM MK-1706 -40"  		; Serial/Version number
				
				elseif RegionCode=2		; Europe
				DC.b "GM MK-1706 -50"  		; Serial/Version number		
				
				elseif					; USA
				DC.b "GM MK-1706 -00"  		; Serial/Version number	
				endc

Checksum:		DC.w $0			            ; Checksum
Support:		DC.b "J               "		; I/O Support

RomStartLoc:	DC.l StartOfRom				; Start address of ROM
RomEndLoc:		DC.l EndOfRom-1				; End address of ROM

RamStartLoc:	DC.l $00FF0000				; Start address of RAM
RamEndLoc:		DC.l $00FFFFFF				; End address of RAM

SRAMSupport:	if EnableSRAM=1
				DC.b $52, $41, $A0+(EnableSRAM<<6)+(ReadWriteType<<3), $0+(DeviceType<<5)
				DC.l SRAM_START				; SRAM start ($200001)
				
				if SizeSRAM=0			;  8 KB ( 64 Kb)
				DC.l SRAM_END_64			;   SRAM end ($203FFF)
				
				elseif SizeSRAM=1		; 32 KB (256 Kb)
				DC.l SRAM_END_256			;   SRAM end ($20FFFF)
				
				else					; EEPROM
				DC.l SRAM_START				;   SRAM end ($200001)
				endc
				
				else
				DC.l $20202020
				DC.l $20202020
				DC.l $20202020
				endc
								  
ModemSupport:	DC.b "            "			; Modem support

Notes:			DC.b "                                        " ; Notes (unused, anything can be put in this space, but it has to be 40 bytes.)

				if RegionCode=0			; Japan
Region: 		DC.b "J               "  	; Region (Country Code)
				
				elseif RegionCode=2		; Europe
				DC.b "E               "  	; Region (Country Code)	
				
				elseif					; USA
				DC.b "U               "  	; Region (Country Code)	
				endc

; --------------------------------------------------------------