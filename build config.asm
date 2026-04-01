; --------------------------------------------------------------
; Build Settings (Text Script)
; --------------------------------------------------------------

CompressArtMap=1			; 0 = Don't compress the Art and Mappings
							; 1 =    Do compress the Art and Mappings
				
NemesisCompress=0			; 0 = Accurate Nemesis Compression
							; 1 = Improved Nemesis Compression

EnigmaCompress=0			; 0 = Don't compress the Enigma mappings
							; 1 =    Do compress the Enigma mappings	
							
KeepPrevBuild=1				; 0 = Don't keep a copy of the previous Build
							; 1 =    Do keep a copy of the previous Build
							
FileExtension=2				; The following File Extensions tell the user 
							; that the ROM is in the raw binary format.
							;
							; Which one you use is down to preference.
							;
							; 		0 = .bin | Binary (recommended)
							; 		1 = .md  | Sega Mega Drive (Japan or Europe)
							; 		2 = .gen | Sega Genesis (North American)
							; 		3 = .68K | Motorola 68000 Series (Used by Sega)
							; 		4 = .SGD | Sega Development (Used by Sega)
														
; --------------------------------------------------------------
; Build Flags (ROM)
; --------------------------------------------------------------
							
ConsoleHeader:		equ 1	; 0 = Header says "SEGA MEGA DRIVE"
							; 1 = Header says "SEGA GENESIS"
							
RegionCode:			equ 1	; 0 = J - Japan
							; 1 = U - USA
							; 2 = E - Europe

EuropeFixes:		equ 0	; 0 = Don't include fixes from Europe version
							; 1 =    Do include fixes from Europe version
							
RegionLock:			equ 0   ; 0 = Only work on Sega Genesis Consoles (English/NTSC)
							; 1 = Only work on Sega Mega Drive Consoles (English/PAL)
							; 2 = Work on any Sega Genesis/Mega Drive Consoles
							
BugFixes:			equ 0	; 0 = Keep bugs from Puyo Puyo (Arcade - Rev A) 
							; 1 =  Fix bugs from Puyo Puyo (Arcade - Rev B) 
							;
							;   	Fix 1 - The AI won't lose its ability to manually 
							;		        drop Beans if the other controller is
							;				held to the left or right.
							;
							;		Fix 2 - Only select 28 letters instead of 29 letters
							;				when pressing UP on the HIGH SCORES board.
							
; --------------------------------------------------------------
; Build Flags (SRAM)
; --------------------------------------------------------------

EnableSRAM:			equ 0	; 0 = Disable SRAM
							; 1 = Enable SRAM
							
ReadWriteType:		equ 3	; 3 =     Odd Only - SRAM (recommended)
							; 2 =    Even Only - SRAM
							; 0 = Odd and Even - SRAM
							; 1 = Serial EEPROMS (RAMs with 4-bit data bus, etc)
														
DeviceType:			equ 1	; 1 = SRAM
							; 2 = EEPROM	

SizeSRAM:			equ 0	; 0 =  8 KB ( 64 Kb)
							; 1 = 32 KB (256 Kb)
							
; --------------------------------------------------------------