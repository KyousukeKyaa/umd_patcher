@echo off
echo /*****************************************************************************************/ > debug.log 2>&1
echo /*****************************************************************************************/ >> debug.log 2>&1
echo /***                                                                                   ***/ >> debug.log 2>&1
echo /***  UMD Patcher (v0.1b) is a CLI-based program for patching ISO-formatted UMD rips.  ***/ >> debug.log 2>&1
echo /***  Copyright (C) 2017 Michael Colombo.                                              ***/ >> debug.log 2>&1
echo /***                                                                                   ***/ >> debug.log 2>&1
echo /***  This program is free software: you can redistribute it and/or modify             ***/ >> debug.log 2>&1
echo /***  it under the terms of the GNU General Public License as published by             ***/ >> debug.log 2>&1
echo /***  the Free Software Foundation, either version 3 of the License, or                ***/ >> debug.log 2>&1
echo /***  (at your option) any later version.                                              ***/ >> debug.log 2>&1
echo /***                                                                                   ***/ >> debug.log 2>&1
echo /***  This program is distributed in the hope that it will be useful,                  ***/ >> debug.log 2>&1
echo /***  but WITHOUT ANY WARRANTY; without even the implied warranty of                   ***/ >> debug.log 2>&1
echo /***  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the                     ***/ >> debug.log 2>&1
echo /***  GNU General Public License for more details.                                     ***/ >> debug.log 2>&1
echo /***                                                                                   ***/ >> debug.log 2>&1
echo /***  You should have received a copy of the GNU General Public License                ***/ >> debug.log 2>&1
echo /***  along with this program. If not, see: http://www.gnu.org/licenses/               ***/ >> debug.log 2>&1
echo /***                                                                                   ***/ >> debug.log 2>&1
echo /*****************************************************************************************/ >> debug.log 2>&1
echo /*****************************************************************************************/ >> debug.log 2>&1
echo. >> debug.log 2>&1

echo /****************************************************************************/
echo.
echo UMD Patcher (v0.1b) Copyright (C) 2017 Michael Colombo
echo.
echo This program comes with ABSOLUTELY NO WARRANTY; for details press 'D' key.
echo This is free software, and you are welcome to redistribute it
echo under certain conditions; press 'L' key for details or wait few seconds to skip.
echo.
echo /****************************************************************************/

del /f /q temp.hex >> debug.log 2>&1
echo GPL-A >> debug.log 2>&1

echo 0000	5b 7b 30 30 30 32 31 34  41 30 2d 30 30 30 30 2d   [{000214A0-0000- > temp.hex
echo 0010	30 30 30 30 2d 43 30 30  30 2d 30 30 30 30 30 30   0000-C000-000000 >> temp.hex
echo 0020	30 30 30 30 34 36 7d 5d  0d 0a 50 72 6f 70 33 3d   000046}]..Prop3= >> temp.hex
echo 0030	31 39 2c 31 31 0d 0a 5b  49 6e 74 65 72 6e 65 74   19,11..[Internet >> temp.hex
echo 0040	53 68 6f 72 74 63 75 74  5d 0d 0a 55 52 4c 3d 68   Shortcut]..URL=h >> temp.hex
echo 0050	74 74 70 73 3a 2f 2f 77  77 77 2e 67 6e 75 2e 6f   ttps://www.gnu.o >> temp.hex
echo 0060	72 67 2f 6c 69 63 65 6e  73 65 73 2f 71 75 69 63   rg/licenses/quic >> temp.hex
echo 0070	6b 2d 67 75 69 64 65 2d  67 70 6c 76 33 2e 65 6e   k-guide-gplv3.en >> temp.hex
echo 0080	2e 68 74 6d 6c 0d 0a 49  44 4c 69 73 74 3d 0d 0a   .html..IDList=.. >> temp.hex

del /f /q GPLv3.url >> debug.log 2>&1
echo GPL-B >> debug.log 2>&1

certutil.exe -v -decodehex temp.hex GPLv3.url >> debug.log 2>&1
echo GPL-C >> debug.log 2>&1

del /f /q temp.hex >> debug.log 2>&1
echo GPL-D >> debug.log 2>&1

rem SetLocal EnableExtensions
rem SetLocal EnableDelayedExpansion

Choice /N /C DLS /T 2 /D S /M "" >> debug.log 2>&1
If Errorlevel 3 Goto SKIP
If Errorlevel 2 Goto LCH
If Errorlevel 1 Goto DCH

:LCH
Start GPLv3.url
Goto SKIP

:DCH
Start GPLv3.url
Goto SKIP

:SKIP
CLS

IF EXIST "SAO.iso" (
    GOTO VERIFY
) ELSE (
    @ECHO SAO.iso Not Found.
    @ECHO You need to rename your file to "SAO.iso" first.
    GOTO EXIT
)

:VERIFY
SET FileSize1=1200226304 >> debug.log 2>&1
FOR %%I IN (SAO.iso) DO SET FileSize2=%%~zI >> debug.log 2>&1
IF %FileSize1% NEQ %FileSize2% (
    @ECHO /*** ERROR START ***/ >> debug.log 2>&1
    @ECHO 000 >> debug.log 2>&1
    CertUtil -hashfile "SAO.iso" MD5 >> debug.log 2>&1
    @ECHO 000 >> debug.log 2>&1
    @ECHO Unexpected file size: %FileSize2% bytes. >> debug.log 2>&1
    @ECHO 000 >> debug.log 2>&1
    @ECHO /*** ERROR END ***/ >> debug.log 2>&1
    @ECHO SAO.iso file size is %FileSize2% bytes, not %FileSize1% bytes.
    @ECHO Your file might be encrypted, damaged or from a different release.
    @ECHO In order to use this patch, you need the intended decrypted UMD rip.
    @ECHO If you believe this is a mistake, contact the patch maintainers on the website.
    @ECHO A debug.log file has been generated. This patch will be stopped now.
    GOTO EXIT
) ELSE (
    @ECHO SAO.iso Found!
    @ECHO Close all other programs before continuing.
    @ECHO This is a BETA patch. Make a backup copy of your SAO.iso to use for future updates.
    @ECHO NOTE: you need at least 3GB free disk space to use this patch - for temporary files.
    PAUSE
    @ECHO Proceeding with patching...
)

timeout /t 3 /nobreak >nul
cls

rem ***Note: old debug.log file will be erased at every start***
echo Logging output... >> debug.log 2>&1
echo ----------------- >> debug.log 2>&1

echo.
echo........................................................................................................................................................................................................
echo........................................??~...,,MMO........................................?I=..........................OMM.....................................................DI......................
echo.....DZ........ZMN......................MM:...,MM.M..MMMMMMMMMMMMMMMO......................MMI..........................8MM.........MM~..............?MMMMMMMMMMZ.............,MMM...MMZ................
echo.....DMM.......MM8......................MM,................~$$..$MM~.......................MMI..................MMMMMMMMMMMMMMMMM....NMMM.................................,.$MMD......ZMMM:........,....
echo......8MM.....,MM.......................MMMMI..............ZMMNMM7.........................MMMM$.........MMMZ..........MMMM............~.......,MM=.MMMMMMMMMMMMMMZ.......MMMM..........,........MMN....
echo..............MM7...MMMMMMMMMMMMMMMMM:..MM:7MNMMM+.........8MMZ~......~MMMMMMMMMMMMMMMMM,..MM$7MMMMM+....MMMD........IMM8MM...................8MM:.............+MM....?MMMN.MM,................=MMZ.....
echo............OMM=........................MM:.....?..........MM~.............................MMI.....?...............NMM:.8MM................,MMN7..............?MM....DM,....MM...............NMMN.......
echo..........DMMM..........................MM:..............:MM$..............................MMI..................$MMM=...8MM...........:8MMMMM,..............:MMM............MM.........:7MMMMMI.........
echo......,MMMM?............................MM,............ZMMM................................MMI........................I?MMN........DMMMM8:..............:NMMMD..............MM,.....:MMMMN?.............
echo........................................................................................................................................................................................................
echo........................................................................................................................................................................................................
echo..................................................,DMM=.MN..MN..M8..7MMO...MMMN=.?MMM8.......MN...MMMM+.+MMMMM....:DMN~..MM..,M:DM....MD.MM..$M.MMMMM...................................................
echo..................................................MD....+M.8MM,$M.,MD..=N7.MI.~M~?M..~MZ....MMM:..MD..MI..7M.....MM...MM.MMM+,M:DM....MN.MMM.$M.MM......................................................
echo...................................................:OMM..MNM+MMMO.?M,...MM.MMMMD.?M...MM...?M.8M..MMMMN...7M.....MN...OM.MM,M8M:DM....MN.MZIMDM.MMNNM...................................................
echo..................................................NMMM8..:MM..MM...,MMMMI..MI.DM.?MMMMI....M7,.MM.MD.$M...7M......8MMMN..MM..MM:DMMMM.MN.MZ..MM.MMMMM...................................................
echo........................................................................................................................................................................................................
echo.........................................................................................INFINITY....MOMENT.............................................................................................
echo........................................................................................................................................................................................................
echo......................................................................................ENGLISH....BETA....PATCH..........................................................................................
echo........................................................................................................................................................................................................
echo.

echo Patching started. (NOTE: it will take SOME time)
echo Passage 1/9...

echo /*** PASSAGE 1 START ***/ >> debug.log 2>&1
echo 001 >> debug.log 2>&1

mkdir temp >> debug.log 2>&1
echo 001.0 >> debug.log 2>&1

rd /s /q "%imhere%temp\PSP_GAME" >> debug.log 2>&1
echo 001.1 (cleanup) >> debug.log 2>&1

7-zip.exe x SAO.iso PSP_GAME/INSDIR/INSTALL.DAT -otemp >> debug.log 2>&1
echo 002 >> debug.log 2>&1

del /f /q INSTALL.DAT >> debug.log 2>&1
echo 002.1 (cleanup) >> debug.log 2>&1

set imhere=%~dp0
move /y "%imhere%temp\PSP_GAME\INSDIR\INSTALL.DAT" "%imhere%INSTALL.DAT" >> debug.log 2>&1
echo 003 >> debug.log 2>&1

rd /s /q "%imhere%temp\PSP_GAME" >> debug.log 2>&1
echo 004 >> debug.log 2>&1

CertUtil -hashfile "INSTALL.DAT" MD5 >> debug.log 2>&1
echo 005 >> debug.log 2>&1

echo /*** PASSAGE 1 END ***/ >> debug.log 2>&1
echo 006 >> debug.log 2>&1

echo Passage 2/9...

echo /*** PASSAGE 2 START ***/ >> debug.log 2>&1
echo 007 >> debug.log 2>&1

del /f /q DATA.BIN >> debug.log 2>&1
echo 007.1 (cleanup) >> debug.log 2>&1

ren INSTALL.DAT DATA.BIN >> debug.log 2>&1
echo 008 >> debug.log 2>&1

del /f /q header vkey >> debug.log 2>&1
echo 008.1 (cleanup) >> debug.log 2>&1

pgdecrypt.exe >> debug.log 2>&1
echo 009 >> debug.log 2>&1

del /f /q DATA.BIN header vkey >> debug.log 2>&1
echo 010 >> debug.log 2>&1

del /f /q install-jp.dat >> debug.log 2>&1
echo 010.1 (cleanup) >> debug.log 2>&1

ren DATA.BIN.decrypt install-jp.dat >> debug.log 2>&1
echo 011 >> debug.log 2>&1

CertUtil -hashfile "install-jp.dat" MD5 >> debug.log 2>&1
echo 012 >> debug.log 2>&1

echo /*** PASSAGE 2 END ***/ >> debug.log 2>&1
echo 013 >> debug.log 2>&1

echo Passage 3/9...

echo /*** PASSAGE 3 START ***/ >> debug.log 2>&1
echo 014 >> debug.log 2>&1

rd /s /q "%imhere%temp\install-jp" >> debug.log 2>&1
echo 014.1 (cleanup) >> debug.log 2>&1

mkdir "%imhere%temp\install-jp" >> debug.log 2>&1
echo 015 >> debug.log 2>&1

start /wait cmd /c quickbms.bat
rem ***016 from quickbms.bat***
echo 017 >> debug.log 2>&1

du -q -v "%imhere%temp\install-jp" >> debug.log 2>&1
echo 018 >> debug.log 2>&1

del /f /q install-jp.dat >> debug.log 2>&1
echo 019 >> debug.log 2>&1

echo /*** PASSAGE 3 END ***/ >> debug.log 2>&1
echo 020 >> debug.log 2>&1

echo Passage 4/9...

echo /*** PASSAGE 4 START ***/ >> debug.log 2>&1
echo 021 >> debug.log 2>&1

rd /s /q install-jp >> debug.log 2>&1
echo 021.1 (cleanup) >> debug.log 2>&1

move "%imhere%temp\install-jp" "%imhere%install-jp" >> debug.log 2>&1
echo 022 >> debug.log 2>&1

du.exe -nobanner -q -v install-jp >> debug.log 2>&1
echo 022.0 >> debug.log 2>&1

del /f /q install-jp.tar >> debug.log 2>&1
echo 022.1 (cleanup) >> debug.log 2>&1

tar.exe --owner=0 --group=0 --numeric-owner --mtime="@${ZA_WARUDO}" -cf install-jp.tar install-jp >> debug.log 2>&1
echo 023 >> debug.log 2>&1

CertUtil -hashfile "install-jp.tar" MD5 >> debug.log 2>&1
echo 024 >> debug.log 2>&1

7-zip.exe t "install-jp.tar" >> debug.log 2>&1
echo 025 >> debug.log 2>&1

rd /s /q install-jp >> debug.log 2>&1
echo 026 >> debug.log 2>&1

echo /*** PASSAGE 4 END ***/ >> debug.log 2>&1
echo 027 >> debug.log 2>&1

echo Passage 5/9...

echo /*** PASSAGE 5 START ***/ >> debug.log 2>&1
echo 028 >> debug.log 2>&1

del /f /q install-en.tar >> debug.log 2>&1
echo 028.1 (cleanup) >> debug.log 2>&1

xdelta.exe -d -vfs "install-jp.tar" "xdelta-patch.xdelta" "install-en.tar" >> debug.log 2>&1
echo 029 >> debug.log 2>&1

CertUtil -hashfile "install-en.tar" MD5 >> debug.log 2>&1
echo 030 >> debug.log 2>&1

7-zip.exe t "install-en.tar" >> debug.log 2>&1
echo 031 >> debug.log 2>&1

del /f /q install-jp.tar >> debug.log 2>&1
echo 032 >> debug.log 2>&1

echo /*** PASSAGE 5 END ***/ >> debug.log 2>&1
echo 033 >> debug.log 2>&1

echo Passage 6/9...

echo /*** PASSAGE 6 START ***/ >> debug.log 2>&1
echo 034 >> debug.log 2>&1

rd /s /q "%imhere%temp\install-en" >> debug.log 2>&1
echo 034.1 (cleanup) >> debug.log 2>&1

7-zip.exe x install-en.tar -otemp >> debug.log 2>&1
echo 035 >> debug.log 2>&1

du.exe -nobanner -q -v "temp\install-en" >> debug.log 2>&1
echo 036 >> debug.log 2>&1

del /f /q install-en.tar >> debug.log 2>&1
echo 037 >> debug.log 2>&1

echo /*** PASSAGE 6 END ***/ >> debug.log 2>&1
echo 038 >> debug.log 2>&1

echo Passage 7/9...

echo /*** PASSAGE 7 START ***/ >> debug.log 2>&1
echo 039 >> debug.log 2>&1

del /f /q INSTALL.DAT >> debug.log 2>&1
echo 039.1 (cleanup) >> debug.log 2>&1

cpkmakec.exe "temp\install-en" INSTALL.cpk -mode=FULL -code=UTF-8 -view >> debug.log 2>&1
echo 040 >> debug.log 2>&1

ren INSTALL.cpk INSTALL.DAT >> debug.log 2>&1
echo 041 >> debug.log 2>&1

CertUtil -hashfile "INSTALL.DAT" MD5 >> debug.log 2>&1
echo 042 >> debug.log 2>&1

rd /s /q "%imhere%temp\install-en" >> debug.log 2>&1
echo 043 >> debug.log 2>&1

echo Passage 8/9...

echo /*** PASSAGE 8 START ***/ >> debug.log 2>&1
echo 044 >> debug.log 2>&1

echo. && echo Your SAO.iso (Japanese) will be patched in a moment.
echo If you haven't already made a backup, do you want to make a backup copy now?

for /f "tokens=2 delims==" %%a in ('wmic OS Get localdatetime /value') do set "dt=%%a"
set "YY=%dt:~2,2%" & set "YYYY=%dt:~0,4%" & set "MM=%dt:~4,2%" & set "DD=%dt:~6,2%"
set "HH=%dt:~8,2%" & set "Min=%dt:~10,2%" & set "Sec=%dt:~12,2%"
set "datestamp=%YYYY%%MM%%DD%" & set "timestamp=%HH%%Min%%Sec%"

CHOICE /C YN /M "Press key"
IF ERRORLEVEL 2 (
    GOTO FINAL
) ELSE (
    @ECHO 044-A1 >> debug.log 2>&1
    ROBOCOPY "%imhere% " "%imhere%Backup " SAO.iso >> debug.log 2>&1
    @ECHO 044-A2 >> debug.log 2>&1
    CertUtil -hashfile "Backup\SAO.iso" MD5 >> debug.log 2>&1
    @ECHO 044-A3 >> debug.log 2>&1
    7-zip.exe t "Backup\SAO.iso" >> debug.log 2>&1
    @ECHO 044-A4 >> debug.log 2>&1
    @ECHO Backup Done.
    GOTO CHECKF
)

:CHECKF
IF EXIST "Backup\SAO.iso" (
    GOTO ZCHECK
) ELSE (
    7-zip.exe a -m0=lzma2 -mx debug-%datestamp%-%timestamp%.7z debug.log >nul
    @ECHO ERROR: cannot find backup file, something went wrong. All actions will be stopped.
    @ECHO Please send debug-%datestamp%-%timestamp%.7z file to the patch authors.
    PAUSE
    GOTO EXIT
)

:ZCHECK
FOR %%I IN (Backup\SAO.iso) DO SET BackupSize1=%%~zI
IF %FileSize1% EQU %BackupSize1% (
    GOTO:FINAL
) ELSE (
    @ECHO /*** ERROR START ***/ >> debug.log 2>&1
    @ECHO 044-B1 >> debug.log 2>&1
    CertUtil -hashfile "Backup\SAO.iso" MD5 >> debug.log 2>&1
    @ECHO 044-B2 >> debug.log 2>&1
    7-zip.exe t "Backup\SAO.iso" >> debug.log 2>&1
    @ECHO 044-B3 >> debug.log 2>&1
    @ECHO Unexpected Backup Size: %BackupSize1% >> debug.log 2>&1
    @ECHO 044-B4 >> debug.log 2>&1
    @ECHO /*** ERROR END ***/ >> debug.log 2>&1
    7-zip.exe a -m0=lzma2 -mx debug-%datestamp%-%timestamp%.7z debug.log >nul
    @ECHO ERROR: the backup wasn't generated correctly. All actions will be stopped.
    @ECHO Please send debug-%datestamp%-%timestamp%.7z file to the patch authors.
    PAUSE
    GOTO EXIT
)

:FINAL
echo Compressing log file...
7-zip.exe a -m0=lzma2 -mx debug-%datestamp%-%timestamp%.7z debug.log

echo - To Be Continued... (see Memo.txt)
:EXIT
PAUSE
