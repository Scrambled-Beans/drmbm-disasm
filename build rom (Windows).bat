@echo off

:: Set the File Extension

:: Use: bin

findstr /m "FileExtension=0" "build config.asm"
	cls
	if %errorlevel%==0 (
	
	set FileExtension=bin	
)

:: Use: md

findstr /m "FileExtension=1" "build config.asm"
	cls
	if %errorlevel%==0 (
	
	set FileExtension=md	
)

:: Use: gen
config
findstr /m "FileExtension=2" "build config.asm"
	cls
	if %errorlevel%==0 (
	
	set FileExtension=gen	
)

:: Use: 68K
config
findstr /m "FileExtension=3" "build config.asm"
	cls
	if %errorlevel%==0 (
	
	set FileExtension=68K	
)

:: Use: SGD
config
findstr /m "FileExtension=4" "build config.asm"
	cls
	if %errorlevel%==0 (
	
	set FileExtension=SGD	
)

::--------------------------------------------------------------------------------::

:: Compress Art and Mappings?

findstr /m "CompressArtMap=0" "build config.asm"
	cls
	if %errorlevel%==0 (
	
	GOTO SKIP_COMPRESSION
)

::--------------------------------------------------------------------------------::

:: Nemesis Compression - Accurate or Better 

findstr /m "NemesisCompress=0" "build config.asm"
	cls
	if %errorlevel%==0 (
	
	:: Accurate
	set NemComp=-ca
	
) else (

	:: Better
	set NemComp=-c
)

::--------------------------------------------------------------------------------::

:: Sorcery Compression - files in "resources\art\art_sor\uncompressed"

setlocal enabledelayedexpansion

for /r "resources\art\art_sor\uncompressed" %%f in (*.unc) do (
    set "p=%%~dpnf"
    set "p=!p:%~dp0=!"
    set "p=!p:uncompressed=compressed!"
    tools\windows\puyomdtool compress "%%f" "!p!.sor"
)

::--------------------------------------------------------------------------------::

:: Nemesis Compression - files in "resources\art\art_nem\uncompressed"
	
setlocal enabledelayedexpansion
	
for /r "resources\art\art_nem\uncompressed" %%f in (*.unc) do (
    set "p=%%~dpnf"
    set "p=!p:%~dp0=!"
    set "p=!p:uncompressed=compressed!"
    tools\windows\clownnemesis %NemComp% "%%f" "!p!.nem"
)	

::--------------------------------------------------------------------------------::

:: Puyo1 Conversion - files in "resources\mappings\background\map_puyo1\unconverted"

setlocal enabledelayedexpansion

for /r "resources\mappings\background\map_puyo1\unconverted" %%f in (*.map) do (
    set "p=%%~dpnf"
    set "p=!p:%~dp0=!"
    set "p=!p:unconverted=converted!"
    tools\windows\puyomdtool convert frommap autopal "%%f" "!p!.map_tiles"
)

::--------------------------------------------------------------------------------::

:: Enigma Compression - files in "resources\mappings\background\map_eni\uncompressed"

findstr /m "EnigmaCompress=1" "build config.asm"

:: Only compress if EnigmaCompress is set to 1
	
	if %errorlevel%==0 (

setlocal enabledelayedexpansion

for /r "resources\mappings\background\map_eni\uncompressed" %%f in (*.map) do (
    set "p=%%~dpnf"
    set "p=!p:%~dp0=!"
    set "p=!p:uncompressed=compressed!"
	tools\windows\enicmp "%%f" "!p!.eni"
)
)

::--------------------------------------------------------------------------------::

:: End of Compression

:SKIP_COMPRESSION
endlocal

::--------------------------------------------------------------------------------::

findstr /m "KeepPrevBuild=1" "build config.asm"
	cls
	if %errorlevel%==0 (

:: Delete the Previous Version
    if exist output\Dr_Robotnik's_Mean_Bean_Machine_prev.%FileExtension% del output\Dr_Robotnik's_Mean_Bean_Machine_prev.%FileExtension%
 
:: Rename the Main Version 
	if exist output\Dr_Robotnik's_Mean_Bean_Machine.%FileExtension% rename output\Dr_Robotnik's_Mean_Bean_Machine.%FileExtension% Dr_Robotnik's_Mean_Bean_Machine_prev.%FileExtension%
)

::--------------------------------------------------------------------------------::

:: Build ROM
	tools\windows\clownassembler_asm68k /p /o ae- /o l. drmbm.asm, output\Dr_Robotnik's_Mean_Bean_Machine.%FileExtension%, , output\Dr_Robotnik's_Mean_Bean_Machine.lst > output\log.txt
	
:: Create log.txt file
	type output\log.txt
	
:: Fix header in ROM
	tools\windows\puyomdtool fix output\Dr_Robotnik's_Mean_Bean_Machine.%FileExtension%	
	
::--------------------------------------------------------------------------------::

:: Clear the text	
	cls
		
:: Text to tell user if rom was built	
	
	if not exist output\Dr_Robotnik's_Mean_Bean_Machine.%FileExtension% (
	
	echo The rom has NOT been built.
	echo.
	echo See log report for more details: output\log.txt
	echo.
	
) else (

    echo The rom has SUCCESSFULLY been built.
	echo.
	echo The rom is stored at: output\Dr_Robotnik's_Mean_Bean_Machine.%FileExtension%
	echo. 
)

::--------------------------------------------------------------------------------::

PAUSE

